/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 PREP - Preprocessor for YACC
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 Preprocessor for YACC Programs
  KEYWORDS:	 Preprocessor IBM YACC LEX UNIX
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:      PREP1.C
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
 *
 *      Some notes:
 *
 *

        Two stacks are maintained, a working stack and
        a destination stack.
        The latter one is some coding of the situation to
        be achieved after the reduction.
        The working stack is basically used to compute the
        stack layout at the moment of reduction.
        During the way up to get there, the stack is
        used to verify the ordering and typing of the
        input attributes.
        At the reductionpoint two cases must be distinguished:

        -       The workstack contains only input attributes,
                i.e. those attributes inherited from the
                lhs of the rule

                In this case the runtime stack will be extended
                to contain the output attributes of the lhs symbol.
                The output attributes are made addressable on this
                stack.
                No end of reduction code is further been generated.

        -       The workstack contains also output attributes.
                In order to avoid temporarily sharing of the
                stack locations, the output parameters of the
                lhs symbol of the rule are made addressable as
                ordinary local variables. (These variables
                are declared with unusual names etc.). At the
                end of the reduction code the runtime stack
                is adjusted and the preprocessor generated
                temp's are stored on the stack.
 */

/*
 * rules:
 *      definitie : attr_def symbol [ ( [[|inputdefs]^outputdefs]) ]
 *
 *      rule : lhs : alternative {|alternative} ;

 *
 *
 *      alternative : [ {member} ] [= action]
 *
 *      member : symbol [ ( [|inputlist][^outputlist]) ]
 *
 */
proc_def ()     /* process a definition */
{
        register char *curr_def;

        if (tok != ATTR_DEF)
           return;      /* cannot happen */

        tok = gettok ();
        if (tok != IDENT)
           error (FATAL, "syntax error in attribute definition");

        curr_def = new_def (tokname);

        tok = gettok ();
        if (tok != LPAR)
           return;

        tok = gettok ();
        if (tok == INPUT)
           proc_intypes (curr_def);
        if (tok == OUTPUT)
           proc_outtypes (curr_def);

        if (tok != RPAR)
           error (FATAL, "syntax error in definition for %s",
                                                curr_def -> nonterm);
        tok = gettok ();
        return;
}

proc_intypes (definition)
register struct att_def *definition;
{
        register int i = 0;
        if (tok != INPUT)
           return;      /* cannot happen */

        tok = gettok ();
        while (tok == IDENT)
        { set_input (definition, tokname);
          tok = gettok ();
          if (tok == RPAR)
             return;
          if (tok != COMMA)
             error (FATAL, "syntax error (missing comma) in def %s",
                                                        definition -> nonterm);

          tok = gettok ();
        }

        if (tok != OUTPUT)
           error (FATAL, "syntax error (missing ^) def %s",
                                                definition -> nonterm);

        return;

}

proc_outtypes (definition)
register struct att_def *definition;
{
        if (tok != OUTPUT)
           return;      /* cannot happen */

        tok = gettok ();
        while (tok == IDENT)
        {
           set_output (definition, tokname);
           tok = gettok ();
           if (tok == RPAR)
              return;
           if (tok != COMMA)
              error (FATAL, "syntax error (comma expected) def %s",
                                                definition -> nonterm);

           tok = gettok ();
        }

        error (FATAL, "syntax error, identifier expected in def for %s",
                                                definition -> nonterm);
        return;
}

/*
 *      Now for the rule recorgnition, recall that
 *      the symbols of the rules themselves still
 *      have to be processed by YACC.
 */

struct att_def *lhs_side ()
{
        register int par_i_cnt =0;
        register int par_o_cnt =0;

        register struct att_def *lhs_member;

        if (tok != IDENT)
           error (FATAL, "syntax error in lhs");

        fprintf (foutput,"%s    :", tokname);
        lhs_member = lookup (tokname);

