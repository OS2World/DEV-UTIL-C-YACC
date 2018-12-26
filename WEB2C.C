/*
 * Created by CSD YACC (IBM PC) from "web2c.Y" */
# define array_tok 257
# define begin_tok 258
# define case_tok 259
# define const_tok 260
# define do_tok 261
# define downto_tok 262
# define else_tok 263
# define end_tok 264
# define file_tok 265
# define for_tok 266
# define function_tok 267
# define goto_tok 268
# define if_tok 269
# define label_tok 270
# define of_tok 271
# define procedure_tok 272
# define program_tok 273
# define record_tok 274
# define repeat_tok 275
# define then_tok 276
# define to_tok 277
# define type_tok 278
# define until_tok 279
# define var_tok 280
# define while_tok 281
# define integer_tok 282
# define real_tok 283
# define others_tok 284
# define r_num_tok 285
# define i_num_tok 286
# define string_literal_tok 287
# define single_char_tok 288
# define assign_tok 289
# define two_dots_tok 290
# define unknown_tok 291
# define undef_id_tok 292
# define var_id_tok 293
# define proc_id_tok 294
# define proc_param_tok 295
# define fun_id_tok 296
# define fun_param_tok 297
# define const_id_tok 298
# define type_id_tok 299
# define hhb0_tok 300
# define hhb1_tok 301
# define field_id_tok 302
# define define_tok 303
# define field_tok 304
# define break_tok 305
# define not_eq_tok 306
# define less_eq_tok 307
# define great_eq_tok 308
# define or_tok 309
# define unary_plus_tok 310
# define unary_minus_tok 311
# define div_tok 312
# define mod_tok 313
# define and_tok 314
# define not_tok 315

# line 18
#include "web2c.h"

#ifdef SYSV
#include <string.h>
#define	rindex	strrchr
#define	index	strchr
#else
#include <strings.h>
#endif	/* SYSV */
#define	symbol(x)	sym_table[x].id
static char function_return_type[50], for_stack[300], control_var[50],
            relation[3];
static int last_type = -1;
char my_routine[100];	/* Name of routine being parsed, if any */
static char array_bounds[80], array_offset[80];
static int func_id, uses_mem, uses_eqtb, lower_sym, upper_sym;
extern char conditional[], temp[], *std_header;
extern int tex, mf, strict_for;
extern FILE *coerce;
extern char coerce_name[];
int doing_statements = FALSE, var_formals = FALSE, ids_typed, id_list[20];
long labs();
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

#line 1084

compute_array_bounds()
{
    int lb;
    char tmp[200];

    if (lower_sym == -1) {	/* lower is a constant */
	lb = lower_bound - 1;
	if (lb==0) lb = -1;	/* Treat lower_bound==1 as if lower_bound==0 */
	if (upper_sym == -1)	/* both constants */
	    (void) sprintf(tmp, "[%d]", upper_bound - lb);
	else {			/* upper a symbol, lower constant */
	    if (lb < 0)
		(void) sprintf(tmp, "[%s + %d]",
				symbol(upper_sym), (-lb));
	    else
		(void) sprintf(tmp, "[%s - %d]",
				symbol(upper_sym), lb);
	}
	if (lower_bound < 0 || lower_bound > 1) {
	    if (*array_bounds) {
		fprintf(stderr, "Cannot handle offset in second dimension\n");
		exit(1);
	    }
	    if (lower_bound < 0) {
		(void) sprintf(array_offset, "+%d", -lower_bound);
	    } else {
		(void) sprintf(array_offset, "-%d", lower_bound);
	    }
	}
	(void) strcat(array_bounds, tmp);
    }
    else {			/* lower is a symbol */
	if (upper_sym != -1)	/* both are symbols */
	    (void) sprintf(tmp, "[%s - %s + 1]", symbol(upper_sym),
		symbol(lower_sym));
	else {			/* upper constant, lower symbol */
	    (void) sprintf(tmp, "[%d - %s]", upper_bound + 1,
		symbol(lower_sym));
	}
	if (*array_bounds) {
	    fprintf(stderr, "Cannot handle symbolic offset in second dimension\n");
	    exit(1);
	}
	(void) sprintf(array_offset, "- (int)(%s)", symbol(lower_sym));
	(void) strcat(array_bounds, tmp);
    }
}

fixup_var_list()
{
    int i, j;
    char output_string[100], real_symbol[100];

    for (i=0; var_list[i++] == '!'; ) {
	for (j=0; real_symbol[j++] = var_list[i++];);
	if (*array_offset) {
	    (void) fprintf(std, "\n#define %s (%s %s)\n  ",
	        real_symbol, next_temp, array_offset);
	    (void) strcpy(real_symbol, next_temp);
	    find_next_temp();
	}
	(void) sprintf(output_string, "%s%s%c",
	    real_symbol, array_bounds, (var_list[i]=='!' ? ',' : ' '));
	my_output(output_string);
    }
    semicolon();
}


/*
 * If we're not processing TeX, we return 0 (false).  Otherwise,
 * return 1 if the label is "10" and we're not in one of four TeX
 * routines where the line labeled "10" isn't the end of the routine.
 * Otherwise, return 0.
 */
doreturn(label)
char *label;
{
    if (!tex) return(0);
    if (strcmp(label, "10")) return(0);
    if (strcmp(my_routine, "macrocall") == 0) return(0);
    if (strcmp(my_routine, "hpack") == 0) return(0);
    if (strcmp(my_routine, "vpackage") == 0) return(0);
    if (strcmp(my_routine, "trybreak") == 0) return(0);
    return(1);
}


/* Return the absolute value of a long */
long labs(x)
long x;
{
    if (x < 0L) return(-x);
    return(x);
}
short yyexca[] ={
-1, 1,
	0, -1,
	-2, 0,
-1, 35,
	292, 29,
	-2, 26,
-1, 50,
	292, 43,
	-2, 40,
-1, 63,
	292, 85,
	293, 85,
	302, 85,
	-2, 82,
-1, 145,
	91, 141,
	46, 141,
	-2, 143,
-1, 197,
	292, 71,
	302, 71,
	-2, 74,
-1, 286,
	292, 71,
	302, 71,
	-2, 74,
-1, 338,
	61, 0,
	306, 0,
	60, 0,
	62, 0,
	307, 0,
	308, 0,
	-2, 166,
-1, 339,
	61, 0,
	306, 0,
	60, 0,
	62, 0,
	307, 0,
	308, 0,
	-2, 168,
-1, 341,
	61, 0,
	306, 0,
	60, 0,
	62, 0,
	307, 0,
	308, 0,
	-2, 172,
-1, 342,
	61, 0,
	306, 0,
	60, 0,
	62, 0,
	307, 0,
	308, 0,
	-2, 174,
-1, 343,
	61, 0,
	306, 0,
	60, 0,
	62, 0,
	307, 0,
	308, 0,
	-2, 176,
-1, 344,
	61, 0,
	306, 0,
	60, 0,
	62, 0,
	307, 0,
	308, 0,
	-2, 178,
-1, 358,
	277, 248,
	-2, 251,
	};
