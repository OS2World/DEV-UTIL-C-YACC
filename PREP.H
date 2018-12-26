/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 PREP - Preprocessor for YACC
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 Preprocessor for YACC Programs
  KEYWORDS:	 Preprocessor IBM YACC LEX UNIX
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:      PREP.H
  WARNINGS:	 This program is not for the casual user. It will
		 be useful primarily to expert developers.
  CRC:		 N/A
  SEE-ALSO:	 LEX and YACC
  AUTHORS:	 Scott Guthery 11100 leafwood lane Austin, TX 78750
  COMPILERS:	 DESMET-C
  REFERENCES:	 UNIX Systems Manuals
*/

/*
 *      common structures, definitions and so on
 */

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
#define MAXATTR 10
#define PAR_SIZ 26
#define TAGSIZE 3000
#define MAXDEF  20              /* I donot know */
#define NONTERM 200             /* include .../dextern?? */
#define WSTACKSIZE      40      /* arbitrary choice     */
#define OUTSTACKSIZE    20      /* idem                 */

#define NAMESIZE        25      /* idem                 */

#define FATAL   030
#define WARNING 040

#define AS_LOCAL        010
#define AS_STACK        020
#define LOC_STRING      "_L%dL_"

struct type_elem {
        int un_number;          /* union field number */
        char *type_name;        /* type to be united  */
};

struct param {
        int par_no;
        int direction;  /* INPUT or OUTPUT */
        struct type_elem *par_desc;
};

struct att_def {
        int i_par, o_par;
        struct param attributes [MAXATTR];
        char *nonterm;
        char hasdefinition;
};

struct stack_elem {
        char par_name [PAR_SIZ];        /* keep it simple */
        struct type_elem *par_def;
        struct {
                char how_to_access;
                int ac_offset;
                int ac_lab;
        } access;               /* for access function */

};

/*
 *      some token definitions
 */
#define ENDFILE 0
#define COLON   1
#define SEMI    2
#define BAR     3
#define INPUT   3       /* oh yes !!! */
#define EQ_SYMB 4
#define IDENT   5
#define TERM    6
#define LEFT    7
#define BINARY  8
#define RIGHT   9
#define MARK    10
#define PREC    11
#define LCURL   12
#define START   13
#define TYPE    14
#define UNION   15
#define ATTR_DEF        16
#define COMMA   17
#define LPAR    18
#define RPAR    19
#define OUTPUT  20
#define NUMBER  21

#ifndef prep4
extern  FILE    finput, foutput;
extern  int     lineno;
extern  int     tok;
extern  char    tokname[];
extern  char    *infile;
extern          error ();
#endif

extern  struct att_def *lookup ();

#define islower(x)      ('a' <= x && x <= 'z')
#define isupper(x)      ('A' <= x && x <= 'Z')
#define isdigit(x)      ('0' <= x && x <= '9')
