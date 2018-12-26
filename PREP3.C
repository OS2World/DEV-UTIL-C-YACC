/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 PREP - Preprocessor for YACC
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 Preprocessor for YACC Programs
  KEYWORDS:	 Preprocessor IBM YACC LEX UNIX
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:      PREP3.C
  WARNINGS:	 This program is not for the casual user. It will
		 be useful primarily to expert developers.
  CRC:		 N/A
  SEE-ALSO:	 LEX and YACC
  AUTHORS:	 Scott Guthery 11100 leafwood lane Austin, TX 78750
  COMPILERS:	 DESMET-C
  REFERENCES:	 UNIX Systems Manuals
*/

#include        <stdio.h>
#include        "prep.h"

/*
 *
 *      J van Katwijk
 *      Delft University of Technology,
 *      Department of Mathematics,
 *      132 Julianalaan
 *      Delft, The Netherlands
 *
 *      See for a functional description:
 *
 *      SIGPLAN NOTICES
 *      October 1983, 18 (10) pp 12 .. 16
 */
/*
 *      low level data/stack management routines for
 *      YACC preprocessor.
 *
 */

/*
 *      tags:
 */
static char name_array [TAGSIZE];
static char *tag_base = &name_array [0];


static int eq_tags (x, y)
register char *x, *y;
{
        while (*x == *y && *x != (char)0 && *y != (char)0)
              { x++;
                y++;
              }

        return (*x == *y);
}

char *new_tag (t)
register char *t;
{
        register char *l_base = tag_base;

        while ( (*tag_base = *t) != (char)0)
        { tag_base ++;
          t++;
        }

        tag_base ++;    /* set for next definition */
        return l_base;
}

/*
 *      dealing with types and unions
 */

struct {
        int el_cnt;
        struct type_elem descr[MAXDEF];

} type_descr;

/*
 *      somewhere a definition of a union of all
 *      attribute element types is generated:
 */

print_union ()
{
        register int i;
        register struct type_elem *x;

        if (type_descr.el_cnt == 0) return;    /* nothing */

        fprintf (foutput, "\n#ifndef ATT_SIZE\n");
        fprintf (foutput, "#define ATT_SIZE     150\n");
        fprintf (foutput, "#endif\n");
        fprintf (foutput, "\nunion _attr_elem {\n");

        for (i = 0; i < type_descr.el_cnt; i++)
        {   x = &type_descr.descr[i];
            fprintf (foutput, "  %s  _t%d;\n",
                                x -> type_name, x -> un_number);
        }

        fprintf (foutput, "} _attr_stack [ATT_SIZE];\n");
        fprintf (foutput, "union _attr_elem *_ap =");
        fprintf (foutput, "      &_attr_stack [ATT_SIZE - 1];\n");
}

struct type_elem *add_type (t)
register char *t;
{
        register int i;
        register struct type_elem *x, *y;

        for (i = 0; i < type_descr.el_cnt; i++)
            { x = &type_descr.descr[i];
              if (eq_tags (t, x -> type_name))
                 return x;
            }

        if (type_descr.el_cnt >= MAXDEF)
           error (FATAL,
                   "too many attribute defs: line %d\n", lineno);

        x = &type_descr.descr[type_descr.el_cnt];
        x -> type_name = new_tag (t);
        x -> un_number = type_descr.el_cnt ++;

        return x;
}

/*
 *      attribute definitions
 */
struct att_def attrib_defs [NONTERM];

static int ndefs = 0;
/*
 *      functions to be defined:
 *
 *              set_input       enter input attrib in def
 *              set_output      enter output attrib in def
 *              in_pars         number of inpars
 *              out_pars        number of outpars
 *              new_def         enter new non terminal
 *              lookup          look for nonterm.
 *              checkdefs       check all attributed symbols to be on lhs
 *              setdefined      set non terminal defined as lhs
 */

setdefined (t)
struct att_def *t;
{
        if (t != (char)0)
           t-> hasdefinition = (char)1;
}

checkdefs ()
{
        register int i;

        for (i = 0; i < ndefs; i ++)
            if (attrib_defs[i].hasdefinition == (char) 0)
               error (WARNING, "%s not as lhs", attrib_defs[i].nonterm);
}

struct att_def *lookup (t)
register char *t;
{
        register int i;

        for (i = 0; i < ndefs; i++)
            if (eq_tags (t, attrib_defs [i].nonterm))
               return &attrib_defs [i];

        return (struct att_def *)0;
}

struct att_def *new_def (t)
register char *t;
{
        register struct att_def *x;

        if (lookup (t) != (struct att_def *)0)
           error (FATAL, "double definition line %d\n", lineno);

        if (ndefs >= NONTERM)
           error (FATAL, "too much non terminals line %d\n", lineno);

        x = &attrib_defs [ndefs ++];
        x->i_par = 0;
        x->o_par = 0;
        x->nonterm = new_tag (t);
        x->hasdefinition = (char)0;

        return x;
}