# define YYNPROD 254
# define YYLAST 526
short yyact[]={

 294, 364, 349, 221, 351, 119, 120, 365, 293, 288,
 381, 118, 255, 253, 333, 254,  46, 266,   5, 199,
 228, 255, 253,  97, 254, 289, 266,  60,  47, 172,
 260, 257, 261,  46, 238, 290,  82,  83,  10, 260,
 257, 261, 255,  11, 273,  47,  84, 266,   6,  12,
  67,  13, 250, 251, 249,  95,  54,  96, 354, 255,
 253,  21, 254, 332, 266,  20,  19,  18, 255, 253,
  17, 254, 395, 266,   8,   9, 178, 260, 257, 261,
 255, 253, 177, 254, 330, 266, 260, 257, 261, 255,
 253, 353, 254, 352, 266, 139, 149, 370, 260, 257,
 261, 180,  40, 152,  61, 138, 153, 260, 257, 261,
 236, 234, 151, 133,  49, 232, 255, 253, 150, 254,
 240, 266, 159, 124, 173, 103, 102, 106, 107, 136,
 145, 135, 137, 146, 147, 139, 149, 387, 108, 278,
  34,  80, 129, 152, 220, 138, 153, 175, 391,  78,
 316, 382, 151,  89,  77, 322, 198, 353, 150, 352,
 206,  15,  78, 184, 175, 162, 373,  77, 392, 136,
 145, 135, 137, 146, 147, 286, 377, 313,  23, 133,
 133, 202, 129, 203, 361, 133, 214, 225,  33,  81,
 229, 133, 169, 208,  48, 210,  14,  43, 175, 226,
 171, 175, 284, 366, 196, 243, 244, 212, 222, 170,
  22,  64, 100,  30, 155,  31, 268, 133,  86, 252,
  44, 276,  72,  56, 363,  29, 376,  27,  99, 200,
 195, 193, 191,  46, 168, 117,  91,  90,  55, 277,
 375, 326, 362, 282,  28,  47,  26,  99,  59, 295,
 291, 283, 211,  58,  57, 325, 201,  32,  25,  16,
  92,  98, 194, 176, 327,  42,  41, 328, 207, 156,
 311, 398, 379, 397, 378,  79, 258, 262, 263, 265,
 390,  70, 256, 259, 264, 258, 262, 263, 265, 115,
 110, 256, 259, 264,  88, 101, 357, 334, 335, 336,
 337, 338, 339, 340, 341, 342, 343, 344, 345, 346,
 347,  39, 256, 259, 264, 356, 358, 133, 267, 355,
 133, 154, 359, 258, 262, 263, 265, 157, 158, 256,
 259, 264, 258, 262, 263, 265, 368,  94, 256, 259,
 264,  36, 315, 190, 258, 262, 263, 265, 227, 188,
 256, 259, 264, 258, 262, 263, 265,  51, 314, 256,
 259, 264, 237, 187, 271, 133, 186, 272,  69, 393,
 144, 374, 385, 380, 143, 383, 386,  53, 384, 133,
 285, 389, 388, 265, 394, 142, 256, 259, 264, 103,
 102, 106, 107, 318, 133, 323, 396, 145, 399, 400,
 223, 224, 108, 246, 350, 247, 174, 324,  66, 372,
 348, 310, 185, 213, 217, 218, 274, 189, 183, 219,
 320, 319, 148, 141, 140, 275, 132, 131, 179, 329,
 369, 312, 292, 245, 270, 269, 216, 309, 308, 307,
 306, 305, 304, 303, 302, 301, 300, 299, 298, 297,
 237, 296, 215, 371, 331, 248, 209, 182, 205, 134,
 204, 128, 127, 126, 125, 123, 122, 121, 181, 130,
 321, 281, 235, 113,  76, 280, 233, 279, 231, 192,
 112, 111,  75,  74,  73, 109, 114,  65,  63, 242,
 367, 287, 241, 239, 197, 167, 166, 165, 164,  45,
 163, 161, 160, 116,  85,  52,  50, 105, 104,  68,
  37,  35,  38,  24, 360, 317, 230,  93,   4,  87,
  71,  62,   7,   3,   2,   1 };
