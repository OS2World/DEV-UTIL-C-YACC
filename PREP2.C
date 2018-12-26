/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 PREP - Preprocessor for YACC
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 Preprocessor for YACC Programs
  KEYWORDS:	 Preprocessor IBM YACC LEX UNIX
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:	 PREP2.C
  WARNINGS:	 This program is not for the casual user. It will
		 be useful primarily to expert developers.
  CRC:		 N/A
  SEE-ALSO:	 LEX and YACC
  AUTHORS:	 Scott Guthery 11100 leafwood lane Austin, TX 78750
  COMPILERS:	 DESMET-C
  REFERENCES:	 UNIX Systems Manuals
*/

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
/*
 *	scanning/copying routines for YACC preprocessor
 *
 *	j van katwijk
 *
 */
static char c;
static int is_digit (x)
register char x;
{
	return '0' <= x && x <= '9';
}

static int is_letter(x)
register char x;
{
	return ('A' <= x && x <= 'Z') || ('a' <= x && x <= 'z');
}

int is_namelem (x)
register int x;
{
	return (islower(x) ||
		isupper(x) ||
		c == '_'   ||
		c == '.'   ||
		c == '$' );
}

int gettok ()
{
	register int i, base;
	static int peekline;
	register int match, reserve;

/* :
 */
begin:
	reserve = 0;
	lineno += peekline;
	peekline = 0;

	c = unix_getc (finput);
	while (0 <= c && c <= ' ')
	{ if (c == '\n')

	     lineno++;
	  c = unix_getc (finput);
	}

	if (c == '/')   /* go for comment */
	   { lineno += skipcom ();
	     goto begin;
	   }

	switch (c)
	{
	case -1: /* EOF */
		return ENDFILE;
	case ':':
		return COLON;

	case ';':
		return SEMI;

	case '|':
		return BAR;


	case '{':
		uungetc (c, finput);
		return (EQ_SYMB);
		/* action .... */

	case '<':       /* only for the sake of YACC */
		i = 0;
		while ( (c = unix_getc (finput)) != '>' && c >= 0 && c != '\n')
		    { tokname [i] = c;
		      if (++i >= NAMESIZE) --i;
		    }

		if (c!= '>')
		   error (FATAL, "unterminated <...> clause");

		tokname [i] = '\0';
		return (IDENT);

	case ',':
		return COMMA;

	case '^':
		return OUTPUT;

	case '=':
		return EQ_SYMB;

	case '(':
		return LPAR;

	case ')':
		return RPAR;


	case '"':
	case '\'':
		match = c;
		tokname [0] = ' ';

		i = 1;

		for (;;)
		{ c = unix_getc (finput);
		  if (c == '\n' || c == EOF)
		     error (FATAL, "illegal or missing %c", match);
		  if (c == '\\')
		     { c = unix_getc (finput);
		       tokname [i] = '\\';
		       if (++i >= NAMESIZE) --i;
		     }
		  else
		     if (c == match)
			break;

		  tokname [i] = c;
		  if (++i >= NAMESIZE) --i;
		}

		break;

	case '%':
	case '\\':
		switch (c = unix_getc (finput))
		{
			case '0':       return TERM;
			case '<':       return LEFT;
			case '2':       return (BINARY);
			case '>':       return (RIGHT);
			case '%':
			case '\\':      return (MARK);
			case '=':       return (PREC);
			case '{':       return (LCURL);

			default:	reserve = 1;
		}

/* bah, johnson falls through, we follow here:
 */
	default:
		if (isdigit(c))
		   { i = 0;
		     while (isdigit(c))
			 { tokname [i] = c;
			   if (++i >= NAMESIZE) --i;
			   c = unix_getc (finput);
			 }
		     uungetc (c, finput);
		     return (NUMBER);
		   }
		else
		if (is_namelem (c))
		   { i = 0;
		     while (is_namelem (c) || is_digit (c))
			 { tokname [i] = c;
			   if (reserve && isupper(c))
			      tokname [i] += 'a' - 'A';
			   if (++i >= NAMESIZE) --i;
			   c = unix_getc (finput);
			 }
		   }
		else

		   return c;

		uungetc (c, finput);
		}

/* look for reserved words */
	tokname [i] = '\0';

	if (reserve)
	   {
		if (!strcmp (tokname, "term")) return TERM;
		if (!strcmp (tokname, "token")) return TERM;
		if (!strcmp (tokname, "left")) return LEFT;
		if (!strcmp (tokname, "nonassoc")) return BINARY;
		if (!strcmp (tokname, "binary")) return BINARY;
		if (!strcmp (tokname, "right")) return RIGHT;
		if (!strcmp (tokname, "prec")) return RIGHT;
		if (!strcmp (tokname, "start")) return START;
		if (!strcmp (tokname, "type")) return TYPE;
		if (!strcmp (tokname, "union")) return UNION;
		if (!strcmp (tokname, "attributes")) return ATTR_DEF;
		if (!strcmp (tokname, "attribute")) return ATTR_DEF;
		error (FATAL, "non recognized keyword %s", tokname);
	   }

	return (IDENT);
}

