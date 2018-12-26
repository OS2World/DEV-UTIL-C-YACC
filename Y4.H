/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 YACC - Yet Another Compilier-Compilier
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 LALR(1) Parser Generator. From UNIX
  KEYWORDS:	 Parser Generator Compilier-Compilier YACC
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:      Y4.H
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
/*                              *  Y 4 . H  *                                   */
/*                              *************                                   */
/*                                                                              */
/*  This file contains the external declarations needed to hook Yacc modules    */
/* which were originally in Y4.C to their impure data in Y4IMP.4C. Also does    */
/* the include of the original data/external file DTXTRN.H.                     */
/*                                                                              */
/********************************************************************************/

# include <ctype.h>
# include "dtxtrn.h"

# define a amem
# define pa indgo
# define yypact temp1
# define greed tystate

# define NOMORE -1000

extern int * ggreed;
extern int * pgo;
extern int *yypgo;

extern int maxspr;              /* maximum spread of any entry */
extern int maxoff;              /* maximum offset into a array */
extern int *pmem;
extern int *maxa;
extern int nxdb;
extern int adb;

void callopt( void );
void aoutput( void );
void arout( char *, int *, int );
void osummary( void );
void gin( int );
void stin( int );
int nxti( void );
int gtnm( void );