short yypact[]={

-1000,-1000,-255,-1000,-1000,-218,-229,-109, 200,-222,
-225,-226,-227,-231, -82,-1000,-1000, 199, 187, 185,
 154, 198,-138,-1000,-184,-1000,-1000, 225,-1000, 224,
-1000,-282,-1000,-166,-1000,-1000,-1000,-236, 179,-1000,
-1000, 195, 194, 189,-263,-182,-1000,-1000,-1000,-1000,
-1000,-1000,-242,-1000,-1000,-1000,-184,-1000,-1000,-1000,
-282,-1000,-118,-1000,-1000,-256,-1000,-1000, 157,-1000,
-1000,-105,-1000, 178, 177,-1000,-1000,-237,-269,-1000,
 203,-1000,-1000,-1000,-1000, 151,-160,-1000,-1000,-1000,
-1000,-1000,-1000,-109,-1000,-1000,-1000,-1000,-1000,-256,
-1000, 176,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-163,
 -82, 229, 229, 229, -65,-1000, -65,-1000, 142,-1000,
-1000, 205,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,
-1000,-1000,-1000,-207,-213,-1000,-1000,-1000,-185,-1000,
-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-100,-1000,
-1000,-1000,-1000,-1000,-138, 173,-1000, 172, 204, 171,
-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000, 113,
-1000,-115,-280, 170, 210,-163,-123,-1000,-1000, 228,
-1000,-163, 161,-1000,-1000, 104, 104,-163,-273, 104,
-1000,-1000,-169,-1000,-1000,-1000,-265,-1000,-1000,-1000,
-1000,-1000,-1000,-1000, 104, 104,-1000,-1000, 139, 161,
-1000,-1000,-248,-163,  47, 104,-1000,-1000,-1000,-1000,
-1000,-1000,-1000,-1000,-1000,  38,  88,-245,-1000,  38,
-166, 180,-1000,-1000,-1000, -65, 158,-1000,-1000, 116,
-1000,-267, -65,  38,  38, 104,-1000,-1000, 104,-1000,
-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,
-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000, 104,
 228, -84,-1000,-1000,-126,-1000,-1000,-169,-1000,-256,
-1000,-1000,-1000,-116,-265,-1000,-1000, 197,-1000,-1000,
-1000,-1000, 223,-1000,  26, -30, 104, 104, 104, 104,
 104, 104, 104, 104, 104, 104, 104, 104, 104, 104,
-193,  17,-1000,-163, 104, 104,-163, -74,-1000, 184,
-1000, 165, -65, 110,-1000,-1000,-267,-1000,-1000,-1000,
-189,-1000,-1000,-1000,   0,   0,-1000,-1000,  74,  74,
-1000,  74,  74,  74,  74,-1000,   0,-1000, 107,-1000,
 182,-1000,-1000,-1000,-1000,-1000,  38, -85,  38,-1000,
-1000,-163,-289,-1000,-1000,-1000,-120, -65,-1000, 104,
-1000, 104,-1000,-127,-1000,-123,-193,-1000,-129, -94,
 105,-1000, -65,-1000,-1000, -21,-1000,-1000,-1000,-1000,
-163,-1000,-1000,-1000,-1000,-1000,-1000, 104, 104,  38,
  38 };
short yypgo[]={

   0, 525, 524, 523, 522, 196, 210, 188, 194, 521,
 520, 519, 518, 165, 260, 517, 516, 515, 514, 513,
 512, 311, 511, 341, 510, 509, 208, 508, 507, 506,
 357, 505, 504, 503,   7, 502, 501, 500, 220, 499,
 498, 497, 496, 495, 110,   1, 494, 493, 120, 492,
 491, 490,   9, 489, 488, 211, 487, 141, 486, 189,
 485,  11, 222, 484, 483, 482, 481, 214, 480, 479,
 478, 115, 139, 477, 476, 475, 474, 473, 472, 471,
 470, 469, 468,   5,   6, 467, 466, 465, 464, 463,
 462, 461,   3, 460,   0, 459, 458, 457, 456, 195,
 455, 454, 453, 452, 451, 449, 448, 447, 446, 445,
 444, 443, 442, 441, 440, 439, 438, 437, 436, 435,
 434, 160, 433, 432,   8, 430, 429, 428, 427, 426,
 424, 423, 422, 418, 417, 416, 413, 412, 411, 410,
 409,   2, 404,   4, 385, 374, 370, 366, 364, 363,
 358, 349, 348, 342, 296, 280, 274, 273, 272, 271 };
short yyr1[]={

   0,   4,   9,   1,   2,   2,  12,  12,  12,  12,
  12,  12,  12,  12,   3,  15,  16,  17,  14,   5,
  19,   5,  20,  20,  21,   6,   6,  22,  22,  24,
  25,  23,  26,  26,  26,  26,  27,  27,  28,   7,
   7,  29,  29,  31,  32,  33,  30,  34,  34,  35,
  35,  13,  39,  39,  38,  38,  37,  36,  36,  36,
  36,  43,  40,  40,  44,  44,  45,  46,  41,  47,
  47,  49,  51,  48,  48,  50,  50,  52,  52,  53,
  42,   8,   8,  54,  54,  56,  58,  55,  57,  57,
  59,  59,  59,  11,  60,  11,  10,  10,  62,  62,
  63,  66,  65,  68,  65,  67,  69,  67,  70,  70,
  73,  72,  74,  71,  75,  71,  64,  77,  78,  80,
  76,  79,  18,  82,  81,  61,  61,  83,  83,  85,
  84,  84,  86,  86,  86,  86,  86,  93,  88,  96,
  88,  97,  92,  92,  95,  95,  98,  98, 100,  99,
  99,  99,  99, 101, 102, 101,  94, 104,  94, 105,
  94, 106,  94, 107,  94, 108,  94, 109,  94, 110,
  94, 111,  94, 112,  94, 113,  94, 114,  94, 115,
  94, 116,  94, 117,  94,  94, 103, 103, 103, 119,
 118, 118, 118, 118, 120, 118, 122, 121, 123, 125,
 123, 124, 126, 126,  89,  89, 127,  89,  90,  91,
  87,  87,  87, 128, 128, 130, 130, 134, 135, 132,
 136, 133, 137, 138, 131, 139, 139, 141, 142, 142,
 143, 143, 140, 140, 129, 129, 129, 147, 148, 144,
 149, 150, 145, 151, 153, 155, 146, 152, 156, 157,
 154, 158, 159, 154 };
short yyr2[]={

   0,   0,   0,  10,   0,   2,   4,   4,   6,   4,
   6,   4,   6,   4,   3,   0,   0,   0,   8,   0,
   0,   4,   1,   3,   1,   0,   2,   1,   2,   0,
   0,   6,   1,   1,   1,   1,   1,   1,   1,   0,
   2,   1,   2,   0,   0,   0,   7,   1,   1,   1,
   1,   3,   0,   1,   2,   1,   1,   1,   1,   1,
   1,   2,   6,   8,   1,   1,   1,   0,   4,   1,
   3,   0,   0,   5,   0,   1,   3,   1,   1,   0,
   4,   0,   2,   1,   2,   0,   0,   6,   1,   3,
   1,   1,   1,   0,   0,   5,   1,   2,   2,   2,
   2,   0,   5,   0,   5,   0,   0,   4,   1,   3,
   0,   4,   0,   2,   0,   3,   2,   0,   0,   0,
   9,   1,   3,   0,   4,   1,   3,   1,   3,   1,
   1,   1,   1,   1,   1,   1,   1,   0,   4,   0,
   4,   0,   3,   1,   1,   1,   1,   2,   0,   4,
   2,   2,   2,   1,   0,   4,   2,   0,   4,   0,
   4,   0,   4,   0,   4,   0,   4,   0,   4,   0,
   4,   0,   4,   0,   4,   0,   4,   0,   4,   0,
   4,   0,   4,   0,   4,   1,   1,   1,   1,   0,
   4,   1,   1,   1,   0,   3,   0,   4,   1,   0,
   4,   2,   2,   0,   1,   1,   0,   3,   2,   0,
   1,   1,   1,   1,   1,   1,   2,   0,   0,   6,
   0,   3,   0,   0,   7,   1,   3,   3,   1,   3,
   1,   1,   1,   2,   1,   1,   1,   0,   0,   6,
   0,   0,   6,   0,   0,   0,   9,   1,   0,   0,
   5,   0,   0,   5 };
