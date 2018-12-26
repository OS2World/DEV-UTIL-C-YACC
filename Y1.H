/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 YACC - Yet Another Compilier-Compilier
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 LALR(1) Parser Generator. From UNIX
  KEYWORDS:	 Parser Generator Compilier-Compilier YACC
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:      Y1.H
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
/*                              *  Y 1 . H  *                                   */
/*                              *************                                   */
/*                                                                              */
/*  This file contains the external declarations needed to hook Yacc modules    */
/* which were originally in Y1.C to their impure data in Y1IMP.1C. Also does    */
/* the include of the original data/external file DTXTRN.H.                     */
/*                                                                              */
/********************************************************************************/

# include <stdlib.h>

# include "dtxtrn.h"

/* lookahead computations */

extern int tbitset;  /* size of lookahead sets */
extern int nlset; /* next lookahead set index */
extern struct looksets clset;  /* temporary storage for lookahead computations */

/* other storage areas */

extern int fatfl;               /* if on, error is fatal */
extern int nerrors;             /* number of errors */

/* storage for information about the nonterminals */

extern int **pres[ ];           /* vector of pointers to productions yielding each nonterminal */
extern struct looksets *pfirst[ ]; /* vector of pointers to first sets for each nonterminal */
extern int pempty[ ];           /* vector of nonterminals nontrivially deriving e */

/* accumulators for statistics information */

extern struct wset *zzcwp;
extern int * zzmemsz;

void aryfil( int *, int, int );
void cempty( void );
void error( char *, ... );
void summary(void);
char *chcopy( char *, char * );
void closure( int );
int setunion( register int *, register int * );
void cpfir( void );
struct looksets *flset( struct looksets * );
void cpres( void );
void stagen( void );
void others( void );
void main( int, char ** );
int unix_getc( FILE * );
void uungetc( char, FILE * );
void prlook( struct looksets * );
char *symnam( int );
void putitem( int *, struct looksets * );
int state( int );
char *writem( int * );

