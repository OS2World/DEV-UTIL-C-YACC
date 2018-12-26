/*
 * Created by CSD YACC (IBM PC) from "example.Y" */
# define ONE 257
# define TWO 258
# define THREE 259
# define FOUR 260
# define FIVE 261
# define SIX 262
# define SEVEN 263
# define EIGHT 264
# define NINE 265
# define DOT 266
#define yyclearin yychar = -1
#define yyerrok yyerrflag = 0
#ifndef YYMAXDEPTH
#define YYMAXDEPTH 150
#endif
#ifndef YYSTYPE
#define YYSTYPE int
#endif
extern YYSTYPE yylval;  /*CSD & DECUS LEX */
YYSTYPE yyval;          /*CSD & DECUS LEX */
# define YYERRCODE 256

#line 108



#ifndef ATT_SIZE
#define ATT_SIZE     150
#endif

union _attr_elem {
  float  _t0;
  int  _t1;
} _attr_stack [ATT_SIZE];
union _attr_elem *_ap =      &_attr_stack [ATT_SIZE - 1];

 /* processed by a YACC preprocessor */ 
short yyexca[] ={
-1, 1,
	0, -1,
	-2, 0,
-1, 15,
	0, 2,
	-2, 9,
	};
# define YYNPROD 19
# define YYLAST 38
short yyact[]={

   4,   5,   6,   7,   8,   9,  10,  11,  12,  13,
   4,   5,   6,   7,   8,   9,  10,  11,  12,  18,
  19,   3,  17,  14,  16,  15,   2,   1,   0,   0,
   0,   0,   0,   0,   0,   0,   0,  20 };
short yypact[]={

-247,-1000,-257,-1000,-1000,-1000,-1000,-1000,-1000,-1000,
-1000,-1000,-1000,-1000,-1000,-1000,-247,-247,-1000,-1000,
-1000 };
short yypgo[]={

   0,  27,  26,  25,  20,  24,  19,  22 };
short yyr1[]={

   0,   1,   1,   2,   2,   3,   3,   6,   5,   7,
   4,   4,   4,   4,   4,   4,   4,   4,   4 };
short yyr2[]={

   0,   1,   3,   1,   2,   2,   3,   1,   0,   0,
   1,   1,   1,   1,   1,   1,   1,   1,   1 };
short yychk[]={

-1000,  -1,  -2,  -4, 257, 258, 259, 260, 261, 262,
 263, 264, 265, 266,  -4,  -3,  -5,  -7,  -6,  -4,
  -6 };
short yydef[]={

   0,  -2,   1,   3,  10,  11,  12,  13,  14,  15,
  16,  17,  18,   8,   4,  -2,   0,   0,   5,   7,
   6 };
# define YYFLAG -1000
# define YYERROR goto yyerrlab
# define YYACCEPT return(0)
# define YYABORT return(1)

/*      parser for yacc output  */

int yydebug = 0; /* 1 for debugging */
YYSTYPE yyv[YYMAXDEPTH]; /* where the values are stored */
int yychar = -1; /* current input token number */
int yynerrs = 0;  /* number of errors */
short yyerrflag = 0;  /* error recovery flag */