short yychk[]={

-1000,  -1,  -2,  -3, -12, 273, 303,  -4, 292, 304,
 267, 272, 278, 280,  -5, 270,  59, 292, 292, 292,
 292, 292,  -6, 260, -19,  59,  59,  40,  59,  40,
  59,  61,  59,  -7, 278, -22, -23, -24, -20, -21,
 286,  41,  41, -13, -38, -39, 298, 310,  -8, 280,
 -29, -30, -31, -23, 292,  59,  44,  59,  59,  59,
 290, 286,  -9, -54, -55, -56, -30, 292, -25, -21,
 -38, -10, -62, -63, -64, -65, -76, 272, 267, -55,
 -57, -59, 292, 293, 302, -32,  61, -11, -62, 258,
  59,  59, -14, -15, -14, 292, 294, 292,  58,  44,
  61, -26, 286, 285, -27, -28, 287, 288, 298, -60,
  -5, -66, -68, -77, -58, -59, -33,  59, -61, -83,
 -84, -85, -86, -87, 286, -88, -89, -90, -91, 305,
 -81,-128,-129, -92, -95, 294, 292, 295, 268, 258,
-130,-131,-144,-145,-146, 293, 296, 297,-132, 259,
 281, 275, 266, 269,  -6, -67,  40, -67, -67, -34,
 -35, -36, -13, -37, -40, -41, -42, -43, 299, 257,
 274, 265,  94, -34, 264,  59,  58, 289, 289,-127,
 286, -82, -97,-133, 263,-137,-147,-149,-151,-134,
  -7,  59, -69,  59,  58,  59,  91, -46, 271, 299,
  59,  46, -83, -84, -93, -96,-121,  40, -61, -98,
 -99,  91,  46,-136, -94,-103,-118, 310, 311, 315,
  40, -92, -26, 296, 297, -94, -61,-152, 293, -94,
 -16, -70, -71, -74, 280, -78, -44, -13, 299, -47,
 -48, -49, -53, -94, -94,-122, 264, -99,-100, 302,
 300, 301, -83,  43,  45,  42, 312,  61, 306, 313,
  60,  62, 307, 308, 314, 309,  47, 271, -94,-119,
-120,-148, 279, 289,-135,  -8,  41,  59, -72, -73,
 -75, -79, -34,  93,  44, 264,  59, -50, -52, 292,
 302, -34,-123,-124, -94, -94,-104,-105,-106,-107,
-108,-109,-110,-111,-112,-113,-114,-115,-116,-117,
-138, -94,-121, 261,-150,-153, 276, -17, -71, -57,
 -72, -80, 271, -44, -48,  58,  44,  41,  44,-126,
  58,-101,  93,  44, -94, -94, -94, -94, -94, -94,
 -94, -94, -94, -94, -94, -94, -94, -94,-139,-141,
-142,-143, 286, 284,  41, -83, -94,-154, -94, -83,
 -18, 258,  58,  59, -45, -34,  93, -51, -52,-125,
 286,-102,-140,  59, 264,  58,  44, 261,-156,-158,
 -61, 299, 271, -34,-124, -94,-141, 264, -84,-143,
-155, 277, 262, 264, -45,  93, -83,-157,-159, -94,
 -94 };
short yydef[]={

   4,  -2,   0,   1,   5,   0,   0,  19,   0,   0,
   0,   0,   0,   0,  25,  20,  14,   0,   0,   0,
   0,   0,  39,  29,   0,   6,   7,   0,   9,   0,
  11,  52,  13,  81,  43,  -2,  27,   0,   0,  22,
  24,   0,   0,   0,   0,   0,  55,  53,   2,  85,
  -2,  41,   0,  28,  30,  21,   0,   8,  10,  12,
  52,  54,   0,  -2,  83,   0,  42,  44,   0,  23,
  51,  93,  96,   0,   0,  15,  15,   0,   0,  84,
   0,  88,  90,  91,  92,   0,   0,   3,  97,  94,
  98,  99, 100,  19, 116, 101, 103, 117,  86,   0,
  45,   0,  32,  33,  34,  35,  36,  37,  38, 209,
  25, 105, 105, 105,  52,  89,  52,  31,   0, 125,
 127,   0, 130, 131, 129, 132, 133, 134, 135, 136,
 210, 211, 212,   0,   0, 204, 205, 206,   0, 123,
 213, 214, 234, 235, 236,  -2, 144, 145, 215, 222,
 237, 240, 243, 217,  39,   0, 106,   0,   0,   0,
  47,  48,  49,  50,  57,  58,  59,  60,  56,   0,
  67,   0,   0,   0,   0, 209, 209, 137, 139,   0,
 208, 209,   0, 216, 220,   0,   0, 209,   0,   0,
  16, 102, 112, 104, 118,  87,  52,  -2,  79,  61,
  46,  95, 126, 128,   0,   0, 207, 196,   0, 142,
 146, 148,   0, 209,   0,   0, 185, 186, 187, 188,
 189, 191, 192, 193, 194, 238,   0,   0, 247, 218,
  81,   0, 108, 110, 114,  52,   0,  64,  65,   0,
  69,   0,  52, 138, 140,   0, 124, 147,   0, 150,
 151, 152, 221, 157, 159, 161, 163, 165, 167, 169,
 171, 173, 175, 177, 179, 181, 183, 223, 156,   0,
   0,   0, 241, 244,   0,  17, 107, 112, 113,   0,
 110, 119, 121,   0,  52,  68,  -2,   0,  75,  77,
  78,  80,   0, 198, 203,   0,   0,   0,   0,   0,
   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
   0,   0, 195, 209,   0,   0, 209,   0, 109,   0,
 115,   0,  52,   0,  70,  72,   0, 197, 199, 201,
   0, 149, 153, 154, 158, 160, 162, 164,  -2,  -2,
 170,  -2,  -2,  -2,  -2, 180, 182, 184,   0, 225,
   0, 228, 230, 231, 190, 239, 242,   0,  -2, 219,
  18, 209,   0, 120,  62,  66,   0,  52,  76,   0,
 202,   0, 224,   0, 232, 209,   0, 245,   0,   0,
   0, 111,  52,  73, 200,   0, 226, 233, 227, 229,
 209, 249, 252, 122,  63, 155, 246,   0,   0, 250,
 253 };