/*
 *	copy the union
 *
 */

cpyunion ()
{
	int level, c;
	fprintf (foutput, "\n# line %d \"%s\"\n", lineno, infile);
	fprintf (foutput, "%%union");

	level = 0;
	for (;;)
	{  if ((c = unix_getc (finput)) <0 )
	      error (FATAL, "EOF when parsing %%union");

	   fprintf (foutput, "%c", c);
	   switch (c)
	   {
		case '\n':
			++lineno; break;

		case '{':
			++level;
			break;

		case '}':
			level--;
			if (level == 0)
			   return;
	    }
	  }

}

cpycode ()	/* copies code between { and } */
{
	register int c;
	c = unix_getc (finput);
	if (c == '\n')
	   { c = unix_getc (finput);
	     lineno ++;
	   }

	fprintf (foutput, "\\{");
	while (c >= 0)
	{
		if (c == '\\')
		   if ( (c = unix_getc (finput)) == '}')
		      { fprintf (foutput, "\\}");
			return;
		      }
		   else
		      fprintf (foutput, "\\");

		if (c == '%')
		   if ( (c = unix_getc (finput)) == '}')
		      { fprintf (foutput, "%}");
			return;
		      }
		   else
		      fprintf (foutput, "%");


		fprintf (foutput, "%c", c);
		if (c == '\n') lineno ++;
		c = unix_getc (finput);
	}

	error (FATAL, "error before %%}");
}

skipcom ()	/* guess what */
{
	register int c;
	register int i = 0;	/* number of lines skipped */

	if (unix_getc (finput) != '*')
	   error (FATAL, "illegal comment");

	c = unix_getc (finput);
	while (c != EOF)
	{
		while (c == '*')
		   if ( (c = unix_getc (finput)) == '/') return i;
		if (c == '\n') i++;
		c = unix_getc (finput);
	}

	error (FATAL, "error EOF within comment");
}

cpyact ()	/* copy C action to closing ; or } */

{
	int brac, c, match, j, s, tok;

	pref_stackadjust ();

	brac = 0;

loop:
	c = unix_getc (finput);

swt:
	switch (c)
	{
	case ';':
		if (brac == 0)
		   { post_adjuststack ();
		     fprintf (foutput, "%c", c);
		     return;
		   }
		goto lcopy;

	case '{':
		brac++;
		goto lcopy;

	case '$':
		s = 1;
		tok = -1;
		c = unix_getc (finput);
		if (c == '<')   /* type description */
		   { uungetc (c, finput);
		     if (gettok () != IDENT)
			error (FATAL, "bad syntax on $<..> clause");
		     fprintf (foutput, "<%s>", tokname);
		     c = unix_getc (finput);
		   }

		if (c == '$')
		   {  fprintf (foutput, "$$");
		      goto loop;
		   }

		if (c == '-')
		   { s = -s;
		     c = unix_getc (finput);
		   }
		if (isdigit(c))
		   { j = 0;
		     while (isdigit(c))
		     {	j = j * 10 + c - '0';
			c = unix_getc (finput);
		     }
		     j = j * s;
		     fprintf (foutput, "$%d", j);
		     goto swt;
		   }

		if (is_letter (c))
		   { uungetc (c, finput);
		     tok = gettok ();
		     if (tok != IDENT)
			error (FATAL, "illegal $construct");

		     fprintf (foutput, "%s", address_of(tokname));
		     goto loop;
		   }

		fprintf (foutput, "$");
		if (s < 0)
		   fprintf (foutput, "-");

		goto swt;

	case '}':
		if (--brac > 0)
		   goto lcopy;

		post_adjuststack ();
		fprintf (foutput, "%c", c);
		return;

	case '/':
		/* look for comment */
		fprintf (foutput, "%c", c);
		c = unix_getc (finput);
		if (c != '*') goto swt;

		while (c != EOF)
		{
			while (c == '*')
			{
				fprintf (foutput, "%c", c);
				if ( (c = unix_getc (finput)) == '/')
				     goto lcopy;
			}
			fprintf (foutput, "%c", c);
			if (c == '\n') lineno++;
			c = unix_getc (finput);
		}
		error (FATAL, "EOF within comment");

	case '\'':
		match = '\'';
		goto string;

	case '"':
		match = '"';

string:
		fprintf (foutput, "%c", c);
		while ( (c = unix_getc (finput)) != EOF)
		{
			if (c == '\\')
			{
				fprintf (foutput, "%c", c);
				c = unix_getc (finput);
				if (c == '\n') lineno ++;
			}
			else
			if (c == match) goto lcopy;
			else
			if (c == '\n')
			   error (FATAL, "newline in string or char const");
			fprintf (foutput, "%c", c);
		}

		error (FATAL, "EOF in string or character constant");

	case -1: /* EOF */
		error ("action does not terminate");

	case '\n':
		lineno++;
		goto lcopy;

	}

lcopy:
	fprintf (foutput, "%c", c);
	goto loop;
}
