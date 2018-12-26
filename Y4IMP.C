/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 YACC - Yet Another Compilier-Compilier
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 LALR(1) Parser Generator. From UNIX
  KEYWORDS:	 Parser Generator Compilier-Compilier YACC
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:      Y4IMP.C
  WARNINGS:	 This program is not for the casual user. It will
		 be useful primarily to expert developers.
  CRC:		 N/A
  SEE-ALSO:	 LEX and PREP
  AUTHORS:	 Scott Guthery 11100 leafwood lane Austin, TX 78750
  COMPILERS:	 DESMET-C
  REFERENCES:	 UNIX Systems Manuals
*/

/* Impure data from y4.c modules */

# include "dtxtrn.h"

# define a amem
# define pa indgo
# define yypact temp1
# define greed tystate

# define NOMORE -1000

int * ggreed = lkst[0].lset;
int * pgo = wsets[0].ws.lset;
int *yypgo = &nontrst[0].tvalue;

int maxspr = 0;  /* maximum spread of any entry */
int maxoff = 0;  /* maximum offset into a array */
int *pmem = mem0;
int *maxa;
int nxdb = 0;
int adb = 0;