set_input (def, typename)

register struct att_def *def;
register char *typename;
{
        register struct att_def *y;

        if (def -> i_par >= MAXATTR)
           error (FATAL, "too many input attribs line %d\n", lineno);

        def -> i_par++;
        y = &def -> attributes [def -> i_par];

        y -> par_no = def -> i_par;
        y -> direction = INPUT;
        y -> par_desc = add_type (typename);
}

set_output (def, type_name)
register struct att_def *def;
register char *type_name;
{
        register struct att_def *y;

        if (def -> i_par + def -> o_par >= MAXATTR)
           error (FATAL, "too many input/output attr's line %d\n", lineno);

        def -> o_par++;

        y = &def -> attributes [def -> i_par + def -> o_par];
        y -> par_no = def -> o_par;
        y -> direction = OUTPUT;
        y -> par_desc = add_type (type_name);
}

int in_pars (def)
register struct att_def *def;
{
        if (def == (struct att_def *)0) return 0;
        return def -> i_par;
}

int out_pars (def)
register struct att_def *def;
{
        if (def == (struct att_def *)0) return 0;
        return def -> o_par;
}

/*
 *      during the processing of a rule a stack is maintained
 *      for the simulation of the run time behaviour
 */
struct {
        int i_top;              /* input pars lhs       */
        int o_top;              /* output pars lhs      */
        int w_top;              /* workstack top        */

        struct stack_elem work_stack [WSTACKSIZE];
        struct stack_elem out_stack  [OUTSTACKSIZE];
} workstack;
/*
 *
 *      functions available during processing a rule:

 *
 *
 *      init_stack ();
 *
 *      push (def, cnt, tag);   /* lhs input param
 *      dest_par (def, cnt, tag)        /* lhs output param
 *
 *      veri_in (member, parno, tag);
 *      veri_out(member, parnp, tag);
 *
 *      address_of (tag)        /* map into a string used for C 
 *
 *      pref_stackadjust ();    /* code for stack adjustment 
 *      post_stackadjust ();    /* code for stack adjustment 
 */
init_stack ()
{
        workstack.i_top = 0;
        workstack.o_top = 0;
        workstack.w_top = 0;
}

re_init_stack ()
{
        workstack.w_top = workstack.i_top;
}


cp_tag (x, y, cnt)
register char *x, *y;
register int cnt;
{
        while (--cnt >= 0)
              *y++ = *x++;
}


struct type_elem *get_i_type (def, parno)
register struct att_def *def;
register int parno;
{
        if (parno > def -> i_par)
           error (FATAL, "too high input param for %s",
                                        def -> nonterm);

        return (def -> attributes [parno].par_desc);
}

struct type_elem *get_o_type (def, parno)
register struct att_def *def;
register int parno;
{
        if (parno > def -> o_par)
           error (FATAL, "too high output param number for %s",
                                                def -> nonterm);

        return (def -> attributes [def -> i_par + parno].par_desc);
}


push (def, parno, tag)
register struct att_def *def;

register char *tag;
int parno;
{
        register struct stack_elem *x;

        if (workstack.i_top ++ >= WSTACKSIZE)
           error (FATAL, "too much attributes on workstack line %d\n", lineno);
        x = &workstack.work_stack [workstack.i_top];
        cp_tag (tag, &x -> par_name [0], PAR_SIZ);
        x -> par_def = get_i_type (def, parno);
        workstack.w_top = workstack.i_top;
#ifdef DEBUG
        printf ("push: %s %d %s\n",
                                &x -> par_name [0], workstack.i_top,
                                                x -> par_def -> type_name);
#endif
}

dest_par (def, parno, tag)
register struct att_def *def;
register char *tag;
int parno;
{
        register struct stack_elem *x;

        if (workstack.o_top ++ >= OUTSTACKSIZE)
           error (FATAL, "too much lhs out attributes line %d\n", lineno);

        x = &workstack.out_stack [workstack.o_top];
        cp_tag (tag, &x -> par_name [0], PAR_SIZ);
        x -> par_def = get_o_type (def, parno);
#ifdef DEBUG
        printf ("dest_par : %s %d %s\n",
                        x -> par_name, workstack.o_top,
                        x -> par_def -> type_name);
#endif
}

veri_in (def, parno, tag)
register struct att_def *def;
register char *tag;
int parno;
{
        register struct stack_elem *x;

        x = &workstack.work_stack[ workstack.w_top
                                        - in_pars (def) + parno];
        if (!eq_tags (x -> par_name, tag))
           error (FATAL, "non matching input name %s", tag);
#ifdef DEBUG
        printf ("veri_in: %s at offset %d\n", tag, 
                                workstack.w_top - in_pars (def) + parno);
#endif
}