yyparse()
   {

   short yys[YYMAXDEPTH];
   short yyj, yym;
   register YYSTYPE *yypvt;
   register short yystate, *yyps, yyn;
   register YYSTYPE *yypv;
   register short *yyxi;

   yystate = 0;
   yychar = -1;
   yynerrs = 0;
   yyerrflag = 0;
   yyps= &yys[-1];
   yypv= &yyv[-1];

yystack:    /* put a state and value onto the stack */

   if( yydebug  ) printf( "state %d, char 0%o\n", yystate, yychar );
   if( ++yyps> &yys[YYMAXDEPTH] )
      {
      yyerror( "yacc stack overflow" );
      return(1);
      }
   *yyps = yystate;
   ++yypv;
#ifdef UNION
   yyunion(yypv, &yyval);
#else
   *yypv = yyval;
#endif
yynewstate:

   yyn = yypact[yystate];

   if( yyn<= YYFLAG ) goto yydefault; /* simple state */

   if( yychar<0 ) if( (yychar=yylex())<0 ) yychar=0;
   if( (yyn += yychar)<0 || yyn >= YYLAST ) goto yydefault;

   if( yychk[ yyn=yyact[ yyn ] ] == yychar )
      {
      /* valid shift */
      yychar = -1;
#ifdef UNION
	  yyunion(&yyval, &yylval);
#else
      yyval = yylval;
#endif
      yystate = yyn;
      if( yyerrflag > 0 ) --yyerrflag;
      goto yystack;
      }
yydefault:
   /* default state action */

   if( (yyn=yydef[yystate]) == -2 )
      {
      if( yychar<0 ) if( (yychar=yylex())<0 ) yychar = 0;
      /* look through exception table */

      for( yyxi=yyexca; (*yyxi!= (-1)) || (yyxi[1]!=yystate) ; yyxi += 2 ) ; /* VOID */

      for(yyxi+=2; *yyxi >= 0; yyxi+=2)
         {
         if( *yyxi == yychar ) break;
         }
      if( (yyn = yyxi[1]) < 0 ) return(0);   /* accept */
      }

   if( yyn == 0 )
      {
      /* error */
      /* error ... attempt to resume parsing */

      switch( yyerrflag )
         {

      case 0:   /* brand new error */

         yyerror( "syntax error" );
yyerrlab:
         ++yynerrs;

      case 1:
      case 2: /* incompletely recovered error ... try again */

         yyerrflag = 3;

         /* find a state where "error" is a legal shift action */

         while ( yyps >= yys )
            {
            yyn = yypact[*yyps] + YYERRCODE;
            if( yyn>= 0 && yyn < YYLAST && yychk[yyact[yyn]] == YYERRCODE )
               {
               yystate = yyact[yyn];  /* simulate a shift of "error" */
               goto yystack;
               }
            yyn = yypact[*yyps];

            /* the current yyps has no shift onn "error", pop stack */

            if( yydebug ) printf( "error recovery pops state %d, uncovers %d\n", *yyps, yyps[-1] );
            --yyps;
            --yypv;
            }

         /* there is no state on the stack with an error shift ... abort */

yyabort:
         return(1);


      case 3:  /* no shift yet; clobber input char */
         if( yydebug ) printf( "error recovery discards char %d\n", yychar );

         if( yychar == 0 ) goto yyabort; /* don't discard EOF, quit */
         yychar = -1;
         goto yynewstate;   /* try again in the same state */

         }

      }

   /* reduction by production yyn */

   if( yydebug ) printf("reduce %d\n",yyn);
   yyps -= yyr2[yyn];
   yypvt = yypv;
   yypv -= yyr2[yyn];
#ifdef UNION
   yyunion(&yyval, &yypv[1]);
#else
   yyval = yypv[1];
#endif
   yym=yyn;
   /* consult goto table to find next state */
   yyn = yyr1[yyn];
   yyj = yypgo[yyn] + *yyps + 1;
   if( yyj>=YYLAST || yychk[ yystate = yyact[yyj] ] != -yyn ) yystate = yyact[yypgo[yyn]];
   switch(yym)
      {
      
case 1:
# line 13

{       float _L1L_;
{ _L1L_ = (float) _ap [0]._t1;
                    _ap += 1; 
--_ap; _ap[0]._t0 = _L1L_;
  }
} break;
case 2:
# line 20

{       float _L1L_;
{ _L1L_ = (float) _ap [2]._t1 + _ap [0]._t0;
                    _ap += 3; 
--_ap; _ap[0]._t0 = _L1L_;
  }
} break;
case 4:
# line 28

{       int _L1L_;
{ _L1L_ = 10 * _ap [1]._t1 + _ap [0]._t1;
                    _ap += 2; 
--_ap; _ap[0]._t1 = _L1L_;
  }
} break;
case 6:
# line 36

{       int _L1L_;
       float _L2L_;
{ _L2L_ = _ap [2]._t0 + _ap [0]._t0;
                    _ap += 4; 
--_ap; _ap[0]._t1 = _L1L_;
--_ap; _ap[0]._t0 = _L2L_;
  }
} break;
case 7:
# line 45

{       float _L1L_;
{ _L1L_ = ( (float) _ap [0]._t1) / (power (10, _ap [1]._t1));
                    _ap += 1; 
--_ap; _ap[0]._t0 = _L1L_;
  }
} break;
case 8:
# line 52

{     _ap -= 1;
{ _ap [0]._t1 = 1;
                }
} break;
case 9:
# line 57

{     _ap -= 1;
{ _ap [0]._t1 = _ap [2]._t1 + 1;
                }
} break;
case 10:
# line 62

{     _ap -= 1;
{ _ap [0]._t1 = 1;
                }
} break;
case 11:
# line 67

{     _ap -= 1;
{ _ap [0]._t1 = 2;
                }
} break;
case 12:
# line 72

{     _ap -= 1;
{ _ap [0]._t1 = 3;
                }
} break;
case 13:
# line 77

{     _ap -= 1;
{ _ap [0]._t1 = 4;
                }
} break;
case 14:
# line 82

{     _ap -= 1;
{ _ap [0]._t1 = 5;
                }
} break;
case 15:
# line 87

{     _ap -= 1;
{ _ap [0]._t1 = 6;
                }
} break;
case 16:
# line 92

{     _ap -= 1;
{ _ap [0]._t1 = 7;
                }
} break;
case 17:
# line 97

{     _ap -= 1;
{ _ap [0]._t1 = 8;
                }
} break;
case 18:
# line 102

{     _ap -= 1;
{ _ap [0]._t1 = 9;
                }
} break;/* End of actions */
      }
   goto yystack;  /* stack new state and value */

   }