/*
  HEADER: CUG	 nnn.nn;
  TITLE:	 YACC - Yet Another Compilier-Compilier
  VERSION:	 1.0 for IBM-PC
  DATE: 	 JAN 28, 1985
  DESCRIPTION:	 LALR(1) Parser Generator. From UNIX
  KEYWORDS:	 Parser Generator Compilier-Compilier YACC
  SYSTEM:	 IBM-PC and Compatiables
  FILENAME:      YYPARS.C
  WARNINGS:	 This program is not for the casual user. It will
		 be useful primarily to expert developers.
  CRC:		 N/A
  SEE-ALSO:	 LEX and PREP
  AUTHORS:	 Scott Guthery 11100 leafwood lane Austin, TX 78750
  COMPILERS:	 DESMET-C
  REFERENCES:	 UNIX Systems Manuals
*/

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

int yyparse( void )
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
# line 48
{block_level++;
			 printf("#include \"%s\"\n", std_header);} break;
case 2:
# line 52
{printf("\n#include \"%s\"\n", coerce_name);} break;
case 3:
# line 55
{YYACCEPT;} break;
case 6:
# line 63
{
			    ii = add_to_table(last_id); 
			    sym_table[ii].typ = field_id_tok;
			} break;
case 7:
# line 68
{
			    ii = add_to_table(last_id); 
			    sym_table[ii].typ = fun_id_tok;
			} break;
case 8:
# line 73
{
			    ii = add_to_table(last_id); 
			    sym_table[ii].typ = fun_param_tok;
			} break;
case 9:
# line 78
{
			    ii = add_to_table(last_id); 
			    sym_table[ii].typ = proc_id_tok;
			} break;
case 10:
# line 83
{
			    ii = add_to_table(last_id); 
			    sym_table[ii].typ = proc_param_tok;
			} break;
case 11:
# line 88
{
			    ii = add_to_table(last_id); 
			    sym_table[ii].typ = type_id_tok;
			} break;
case 12:
# line 94
{
			    ii = add_to_table(last_id); 
			    sym_table[ii].typ = type_id_tok;
			    sym_table[ii].val = lower_bound;
			    sym_table[ii].val_sym = lower_sym;
			    sym_table[ii].upper = upper_bound;
			    sym_table[ii].upper_sym = upper_sym;
			} break;
case 13:
# line 103
{
			    ii = add_to_table(last_id); 
			    sym_table[ii].typ = var_id_tok;
			} break;
case 15:
# line 113
{	if (block_level > 0) my_output("{");
			indent++; block_level++;
		      } break;
case 16:
# line 118
{if (block_level == 2) {
			    if (function_return_type[0]) {
			      my_output("register");
			      my_output(function_return_type);
			      my_output("Result;");
			    }
			    if (tex) {
			      (void) sprintf(safe_string, "%s_regmem",
						my_routine);
			      my_output(safe_string);
			      indent_line();
			    }
			 }
			} break;
case 17:
# line 133
{if (block_level == 1)
				puts("\n#include \"coerce.h\"");
			 doing_statements = TRUE;
			} break;
case 18:
# line 138
{if (block_level == 2) {
			    if (function_return_type[0]) {
			      my_output("return(Result)");
			      semicolon();
			      function_return_type[0] = '\0';
			     }
			     if (tex) {
			       if (uses_mem && uses_eqtb)
				(void) fprintf(coerce,
	"#define %s_regmem register memoryword *mem=zmem, *eqtb=zeqtb;\n",
				   my_routine);
			       else if (uses_mem)
				(void) fprintf(coerce,
			"#define %s_regmem register memoryword *mem=zmem;\n",
				   my_routine);
			       else if (uses_eqtb)
				(void) fprintf(coerce,
			"#define %s_regmem register memoryword *eqtb=zeqtb;\n",
				   my_routine);
			       else
				(void) fprintf(coerce,
				   "#define %s_regmem\n",
				   my_routine);
			    }
			    my_routine[0] = '\0';
			 }
			 indent--; block_level--;
			 my_output("}"); new_line();
			 doing_statements = FALSE;
			} break;
case 20:
# line 172
{ my_output("/*"); } break;
case 21:
# line 174
{ my_output("*/"); } break;
case 24:
# line 182
{ my_output(temp); } break;
case 26:
# line 187
{ indent_line(); } break;
case 29:
# line 195
{ new_line(); my_output("#define"); } break;
case 30:
# line 197
{ ii=add_to_table(last_id);
				  sym_table[ii].typ = const_id_tok;
				  my_output(last_id);
				} break;
case 31:
# line 202
{ sym_table[ii].val=last_i_num;
				  new_line(); } break;
case 32:
# line 207
{
				  (void) sscanf(temp, "%ld", &last_i_num);
				  if (labs((long) last_i_num) > 32767)
				      (void) strcat(temp, "L");
				  my_output(temp);
				  yyval = ex_32;
				} break;
case 33:
# line 215
{ my_output(temp);
				  yyval = ex_real;
				} break;
case 34:
# line 219
{ yyval = 0; } break;
case 35:
# line 221
{ yyval = ex_32; } break;
case 36:
# line 225
{ int i, j; char s[132];
	  			  j = 1;
				  s[0] = '"';
	  			  for (i=1; yytext[i-1]!=0; i++) {
	  			    if (yytext[i] == '\\' || yytext[i] == '"')
					s[j++]='\\';
	    			    else if (yytext[i] == '\'') i++;
	    			    s[j++] = yytext[i];
				  }
	    			  s[j-1] = '"';
				  s[j] = 0;
				  my_output(s);
				} break;
case 37:
# line 239
{ char s[5];
				  s[0]='\'';
	    			  if (yytext[1] == '\\' || yytext[1] == '\'') {
	  				s[2] = yytext[1];
					s[1] = '\\';
					s[3] = '\'';
					s[4] = '\0';
				  }
	  			  else {
					s[1] = yytext[1];
					s[2]='\'';
					s[3]='\0';
				  }
	  			  my_output(s);
				} break;
