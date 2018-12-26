/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 YACC - Yet Another Compilier-Compilier
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 LALR(1) Parser Generator. From UNIX
  KEYWORDS:	 Parser Generator Compilier-Compilier YACC
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:      Y2IMP.C
  WARNINGS:	 This program is not for the casual user. It will
		 be useful primarily to expert developers.
  CRC:		 N/A
  SEE-ALSO:	 LEX and PREP
  AUTHORS:	 Scott Guthery 11100 leafwood lane Austin, TX 78750
  COMPILERS:	 DESMET-C
  REFERENCES:	 UNIX Systems Manuals
*/

/* Impure data needed by routines pulled from Y2.C */

#define y2imp YES
#include "dtxtrn.h"

/* communication variables between various I/O routines */

char *infile;   /* input file name */
int numbval;    /* value of an input number */
char tokname[NAMESIZE]; /* input token name */

/* storage of names */

char cnames[CNAMSZ];    /* place where token and nonterminal names are stored */
int cnamsz = CNAMSZ;    /* size of cnames */
char * cnamp = cnames;  /* place where next name is to be put in */
int ndefout = 3;  /* number of defined symbols output */

/* storage of types */
int ntypes;     /* number of types defined */
char * typeset[NTYPES]; /* pointers to type tags */

/* symbol tables for tokens and nonterminals */

int ntokens = 0;
struct toksymb tokset[NTERMS];
int toklev[NTERMS];
int nnonter = -1;
struct ntsymb nontrst[NNONTERM];
int start;      /* start symbol */

/* assigned token type values */
int extval = 0;

/* input and output file descriptors */

FILE * finput;          /* yacc input file */
FILE * faction;         /* file for saving actions */
FILE * fdefine;         /* file for # defines */
FILE * ftable;          /* y.tab.c file */
FILE * ftemp;           /* tempfile to pass 2 */
FILE * foutput;         /* y.output file */

/* storage for grammar rules */

int mem0[MEMSIZE] ; /* production storage */
int *mem = mem0;
int nprod= 1;   /* number of productions */
int *prdptr[NPROD];     /* pointers to descriptions of productions */
int levprd[NPROD] ;     /* precedence levels for the productions */

/* Statics pulled from modules */

int peekline;           /* from gettok() */
