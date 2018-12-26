/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 PREP - Preprocessor for YACC
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 Preprocessor for YACC Programs
  KEYWORDS:	 Preprocessor IBM YACC LEX UNIX
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:	 PREP4.C
  WARNINGS:	 This program is not for the casual user. It will
		 be useful primarily to expert developers.
  CRC:		 N/A
  SEE-ALSO:	 LEX and YACC
  AUTHORS:	 Scott Guthery 11100 leafwood lane Austin, TX 78750
  COMPILERS:	 DESMET-C
  REFERENCES:	 UNIX Systems Manuals
*/

#define prep4 YES
#include	<stdio.h>
#include	"prep.h"

/*
 *
 *	J van Katwijk
 *	Delft University of Technology,
 *	Department of Mathematics,
 *	132 Julianalaan
 *	Delft, The Netherlands
 *
 *	See for a functional description:
 *
 *	SIGPLAN NOTICES
 *	October 1983, 18 (10) pp 12 .. 16
 */
FILE finput, foutput;
char *infile;
char tokname [NAMESIZE];
int tok;
int lineno = 1;

/*
 *	process the declaration section of a YACC source
 */

prep_decls ()
{
	for (tok = gettok (); tok != MARK && tok != ENDFILE; )
	{
	switch (tok)
	{
		case SEMI:
			fprintf (foutput, ";\n");
			tok = gettok ();
			break;

		case START:
			if ( (tok = gettok ()) != IDENT)
			   error (FATAL, "bad start construct (YACC)");

			fprintf (foutput, "%%start %s\n", tokname);
			tok = gettok ();
			continue;


		case TYPE:
			if ( (tok = gettok ()) != IDENT)
			   error (FATAL, "bad syntax in %%type (YACC)");

			fprintf (foutput, "%%typedef %s ", tokname);

			while (1)
			{ tok = gettok ();
			  switch (tok)
			  {
				case IDENT:
					fprintf (foutput, " %s", tokname);
					continue;

				case COMMA:

					fprintf (foutput, " ,");
					continue;

				case SEMI:
					fprintf (foutput, ";\n");
					tok = gettok ();
					break;

				default:
					break;
			    }

			 break;
			 }
			continue;

		case ATTR_DEF:
			proc_def ();
			continue;

		case UNION:
			/* copy the union declaration to output */
			cpyunion ();
			tok = gettok ();
			continue;

		case LEFT:
		case RIGHT:
		case BINARY:
		case TERM:
			fprintf (foutput, "\n");
			switch (tok)
			{
				case LEFT:
					fprintf (foutput, " %%left");
					break;

				case RIGHT:
					fprintf (foutput, " %%right");
					break;

				case BINARY:
					fprintf (foutput, " %%nonassoc");
					break;

				case TERM:
					fprintf (foutput, " %%term");
					break;
			}

			/* get identifiers so defined */
			tok = gettok ();
			if (tok == IDENT)
			   { fprintf (foutput, " %s", tokname);
			    tok = gettok ();
			   }

			while (1)
			{ switch (tok)
			  {

				case COMMA:
					fprintf (foutput, " ,");
					tok = gettok ();
					break;

				case SEMI:
					fprintf (foutput, " ;\n");
					break;

				case IDENT:
					fprintf (foutput, " %s", tokname);
					tok = gettok ();
					continue;

				}

				break;
			}
			continue;

		case LCURL:
			cpycode ();
			tok = gettok ();
			continue;

		default:
			error (FATAL, "syntax error in def part");
		}
	}

/*
 * tok is either MARK or ENDFILE
 */
	if (tok == ENDFILE)
	   error (FATAL, "unexpected EOF before %%");

}

/*
 *	the rules, that is easy
 */
prep_rules ()
{
	fprintf (foutput, "\n%%%%\n");

	tok = gettok ();
	while (tok != ENDFILE && tok != MARK)
	      { rule ();
		tok = gettok ();
	      }
}

prep_post ()
{
	register int c;

	fprintf (foutput, "\n%%%%\n");

	if (tok == MARK)
	   while ( (c = unix_getc (finput)) != EOF)

		   fprintf (foutput, "%c", c);

	print_union (); /* the attribute type */
	fprintf (foutput, "\n /* processed by a YACC preprocessor */ \n");
}

/*
 *	temp. main program
 *
 *	for yacc preprocessor
 */

error (x, y, z)
register int x;
register char *y;
register int z;
{
	printf ("\n*** error line %d :", lineno);
	printf (y, z);
	printf ("       ***\n");
	if (x == FATAL)
	   exit (1);
}

main (argc, argv)
register char **argv;
register int argc;
{
	if (argc != 3)
	   { printf ("usage: prep infile outfile\n");
	     exit (1);
	   }

	infile = argv [1];
	finput = fopen (infile, "r");
	foutput= fopen (argv [2], "w");
	if (finput == 0)
	   error (FATAL, "cannot read from %s", infile);

	if (foutput == 0)
	   error (FATAL, "cannot write to %s", argv[2]);

	prep_decls ();

	prep_rules ();

	prep_post ();

	checkdefs ();
	fclose (foutput);
}

static char getbuf[30], *getbufptr = getbuf;

unix_getc(iop)
FILE iop;
{
	if(getbufptr == getbuf)
		return(getc(iop));
	else
		return(*--getbufptr);
}

uungetc(c, iop)
char c;
FILE iop; /* WARNING: iop ignored ... uungetc's are multiplexed!!! */
{
	*getbufptr++ = c;
}