veri_out (def, parno, tag)
register struct att_def *def;
register char *tag;
int parno;
{
        register struct stack_elem *x;
        if (workstack.w_top++ >= WSTACKSIZE)
           error (FATAL, "too much attribute values line %d\n", lineno);

        x = &workstack.work_stack [workstack.w_top];
        cp_tag (tag, &x -> par_name [0], PAR_SIZ);
        x -> par_def = get_o_type (def, parno);
#ifdef DEBUG
        printf ("veri_out: %s %d %s\n",
                     x -> par_name, workstack.w_top,
                                        x -> par_def -> type_name);
#endif
}

/*
 * given the tag of an attribute, translate it into a string
 * containing the 'C' code to adress the element on the
 * attribute stack (or the local...)
 */
struct stack_elem *search_stck (t)
register char *t;
{
        register int i;
        register struct stack_elem *x;

        for (i=1; i <= workstack.o_top; i++)
            { x = &workstack.out_stack [i];
#ifdef DEBUG
                printf ("search: %s\n", &x -> par_name [0]);
#endif
              if (eq_tags (t, x -> par_name))
                 return x;
            }
/*
 *      now on the input stack
 */
        for (i = workstack.w_top; i > 0; i--)
            { x = &workstack.work_stack [i];
#ifdef DEBUG
                printf ("search: %s\n", x -> par_name);
#endif
              if (eq_tags (t, x -> par_name))
                 return x;
            }

        error (FATAL, "definition of attribute %s not found\n", t);
}

char *address_of (tag)
register char *tag;
{
        register struct stack_elem *t;
        static char s [20];     /* most numbers will do */

        t = search_stck (tag);
        if (t -> access.how_to_access == AS_LOCAL)
           sprintf (s, LOC_STRING, t -> access.ac_lab);
        else
        sprintf (s, "_ap [%d]._t%d",
                        t -> access.ac_offset, t -> par_def -> un_number);

        return s;
}

/*
 *      generate code for stack adjustment and to make
 *      output paramers addressable
 */
pref_stackadjust ()
{
        register struct stack_elem *x;
        register int i;
        register int l_top = 0;

        fprintf (foutput, "{");
        if (workstack.i_top == workstack.w_top)
           { /* no intermediate results, lengthen
              * the stack
              */
             if (workstack.o_top != 0)
                fprintf (foutput, "     _ap -= %d;\n",
                                        workstack.o_top);
             l_top = workstack.o_top;
             for (i = workstack.o_top; i >= 1; i--)
                 { x = &workstack.out_stack [i];
                   x -> access.how_to_access = AS_STACK;
                   x -> access.ac_offset = workstack.o_top - i;
                 }
           }
        else
        /* generate for each output parameter a local
         */
        for (i = 1; i <= workstack.o_top; i++)
            { x = &workstack.out_stack [i];
              x->access.how_to_access = AS_LOCAL;
              x->access.ac_lab = i;

              fprintf (foutput, "       %s ", x -> par_def -> type_name);
              fprintf (foutput, LOC_STRING, i);
              fprintf (foutput, ";\n");
            }

        for (i = workstack.w_top; i > 0; i--)
            { x = &workstack.work_stack [i];
              x -> access.how_to_access = AS_STACK;
              x -> access.ac_offset = 
                                l_top + workstack.w_top - i;
            }
}

/*
 *      after copying the C actions, we possibly have to adjust
 *      the attribute value stack
 */
post_adjuststack ()
{
        register struct stack_elem *x;
        register int i;

        if (workstack.i_top == workstack.w_top)
           { /* adjustment already doen, no pushing/popping */
              fprintf(foutput, "}\n");
           }
        else

        { /* generate code for adjusting ap */
          fprintf (foutput,"    _ap += %d; \n",
                                workstack.w_top - workstack.i_top);
          for (i = 1; i <= workstack.o_top; i++)
              { x = &workstack.out_stack [i];
                fprintf (foutput, "--_ap; _ap[0]._t%d = ",
                                        x -> par_def -> un_number);
                fprintf (foutput, LOC_STRING,
                                        x -> access.ac_lab);
                fprintf (foutput, ";\n");
              }
           fprintf (foutput, "  }\n");
        }
}

/*
 *      no yacc actions specified, verify the work/output stack,
 *      adjust if necessary
 */
adjust_stack ()
{
        register int diff;
        register int i;

        diff = workstack.w_top - workstack.i_top - workstack.o_top;

        if (diff != 0)
           {
                fprintf (foutput, "= {\n");
                fprintf (foutput, "_ap += %d; }\n", diff);
           }

        if (diff < 0)
           { error (WARNING, "garbage on extended attribute stack");
             return;
           }

        for (i = 1; i <= workstack.o_top; i++)
            {
                if (workstack.out_stack [workstack.o_top - i + 1].par_def !=
                    workstack.work_stack [workstack.w_top -i + 1].par_def)
                   error (WARNING, "unequal default transfers %s",
                                        workstack.out_stack [i -1].par_name);
            }
}
