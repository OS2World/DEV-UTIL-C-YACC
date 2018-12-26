/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 YACC - Yet Another Compilier-Compilier
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 LALR(1) Parser Generator. From UNIX
  KEYWORDS:	 Parser Generator Compilier-Compilier YACC
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:      Y2.H
  WARNINGS:	 This program is not for the casual user. It will
		 be useful primarily to expert developers.
  CRC:		 N/A
  SEE-ALSO:	 LEX and PREP
  AUTHORS:	 Scott Guthery 11100 leafwood lane Austin, TX 78750
  COMPILERS:	 DESMET-C
  REFERENCES:	 UNIX Systems Manuals
*/

/********************************************************************************/
/*                              *************                                   */
/*                              *  Y 2 . H  *                                   */
/*                              *************                                   */
/*                                                                              */
/*  This file contains the external declarations needed to hook Yacc modules    */
/* which were originally in Y2.C to their impure data in Y2IMP.2C. Also does    */
/* the include of the original data/external file DTXTRN.H.                     */
/*                                                                              */
/********************************************************************************/

# include <ctype.h>
# include "dtxtrn.h"

# define IDENTIFIER 257
# define MARK 258
# define TERM 259
# define LEFT 260
# define RIGHT 261
# define BINARY 262
# define PREC 263
# define LCURLY 264
# define C_IDENTIFIER 265  /* name followed by colon */
# define NUMBER 266
# define START 267
# define TYPEDEF 268
# define TYPENAME 269
# define UNION 270
# define ENDFILE 0

/* communication variables between various I/O routines */

extern char *infile;            /* input file name */
extern int numbval;             /* value of an input number */
extern char tokname[ ];         /* input token name */

/* storage of names */

extern char cnames[ ];          /* place where token and nonterminal names are stored */
extern int cnamsz;              /* size of cnames */
extern char * cnamp;            /* place where next name is to be put in */
extern int ndefout;             /* number of defined symbols output */

/* storage of types */
extern int ntypes;              /* number of types defined */
extern char * typeset[ ];       /* pointers to type tags */

/* symbol tables for tokens and nonterminals */

extern int start;               /* start symbol */

/* assigned token type values */
extern int extval;

void setup( int, char ** );
int chfind( int, register char * );
int defin( int, register char * );
void cpyact( int );
int gettok( void );
int fdtype( int );
void cpyunion( void );
char *cstash( register char * );
void defout( void );
void finact( void );
int skipcom( void );
void usage( void );
void yyparse( void );
void cpycode( void );

