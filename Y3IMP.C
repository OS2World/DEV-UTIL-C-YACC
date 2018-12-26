/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 YACC - Yet Another Compilier-Compilier
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 LALR(1) Parser Generator. From UNIX
  KEYWORDS:	 Parser Generator Compilier-Compilier YACC
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:      Y3IMP.C
  WARNINGS:	 This program is not for the casual user. It will
		 be useful primarily to expert developers.
  CRC:		 N/A
  SEE-ALSO:	 LEX and PREP
  AUTHORS:	 Scott Guthery 11100 leafwood lane Austin, TX 78750
  COMPILERS:	 DESMET-C
  REFERENCES:	 UNIX Systems Manuals
*/

/* Impure data from modules split from y3.c */
#define y3imp YES

#include "dtxtrn.h"

int lastred;            /* the number of the last reduction of a state */

int defact[NSTATES];    /* the default actions of states */