case 38:
# line 257
{ my_output(last_id); } break;
case 43:
# line 269
{ my_output("typedef"); } break;
case 44:
# line 271
{ ii = add_to_table(last_id);
				  sym_table[ii].typ = type_id_tok;
				  (void) strcpy(safe_string, last_id);
				  last_type = ii;
				} break;
case 45:
# line 277
{
				  array_bounds[0] = 0;
				  array_offset[0] = 0;
				} break;
case 46:
# line 282
{ if (*array_offset) {
			fprintf(stderr, "Cannot typedef arrays with offsets\n");
					exit(1);
				  }
				  my_output(safe_string);
				  my_output(array_bounds);
				  semicolon();
				  last_type = -1;
				} break;
case 49:
# line 298
{ if (last_type >= 0) {
					sym_table[ii].val = lower_bound;
					sym_table[ii].val_sym = lower_sym;
			 		sym_table[ii].upper = upper_bound;
					sym_table[ii].upper_sym = upper_sym;
					ii= -1;
				  }
/* The following code says: if the bounds are known at translation time
 * on an integral type, then we select the smallest type of data which
 * can represent it in ANSI C.  We only use unsigned types when necessary.
 */
				  if (lower_sym == -1 && upper_sym == -1) {
				    if (lower_bound>= -127 && upper_bound<=127)
					my_output("schar");
				    else if (lower_bound >= 0
				      && upper_bound <= 255)
					my_output("unsigned char");
	  			    else if (lower_bound >= -32767
				      && upper_bound <= 32767)
					my_output("short");
	  			    else if (lower_bound >= 0
				      && upper_bound <= 65535)
					my_output("unsigned short");
	  			    else my_output("integer");
				  }
				  else my_output("integer");
				} break;
case 54:
# line 336
{lower_bound = upper_bound;
				 lower_sym = upper_sym;
				 (void) sscanf(temp, "%d", &upper_bound);
				 upper_sym = -1; /* no sym table entry */
				} break;
case 55:
# line 342
{ lower_bound = upper_bound;
				  lower_sym = upper_sym;
				  upper_bound = sym_table[l_s].val;
				  upper_sym = l_s;
				} break;
case 56:
# line 350
{if (last_type >= 0) {
	    sym_table[last_type].var_not_needed = sym_table[l_s].var_not_needed;
	    sym_table[last_type].upper = sym_table[l_s].upper;
	    sym_table[last_type].upper_sym = sym_table[l_s].upper_sym;
	    sym_table[last_type].val = sym_table[l_s].val;
	    sym_table[last_type].val_sym = sym_table[l_s].val_sym;
	 }
	 my_output(last_id); } break;
case 57:
# line 361
{if (last_type >= 0)
				    sym_table[last_type].var_not_needed = TRUE;} break;
case 59:
# line 365
{if (last_type >= 0)
				    sym_table[last_type].var_not_needed = TRUE;} break;
case 60:
# line 368
{if (last_type >= 0)
				    sym_table[last_type].var_not_needed = TRUE;} break;
case 61:
# line 373
{if (last_type >= 0) {
	    sym_table[last_type].var_not_needed = sym_table[l_s].var_not_needed;
	    sym_table[last_type].upper = sym_table[l_s].upper;
	    sym_table[last_type].upper_sym = sym_table[l_s].upper_sym;
	    sym_table[last_type].val = sym_table[l_s].val;
	    sym_table[last_type].val_sym = sym_table[l_s].val_sym;
	 }
	 my_output(last_id); my_output("*"); } break;
case 64:
# line 389
{ compute_array_bounds(); } break;
case 65:
# line 391
{ int i, j;
				  lower_bound = sym_table[l_s].val;
				  lower_sym = sym_table[l_s].val_sym;
				  upper_bound = sym_table[l_s].upper;
				  upper_sym = sym_table[l_s].upper_sym;
				  compute_array_bounds();
				} break;
case 67:
# line 405
{ my_output("struct"); my_output("{"); indent++;} break;
case 68:
# line 407
{ indent--; my_output("}"); semicolon(); } break;
case 71:
# line 415
{ field_list[0] = 0; } break;
case 72:
# line 417
{
				  /*array_bounds[0] = 0;
				  array_offset[0] = 0;*/
				} break;
case 73:
# line 422
{ int i=0, j; char temp[80];
				  while(field_list[i++] == '!') {
					j = 0;
					while (field_list[i])
					    temp[j++] = field_list[i++];
					i++;
					if (field_list[i] == '!')
						temp[j++] = ',';
					temp[j] = 0;
					my_output(temp);
				  }
				  semicolon();
				} break;
case 77:
# line 443
{ int i=0, j=0;
				  while (field_list[i] == '!')
					while(field_list[i++]);
				  ii = add_to_table(last_id);
				  sym_table[ii].typ = field_id_tok;
				  field_list[i++] = '!';
				  while (last_id[j])
					field_list[i++] = last_id[j++];
				  field_list[i++] = 0;
				  field_list[i++] = 0;
				} break;
case 78:
# line 455
{ int i=0, j=0;
				  while (field_list[i] == '!')
					while(field_list[i++]);
				  field_list[i++] = '!';
				  while (last_id[j])
					field_list[i++] = last_id[j++];
				  field_list[i++] = 0;
				  field_list[i++] = 0;
				} break;
case 79:
# line 467
{ my_output("file_ptr /* of "); } break;
case 80:
# line 469
{my_output("*/");} break;
case 85:
# line 481
{ var_list[0] = 0;
				  array_bounds[0] = 0;
				  array_offset[0] = 0;
				  var_formals = FALSE;
				  ids_typed = 0;
				} break;
case 86:
# line 488
{
				  array_bounds[0] = 0;	
				  array_offset[0] = 0;
				} break;
case 87:
# line 493
{fixup_var_list();} break;
case 90:
# line 501
{ int i=0, j=0;
				  ii = add_to_table(last_id);
				  sym_table[ii].typ = var_id_tok;
				  sym_table[ii].var_formal = var_formals;
				  id_list[ids_typed++] = ii;
	  			  while (var_list[i] == '!')
					while(var_list[i++]);
				  var_list[i++] = '!';
				  while (last_id[j])
					var_list[i++] = last_id[j++];
	  			  var_list[i++] = 0;
				  var_list[i++] = 0;
				} break;