        tok = gettok ();
        if (tok == LPAR)
        {
           if (lhs_member == 0)
              error (FATAL, "illegal left hand side %s", tokname);

           setdefined (lhs_member);
           tok = gettok ();
           if (tok != INPUT)
              goto try_output;

           tok = gettok ();
           while (tok == IDENT)
           {  par_i_cnt ++;
              push (lhs_member, par_i_cnt, tokname);
              tok = gettok ();

              if (tok == RPAR)
                 goto lhs_check;

              if (tok != COMMA)
                 error (FATAL, "syntax error (comma expected) lhs %s",
                                                        lhs_member -> nonterm);
              tok = gettok ();
           }

try_output:
           if (tok != OUTPUT)
              error (FATAL, "^ expected in lhs %s", lhs_member -> nonterm);

           tok = gettok ();
           while (tok == IDENT)
           { par_o_cnt++;
             dest_par (lhs_member, par_o_cnt, tokname);
             tok = gettok ();
             if (tok == RPAR)
                goto lhs_check;

             if (tok != COMMA)
                error (FATAL, "syntax error (comma expected) lhs %s",
                                                        lhs_member -> nonterm);
             tok = gettok ();
           }

lhs_check:
        if (tok != RPAR)
           error (FATAL, ") expected, lhs %s", lhs_member -> nonterm);
        tok = gettok ();
        }

        if (par_i_cnt != in_pars (lhs_member) ||
            par_o_cnt != out_pars(lhs_member) )
           error (FATAL, "incorrect number parameters for %s",
                                                lhs_member -> nonterm);

        return lhs_member;
}

rule ()
{
        register struct att_def *lhs_def;

        init_stack ();
        lhs_def = lhs_side ();
        if (tok != COLON)
           error (FATAL, " `:' expected following %s",
                                        lhs_def -> nonterm);

        tok = gettok ();

        proc_alternative (lhs_def);
        while (tok == BAR)
            { fprintf (foutput, "\n             |");
              re_init_stack ();
              tok = gettok ();
              proc_alternative (lhs_def);
            }

        if (tok != SEMI)

           error (FATAL, "`;' expected  %s", lhs_def -> nonterm);

        fprintf (foutput, ";\n");
}

proc_alternative (lefthand)
register struct stack_elem *lefthand;
{
        while (tok == IDENT)
           { fprintf (foutput, "%s ", tokname);
             proc_member (lefthand);
           }

        if (tok == EQ_SYMB)
           { fprintf (foutput, "=\n");
             tok = gettok ();
             cpyact ();
             tok = gettok ();
           }
        else
           adjust_stack ();
}

proc_member (ctxt)
register struct stack_elem *ctxt;
{
        register int in_index, out_index;
        register struct att_def *curr_member;

        if (tok != IDENT)
           return;      /* cannot happen */

        curr_member = lookup (tokname);

        tok = gettok ();
        if (tok != LPAR)
           { if (curr_member == (struct att_def *)0)
                return;

             if (in_pars (curr_member) + out_pars (curr_member) != 0)
                error (FATAL, "incorrect number of parameters %s",
                                                ctxt -> nonterm);
             return;
           }

        if (curr_member == (struct att_def *)0) /* and tok == ( */
           error (FATAL, "parameters with non specified symbol rule %s",
                                                ctxt -> nonterm);

        tok = gettok ();
        in_index = 0;
        out_index = 0;

        if (tok == INPUT)
           { tok = gettok ();
             while (tok == IDENT)
             {   in_index++;
                 veri_in (curr_member, in_index, tokname);
                 tok = gettok ();
                 if (tok == RPAR)
                    goto par_check;

                 if (tok != COMMA)
                    error (FATAL, "comma expected (member %s)",
                                                curr_member -> nonterm);

                 tok = gettok ();
             }
           }
        if (tok != OUTPUT)
           error (FATAL, "^ expected  (member %s)",
                                                curr_member -> nonterm);

        tok = gettok ();
        while (tok == IDENT)
        {   out_index++;
            veri_out (curr_member, out_index, tokname);
            tok = gettok ();
            if (tok == RPAR)
               break;
            if (tok != COMMA)
               error (FATAL, "`,' expected (member %s)",
                                                curr_member -> nonterm);
            tok = gettok ();
        }

par_check:
        if ( (in_pars (curr_member) != in_index) ||
             (out_pars (curr_member) != out_index) )
           error (FATAL, "incorrect number of parameters (member %s)",
                                                curr_member -> nonterm);

        if (tok != RPAR)
           error (FATAL, "`)' expected (member %s)",
                                                curr_member -> nonterm);
        tok = gettok ();
}
