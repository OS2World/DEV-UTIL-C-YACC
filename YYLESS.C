/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 YACC - Yet Another Compilier-Compilier
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 LALR(1) Parser Generator. From UNIX
  KEYWORDS:	 Parser Generator Compilier-Compilier YACC
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:      YYLESS.C
  WARNINGS:	 This program is not for the casual user. It will
		 be useful primarily to expert developers.
  CRC:		 N/A
  SEE-ALSO:	 LEX and PREP
  AUTHORS:	 Scott Guthery 11100 leafwood lane Austin, TX 78750
  COMPILERS:	 DESMET-C
  REFERENCES:	 UNIX Systems Manuals
*/

yyless(x)

   {
   extern char yytext[];
   register char *lastch, *ptr;
   extern int yyleng;
   extern int yyprevious;
   lastch = yytext+yyleng;
   if (x>=0 && x <= yyleng)
      ptr = x + yytext;
   else
      ptr = x;
   while (lastch > ptr)
      yyunput(*--lastch);
   *lastch = 0;
   if (ptr >yytext)
      yyprevious = *--lastch;
   yyleng = ptr-yytext;
   }
