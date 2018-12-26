/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 YACC - Yet Another Compilier-Compilier
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 LALR(1) Parser Generator. From UNIX
  KEYWORDS:	 Parser Generator Compilier-Compilier YACC
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:      Y3.H
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
/*                              *  Y 3 . H  *                                   */
/*                              *************                                   */
/*                                                                              */
/*  This file contains the external declarations needed to hook Yacc modules    */
/* which were originally in Y3.C to their impure data in Y3IMP.3C. Also does    */
/* the include of the original data/external file DTXTRN.H.                     */
/*                                                                              */
/********************************************************************************/

# include "dtxtrn.h"

extern int lastred;             /* the number of the last reduction of a state */

void output( void );
void go2out( void );
void hideprod( void );
void warray( char *, int *, int );
int apack( int *, int );
void go2gen( int );
void precftn( int, int, int );
void wract( int );
void wrstate( int );
void wdef( char *, int );