case 91:
# line 515
{ int i=0, j=0;
				  ii = add_to_table(last_id);
	  			  sym_table[ii].typ = var_id_tok;
				  sym_table[ii].var_formal = var_formals;
				  id_list[ids_typed++] = ii;
	  			  while (var_list[i] == '!')
					while (var_list[i++]);
	  			  var_list[i++] = '!';
				  while (last_id[j])
					var_list[i++] = last_id[j++];
	  			  var_list[i++] = 0;
				  var_list[i++] = 0;
				} break;
case 92:
# line 529
{ int i=0, j=0;
				  ii = add_to_table(last_id);
	  			  sym_table[ii].typ = var_id_tok;
	  			  while (var_list[i] == '!')
					while(var_list[i++]);
	  			  var_list[i++] = '!';
				  while (last_id[j])
					var_list[i++] = last_id[j++];
				  var_list[i++] = 0;
				  var_list[i++] = 0;
				} break;
case 94:
# line 544
{my_output("main_body() {"); indent++; new_line();} break;
case 95:
# line 546
{ indent--; my_output("}"); new_line(); } break;
case 98:
# line 554
{ indent_line(); remove_locals(); } break;
case 99:
# line 556
{ indent_line(); remove_locals(); } break;
case 101:
# line 563
{ ii = add_to_table(last_id);
				  (void) fprintf(stderr, "%3d Procedure %s\n",
					pf_count++, last_id);
				  sym_table[ii].typ = proc_id_tok;
				  (void) strcpy(my_routine, last_id);
				  uses_eqtb = uses_mem = 0;
				} break;
case 103:
# line 572
{ ii = l_s; 
				  (void) fprintf(stderr, "%3d Procedure %s\n",
					pf_count++, last_id);
				} break;
case 105:
# line 580
{ (void) strcpy(z_id, last_id);
				  my_output(last_id); my_output("()");
				  mark();
				} break;
case 106:
# line 585
{ (void) sprintf(z_id, "z%s", last_id);
				  my_output(z_id);
				  (void) fprintf(coerce, "#define %s(",
							 last_id);
				  field_list[0] = 0;
				  my_output("(");
				  sym_table[ii].typ++;
				  f_l = 0;
				  mark();
				  first_param = 0;
				} break;
case 107:
# line 597
{ int i=0, jj;
				  field_list[f_l] = 0;
				  my_output(")");
				  indent_line();
				  (void) fprintf(coerce, ") %s(", z_id);
				  first_param = 0;
				  while (field_list[i++] == '.') {
					my_output(field_list+i);
					jj = i;
					var_formals =
					    (index(field_list+jj, '*') != 0);
					while (field_list[i++]);
					while(field_list[i] == '!') {
					    my_output(field_list+(++i)); 
					    if (first_param)
						(void) putc(',', coerce);
					    if (!var_formals)
					      (void) fprintf(coerce, "(%s)(%c)",
						field_list+jj,
						first_param++ +'a');
					    else
					      (void) fprintf(coerce, "(%s) &(%c)",
						field_list+jj,
						first_param++ +'a');
					    while (field_list[i++]); 
					    if (field_list[i] == '!') {
						my_output(",");
						if (var_formals)
						    (void) putchar('*');
					    }
					}
					semicolon();
				    }
				    (void) fprintf(coerce, ")\n");
				} break;
case 110:
# line 638
{ var_list[0] = 0; ids_typed = 0;} break;
case 111:
# line 640
{ int i=0, id;
				  field_list[f_l++] = '.'; 
				  while (last_id[i])
					field_list[f_l++] = last_id[i++];
				  if (var_formals) {
					if (sym_table[l_s].var_not_needed) {
					    for (id=0; id<ids_typed; id++)
					      sym_table[id_list[id]].var_formal = FALSE;
					}
					else {
					    field_list[f_l++] = ' ';
					    field_list[f_l++] = '*';
					}
				  }
				  field_list[f_l++] = 0;
				  i = 0;
				  while (var_list[i] == '!') {
					if (first_param) {
					    my_output(",");
					    (void) putc(',', coerce);
					}
					(void) fprintf(coerce, "%c",
							first_param++ +'a');
					my_output(var_list+i+1);
					while (var_list[i])
					    field_list[f_l++] = var_list[i++];
					field_list[f_l++] = 0;
					i++;
				  }
				} break;
case 112:
# line 672
{var_formals = 0;} break;
case 114:
# line 673
{var_formals = 1;} break;
case 117:
# line 680
{ push();
				  ii = add_to_table(last_id);
				  func_id = ii;
				  (void) fprintf(stderr, "%3d Function %s\n",
					pf_count++, last_id);
	  			  sym_table[ii].typ = fun_id_tok;
				  (void) strcpy(my_routine, last_id);
				  uses_eqtb = uses_mem = 0;
				} break;
case 118:
# line 690
{ normal();
				  array_bounds[0] = 0;
				  array_offset[0] = 0;
				} break;
case 119:
# line 695
{(void) strcpy(function_return_type, yytext);
				 (void) fprintf(coerce, "%s %s();\n",
					function_return_type,
					z_id);
				 pop();
				} break;
case 123:
# line 711
{my_output("{"); indent++; new_line();} break;
case 124:
# line 713
{ indent--; my_output("}"); new_line(); } break;
case 129:
# line 726
{if (!doreturn(temp)) {
				    (void) sprintf(safe_string, "lab%s:",
					temp);
				    my_output(safe_string);
				 }
				} break;
case 130:
# line 735
{ semicolon(); } break;
case 131:
# line 737
{ semicolon(); } break;
case 136:
# line 745
{my_output("break");} break;
case 137:
# line 749
{ my_output("="); } break;
case 139:
# line 752
{ my_output("Result ="); } break;
case 141:
# line 757
{ if (strcmp(last_id, "mem") == 0)
					uses_mem = 1;
				  else if (strcmp(last_id, "eqtb") == 0)
					uses_eqtb = 1;
				  if (sym_table[l_s].var_formal)
					(void) putchar('*');
				  my_output(last_id);
				  yyval = ex_32;
				} break;
case 143:
# line 768
{ if (sym_table[l_s].var_formal)
					(void) putchar('*');
				  my_output(last_id); yyval = ex_32; } break;
case 144:
# line 774
{ yyval = ex_32; } break;
case 145:
# line 776
{ yyval = ex_32; } break;
case 148:
# line 784
{ my_output("["); } break;
case 149:
# line 786
{ my_output("]"); } break;
case 150:
# line 788
{if (tex || mf) {
				   if (strcmp(last_id, "int")==0)
					my_output(".cint");
				   else if (strcmp(last_id, "lh")==0)
					my_output(".v.LH");
				   else if (strcmp(last_id, "rh")==0)
					my_output(".v.RH");
				   else {
				     (void)sprintf(safe_string, ".%s", last_id);
				     my_output(safe_string);
				   }
				 }
				 else {
				    (void) sprintf(safe_string, ".%s", last_id);
				    my_output(safe_string);
				 }
				} break;
case 151:
# line 806
{ my_output(".hh.b0");} break;
case 152:
# line 808
{ my_output(".hh.b1");} break;
case 154:
# line 813
{ my_output("][");} break;
case 156:
# line 818
{ yyval = yypvt[-0]; } break;
case 157:
# line 819
{my_output("+");} break;
case 158:
# line 820
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 159:
# line 821
{my_output("-");} break;
case 160:
# line 822
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 161:
# line 823
{my_output("*");} break;
case 162:
# line 824
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 163:
# line 825
{my_output("/");} break;
case 164:
# line 826
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 165:
# line 827
{my_output("==");} break;
case 166:
# line 828
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 167:
# line 829
{my_output("!=");} break;
case 168:
# line 830
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 169:
# line 831
{my_output("%");} break;
case 170:
# line 832
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 171:
# line 833
{my_output("<");} break;
case 172:
# line 834
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 173:
# line 835
{my_output(">");} break;
case 174:
# line 836
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 175:
# line 837
{my_output("<=");} break;
case 176:
# line 838
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 177:
# line 839
{my_output(">=");} break;
case 178:
# line 840
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 179:
# line 841
{my_output("&&");} break;
case 180:
# line 842
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 181:
# line 843
{my_output("||");} break;
case 182:
# line 844
{yyval = max(yypvt[-3], yypvt[-0]);} break;
case 183:
# line 846
{ my_output("/ ((double)"); } break;
case 184:
# line 848
{yyval = max(yypvt[-3], yypvt[-0]); my_output(")"); } break;
case 185:
# line 850
{ yyval = yypvt[-0]; } break;
case 187:
# line 855
{ my_output("- (integer)"); } break;
case 188:
# line 857
{ my_output("!"); } break;
case 189:
# line 861
{ my_output("("); } break;
case 190:
# line 863
{ my_output(")"); yyval = yypvt[-3]; } break;
case 193:
# line 867
{ my_output(last_id); my_output("()"); } break;
case 194:
# line 869
{ my_output(last_id); } break;
case 196:
# line 874
{ my_output("("); } break;
case 197:
# line 876
{ my_output(")"); } break;
case 199:
# line 881
{ my_output(","); } break;
case 204:
# line 894
{ my_output(last_id); my_output("()"); } break;
case 205:
# line 896
{ my_output(last_id);
				  ii = add_to_table(last_id);
	  			  sym_table[ii].typ = proc_id_tok;
				  my_output("()");
				} break;
case 206:
# line 902
{ my_output(last_id); } break;
case 208:
# line 907
{if (doreturn(temp)) {
				    if (function_return_type[0])
					my_output("return(Result)");
				    else
					my_output("return");
				 } else {
				     (void) sprintf(safe_string, "goto lab%s",
					temp);
				     my_output(safe_string);
				 }
				} break;
case 217:
# line 937
{ my_output("if"); my_output("("); } break;
case 218:
# line 939
{ my_output(")"); new_line();} break;
case 220:
# line 944
{ my_output("else"); } break;
case 222:
# line 949
{ my_output("switch"); my_output("("); } break;
case 223:
# line 951
{ my_output(")"); indent_line();
				  my_output("{"); indent++;
				} break;
case 224:
# line 955
{ indent--; my_output("}"); new_line(); } break;
case 227:
# line 963
{ my_output("break"); semicolon(); } break;
case 230:
# line 971
{ my_output("case"); 
				  my_output(temp);
				  my_output(":"); indent_line();
				} break;
case 231:
# line 976
{ my_output("default:"); indent_line(); } break;
case 237:
# line 989
{ my_output("while");
				  my_output("(");
				} break;
case 238:
# line 993
{ my_output(")"); } break;
case 240:
# line 998
{ my_output("do"); my_output("{"); indent++; } break;
case 241:
# line 1000
{ indent--; my_output("}"); 
				  my_output("while"); my_output("( ! (");
				} break;
case 242:
# line 1004
{ my_output(") )"); } break;
case 243:
# line 1008
{
				  my_output("{");
				  my_output("register");
				  my_output("integer");
				  if (strict_for)
					my_output("for_begin,");
				  my_output("for_end;");
				 } break;
case 244:
# line 1017
{ if (strict_for)
					my_output("for_begin");
				  else
					my_output(control_var);
				  my_output("="); } break;
case 245:
# line 1023
{ my_output("; if (");
				  if (strict_for) my_output("for_begin");
				  else my_output(control_var);
				  my_output(relation);
				  my_output("for_end)");
				  if (strict_for) {
					my_output("{");
					my_output(control_var);
					my_output("=");
					my_output("for_begin");
					semicolon();
				  }
				  my_output("do"); 
				  indent++; 
				  new_line();} break;
case 246:
# line 1039
{
				  char *top = rindex(for_stack, '#');
				  indent--; new_line();
				  my_output("while"); 
				  my_output("("); 
				  my_output(top+1); 
				  my_output(")"); 
				  my_output(";");
				  my_output("}");
				  if (strict_for)
					my_output("}");
				  *top=0;
				  new_line();
				} break;
case 247:
# line 1056
{(void) strcpy(control_var, last_id); } break;
case 248:
# line 1060
{ my_output(";"); } break;
case 249:
# line 1062
{ 
				  (void) strcpy(relation, "<=");
				  my_output("for_end");
				  my_output("="); } break;
case 250:
# line 1067
{ 
				  (void) sprintf(for_stack + strlen(for_stack),
				    "#%s++ < for_end", control_var);
				} break;
case 251:
# line 1072
{ my_output(";"); } break;
case 252:
# line 1074
{
				  (void) strcpy(relation, ">=");
				  my_output("for_end");
				  my_output("="); } break;
case 253:
# line 1079
{ 
				  (void) sprintf(for_stack + strlen(for_stack),
				    "#%s-- > for_end", control_var);
				} break;/* End of actions */
      }
   goto yystack;  /* stack new state and value */

   }
