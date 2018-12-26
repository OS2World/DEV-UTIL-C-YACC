
state 0
	$accept : _PROGRAM $end 
	DEFS : _    (4)

	.  reduce 4

	PROGRAM  goto 1
	DEFS  goto 2

state 1
	$accept :  PROGRAM_$end 

	$end  accept
	.  error


state 2
	PROGRAM :  DEFS_PROGRAM_HEAD $$1 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART VAR_DEC_PART $$2 P_F_DEC_PART BODY 
	DEFS :  DEFS_DEF 

	program_tok  shift 5
	define_tok  shift 6
	.  error

	PROGRAM_HEAD  goto 3
	DEF  goto 4

state 3
	PROGRAM :  DEFS PROGRAM_HEAD_$$1 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART VAR_DEC_PART $$2 P_F_DEC_PART BODY 
	$$1 : _    (1)

	.  reduce 1

	$$1  goto 7

state 4
	DEFS :  DEFS DEF_    (5)

	.  reduce 5


state 5
	PROGRAM_HEAD :  program_tok_undef_id_tok ; 

	undef_id_tok  shift 8
	.  error


state 6
	DEF :  define_tok_field_tok undef_id_tok ; 
	DEF :  define_tok_function_tok undef_id_tok ; 
	DEF :  define_tok_function_tok undef_id_tok ( ) ; 
	DEF :  define_tok_procedure_tok undef_id_tok ; 
	DEF :  define_tok_procedure_tok undef_id_tok ( ) ; 
	DEF :  define_tok_type_tok undef_id_tok ; 
	DEF :  define_tok_type_tok undef_id_tok = SUBRANGE_TYPE ; 
	DEF :  define_tok_var_tok undef_id_tok ; 

	function_tok  shift 10
	procedure_tok  shift 11
	type_tok  shift 12
	var_tok  shift 13
	field_tok  shift 9
	.  error


state 7
	PROGRAM :  DEFS PROGRAM_HEAD $$1_LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART VAR_DEC_PART $$2 P_F_DEC_PART BODY 
	LABEL_DEC_PART : _    (19)

	label_tok  shift 15
	.  reduce 19

	LABEL_DEC_PART  goto 14

state 8
	PROGRAM_HEAD :  program_tok undef_id_tok_; 

	;  shift 16
	.  error


state 9
	DEF :  define_tok field_tok_undef_id_tok ; 

	undef_id_tok  shift 17
	.  error


state 10
	DEF :  define_tok function_tok_undef_id_tok ; 
	DEF :  define_tok function_tok_undef_id_tok ( ) ; 

	undef_id_tok  shift 18
	.  error


state 11
	DEF :  define_tok procedure_tok_undef_id_tok ; 
	DEF :  define_tok procedure_tok_undef_id_tok ( ) ; 

	undef_id_tok  shift 19
	.  error


state 12
	DEF :  define_tok type_tok_undef_id_tok ; 
	DEF :  define_tok type_tok_undef_id_tok = SUBRANGE_TYPE ; 

	undef_id_tok  shift 20
	.  error


state 13
	DEF :  define_tok var_tok_undef_id_tok ; 

	undef_id_tok  shift 21
	.  error


state 14
	PROGRAM :  DEFS PROGRAM_HEAD $$1 LABEL_DEC_PART_CONST_DEC_PART TYPE_DEC_PART VAR_DEC_PART $$2 P_F_DEC_PART BODY 
	CONST_DEC_PART : _    (25)

	const_tok  shift 23
	.  reduce 25

	CONST_DEC_PART  goto 22

state 15
	LABEL_DEC_PART :  label_tok_$$20 LABEL_LIST ; 
	$$20 : _    (20)

	.  reduce 20

	$$20  goto 24

state 16
	PROGRAM_HEAD :  program_tok undef_id_tok ;_    (14)

	.  reduce 14


state 17
	DEF :  define_tok field_tok undef_id_tok_; 

	;  shift 25
	.  error


state 18
	DEF :  define_tok function_tok undef_id_tok_; 
	DEF :  define_tok function_tok undef_id_tok_( ) ; 

	;  shift 26
	(  shift 27
	.  error


state 19
	DEF :  define_tok procedure_tok undef_id_tok_; 
	DEF :  define_tok procedure_tok undef_id_tok_( ) ; 

	;  shift 28
	(  shift 29
	.  error


state 20
	DEF :  define_tok type_tok undef_id_tok_; 
	DEF :  define_tok type_tok undef_id_tok_= SUBRANGE_TYPE ; 

	=  shift 31
	;  shift 30
	.  error


state 21
	DEF :  define_tok var_tok undef_id_tok_; 

	;  shift 32
	.  error


state 22
	PROGRAM :  DEFS PROGRAM_HEAD $$1 LABEL_DEC_PART CONST_DEC_PART_TYPE_DEC_PART VAR_DEC_PART $$2 P_F_DEC_PART BODY 
	TYPE_DEC_PART : _    (39)

	type_tok  shift 34
	.  reduce 39

	TYPE_DEC_PART  goto 33

state 23
	CONST_DEC_PART :  const_tok_CONST_DEC_LIST 
	$$29 : _    (29)

	.  reduce 29

	CONST_DEC_LIST  goto 35
	CONST_DEC  goto 36
	$$29  goto 37

state 24
	LABEL_DEC_PART :  label_tok $$20_LABEL_LIST ; 

	i_num_tok  shift 40
	.  error

	LABEL_LIST  goto 38
	LABEL  goto 39

state 25
	DEF :  define_tok field_tok undef_id_tok ;_    (6)

	.  reduce 6


state 26
	DEF :  define_tok function_tok undef_id_tok ;_    (7)

	.  reduce 7


state 27
	DEF :  define_tok function_tok undef_id_tok (_) ; 

	)  shift 41
	.  error


state 28
	DEF :  define_tok procedure_tok undef_id_tok ;_    (9)

	.  reduce 9


state 29
	DEF :  define_tok procedure_tok undef_id_tok (_) ; 

	)  shift 42
	.  error


state 30
	DEF :  define_tok type_tok undef_id_tok ;_    (11)

	.  reduce 11


state 31
	DEF :  define_tok type_tok undef_id_tok =_SUBRANGE_TYPE ; 
	POSSIBLE_PLUS : _    (52)

	const_id_tok  shift 46
	unary_plus_tok  shift 47
	.  reduce 52

	SUBRANGE_TYPE  goto 43
	SUB_CONSTANT  goto 44
	POSSIBLE_PLUS  goto 45

state 32
	DEF :  define_tok var_tok undef_id_tok ;_    (13)

	.  reduce 13


state 33
	PROGRAM :  DEFS PROGRAM_HEAD $$1 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART_VAR_DEC_PART $$2 P_F_DEC_PART BODY 
	VAR_DEC_PART : _    (81)

	var_tok  shift 49
	.  reduce 81

	VAR_DEC_PART  goto 48

state 34
	TYPE_DEC_PART :  type_tok_TYPE_DEF_LIST 
	$$43 : _    (43)

	.  reduce 43

	TYPE_DEF_LIST  goto 50
	TYPE_DEF  goto 51
	$$43  goto 52

state 35
	CONST_DEC_PART :  const_tok CONST_DEC_LIST_    (26)
	CONST_DEC_LIST :  CONST_DEC_LIST_CONST_DEC 
	$$29 : _    (29)

	undef_id_tok  reduce 29
	.  reduce 26

	CONST_DEC  goto 53
	$$29  goto 37

state 36
	CONST_DEC_LIST :  CONST_DEC_    (27)

	.  reduce 27


state 37
	CONST_DEC :  $$29_undef_id_tok $$30 = CONSTANT ; 

	undef_id_tok  shift 54
	.  error


state 38
	LABEL_DEC_PART :  label_tok $$20 LABEL_LIST_; 
	LABEL_LIST :  LABEL_LIST_, LABEL 

	;  shift 55
	,  shift 56
	.  error


state 39
	LABEL_LIST :  LABEL_    (22)

	.  reduce 22


state 40
	LABEL :  i_num_tok_    (24)

	.  reduce 24


state 41
	DEF :  define_tok function_tok undef_id_tok ( )_; 

	;  shift 57
	.  error


state 42
	DEF :  define_tok procedure_tok undef_id_tok ( )_; 

	;  shift 58
	.  error


state 43
	DEF :  define_tok type_tok undef_id_tok = SUBRANGE_TYPE_; 

	;  shift 59
	.  error


state 44
	SUBRANGE_TYPE :  SUB_CONSTANT_two_dots_tok SUB_CONSTANT 

	two_dots_tok  shift 60
	.  error


state 45
	SUB_CONSTANT :  POSSIBLE_PLUS_i_num_tok 

	i_num_tok  shift 61
	.  error


state 46
	SUB_CONSTANT :  const_id_tok_    (55)

	.  reduce 55


state 47
	POSSIBLE_PLUS :  unary_plus_tok_    (53)

	.  reduce 53


state 48
	PROGRAM :  DEFS PROGRAM_HEAD $$1 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART VAR_DEC_PART_$$2 P_F_DEC_PART BODY 
	$$2 : _    (2)

	.  reduce 2

	$$2  goto 62

state 49
	VAR_DEC_PART :  var_tok_VAR_DEC_LIST 
	$$85 : _    (85)

	.  reduce 85

	VAR_DEC_LIST  goto 63
	VAR_DEC  goto 64
	$$85  goto 65

state 50
	TYPE_DEC_PART :  type_tok TYPE_DEF_LIST_    (40)
	TYPE_DEF_LIST :  TYPE_DEF_LIST_TYPE_DEF 
	$$43 : _    (43)

	undef_id_tok  reduce 43
	.  reduce 40

	TYPE_DEF  goto 66
	$$43  goto 52

state 51
	TYPE_DEF_LIST :  TYPE_DEF_    (41)

	.  reduce 41


state 52
	TYPE_DEF :  $$43_undef_id_tok $$44 = $$45 TYPE ; 

	undef_id_tok  shift 67
	.  error


state 53
	CONST_DEC_LIST :  CONST_DEC_LIST CONST_DEC_    (28)

	.  reduce 28


state 54
	CONST_DEC :  $$29 undef_id_tok_$$30 = CONSTANT ; 
	$$30 : _    (30)

	.  reduce 30

	$$30  goto 68

state 55
	LABEL_DEC_PART :  label_tok $$20 LABEL_LIST ;_    (21)

	.  reduce 21


state 56
	LABEL_LIST :  LABEL_LIST ,_LABEL 

	i_num_tok  shift 40
	.  error

	LABEL  goto 69

state 57
	DEF :  define_tok function_tok undef_id_tok ( ) ;_    (8)

	.  reduce 8


state 58
	DEF :  define_tok procedure_tok undef_id_tok ( ) ;_    (10)

	.  reduce 10


state 59
	DEF :  define_tok type_tok undef_id_tok = SUBRANGE_TYPE ;_    (12)

	.  reduce 12


state 60
	SUBRANGE_TYPE :  SUB_CONSTANT two_dots_tok_SUB_CONSTANT 
	POSSIBLE_PLUS : _    (52)

	const_id_tok  shift 46
	unary_plus_tok  shift 47
	.  reduce 52

	SUB_CONSTANT  goto 70
	POSSIBLE_PLUS  goto 45

state 61
	SUB_CONSTANT :  POSSIBLE_PLUS i_num_tok_    (54)

	.  reduce 54


state 62
	PROGRAM :  DEFS PROGRAM_HEAD $$1 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART VAR_DEC_PART $$2_P_F_DEC_PART BODY 

	function_tok  shift 78
	procedure_tok  shift 77
	.  error

	P_F_DEC_PART  goto 71
	P_F_DEC  goto 72
	PROCEDURE_DEC  goto 73
	FUNCTION_DEC  goto 74
	PROCEDURE_HEAD  goto 75
	FUNCTION_HEAD  goto 76

state 63
	VAR_DEC_PART :  var_tok VAR_DEC_LIST_    (82)
	VAR_DEC_LIST :  VAR_DEC_LIST_VAR_DEC 
	$$85 : _    (85)

	undef_id_tok  reduce 85
	var_id_tok  reduce 85
	field_id_tok  reduce 85
	.  reduce 82

	VAR_DEC  goto 79
	$$85  goto 65

state 64
	VAR_DEC_LIST :  VAR_DEC_    (83)

	.  reduce 83


state 65
	VAR_DEC :  $$85_VAR_ID_DEC_LIST : $$86 TYPE ; 

	undef_id_tok  shift 82
	var_id_tok  shift 83
	field_id_tok  shift 84
	.  error

	VAR_ID_DEC_LIST  goto 80
	VAR_ID  goto 81

state 66
	TYPE_DEF_LIST :  TYPE_DEF_LIST TYPE_DEF_    (42)

	.  reduce 42


state 67
	TYPE_DEF :  $$43 undef_id_tok_$$44 = $$45 TYPE ; 
	$$44 : _    (44)

	.  reduce 44

	$$44  goto 85

state 68
	CONST_DEC :  $$29 undef_id_tok $$30_= CONSTANT ; 

	=  shift 86
	.  error


state 69
	LABEL_LIST :  LABEL_LIST , LABEL_    (23)

	.  reduce 23


state 70
	SUBRANGE_TYPE :  SUB_CONSTANT two_dots_tok SUB_CONSTANT_    (51)

	.  reduce 51


state 71
	PROGRAM :  DEFS PROGRAM_HEAD $$1 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART VAR_DEC_PART $$2 P_F_DEC_PART_BODY 
	P_F_DEC_PART :  P_F_DEC_PART_P_F_DEC 
	BODY : _    (93)

	begin_tok  shift 89
	function_tok  shift 78
	procedure_tok  shift 77
	.  reduce 93

	BODY  goto 87
	P_F_DEC  goto 88
	PROCEDURE_DEC  goto 73
	FUNCTION_DEC  goto 74
	PROCEDURE_HEAD  goto 75
	FUNCTION_HEAD  goto 76

state 72
	P_F_DEC_PART :  P_F_DEC_    (96)

	.  reduce 96


state 73
	P_F_DEC :  PROCEDURE_DEC_; 

	;  shift 90
	.  error


state 74
	P_F_DEC :  FUNCTION_DEC_; 

	;  shift 91
	.  error


state 75
	PROCEDURE_DEC :  PROCEDURE_HEAD_BLOCK 
	$$15 : _    (15)

	.  reduce 15

	BLOCK  goto 92
	$$15  goto 93

state 76
	FUNCTION_DEC :  FUNCTION_HEAD_BLOCK 
	$$15 : _    (15)

	.  reduce 15

	BLOCK  goto 94
	$$15  goto 93

state 77
	PROCEDURE_HEAD :  procedure_tok_undef_id_tok $$101 PARAM ; 
	PROCEDURE_HEAD :  procedure_tok_proc_id_tok $$103 PARAM ; 

	undef_id_tok  shift 95
	proc_id_tok  shift 96
	.  error


state 78
	FUNCTION_HEAD :  function_tok_undef_id_tok $$117 PARAM : $$118 RESULT_TYPE $$119 ; 

	undef_id_tok  shift 97
	.  error


state 79
	VAR_DEC_LIST :  VAR_DEC_LIST VAR_DEC_    (84)

	.  reduce 84


state 80
	VAR_DEC :  $$85 VAR_ID_DEC_LIST_: $$86 TYPE ; 
	VAR_ID_DEC_LIST :  VAR_ID_DEC_LIST_, VAR_ID 

	,  shift 99
	:  shift 98
	.  error


state 81
	VAR_ID_DEC_LIST :  VAR_ID_    (88)

	.  reduce 88


state 82
	VAR_ID :  undef_id_tok_    (90)

	.  reduce 90


state 83
	VAR_ID :  var_id_tok_    (91)

	.  reduce 91


state 84
	VAR_ID :  field_id_tok_    (92)

	.  reduce 92


state 85
	TYPE_DEF :  $$43 undef_id_tok $$44_= $$45 TYPE ; 

	=  shift 100
	.  error


state 86
	CONST_DEC :  $$29 undef_id_tok $$30 =_CONSTANT ; 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	const_id_tok  shift 108
	.  error

	CONSTANT  goto 101
	STRING  goto 104
	CONSTANT_ID  goto 105

state 87
	PROGRAM :  DEFS PROGRAM_HEAD $$1 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART VAR_DEC_PART $$2 P_F_DEC_PART BODY_    (3)

	.  reduce 3


state 88
	P_F_DEC_PART :  P_F_DEC_PART P_F_DEC_    (97)

	.  reduce 97


state 89
	BODY :  begin_tok_$$94 STAT_LIST end_tok . 
	$$94 : _    (94)

	.  reduce 94

	$$94  goto 109

state 90
	P_F_DEC :  PROCEDURE_DEC ;_    (98)

	.  reduce 98


state 91
	P_F_DEC :  FUNCTION_DEC ;_    (99)

	.  reduce 99


state 92
	PROCEDURE_DEC :  PROCEDURE_HEAD BLOCK_    (100)

	.  reduce 100


state 93
	BLOCK :  $$15_LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART $$16 VAR_DEC_PART $$17 STAT_PART 
	LABEL_DEC_PART : _    (19)

	label_tok  shift 15
	.  reduce 19

	LABEL_DEC_PART  goto 110

state 94
	FUNCTION_DEC :  FUNCTION_HEAD BLOCK_    (116)

	.  reduce 116


state 95
	PROCEDURE_HEAD :  procedure_tok undef_id_tok_$$101 PARAM ; 
	$$101 : _    (101)

	.  reduce 101

	$$101  goto 111

state 96
	PROCEDURE_HEAD :  procedure_tok proc_id_tok_$$103 PARAM ; 
	$$103 : _    (103)

	.  reduce 103

	$$103  goto 112

state 97
	FUNCTION_HEAD :  function_tok undef_id_tok_$$117 PARAM : $$118 RESULT_TYPE $$119 ; 
	$$117 : _    (117)

	.  reduce 117

	$$117  goto 113

state 98
	VAR_DEC :  $$85 VAR_ID_DEC_LIST :_$$86 TYPE ; 
	$$86 : _    (86)

	.  reduce 86

	$$86  goto 114

state 99
	VAR_ID_DEC_LIST :  VAR_ID_DEC_LIST ,_VAR_ID 

	undef_id_tok  shift 82
	var_id_tok  shift 83
	field_id_tok  shift 84
	.  error

	VAR_ID  goto 115

state 100
	TYPE_DEF :  $$43 undef_id_tok $$44 =_$$45 TYPE ; 
	$$45 : _    (45)

	.  reduce 45

	$$45  goto 116

state 101
	CONST_DEC :  $$29 undef_id_tok $$30 = CONSTANT_; 

	;  shift 117
	.  error


state 102
	CONSTANT :  i_num_tok_    (32)

	.  reduce 32


state 103
	CONSTANT :  r_num_tok_    (33)

	.  reduce 33


state 104
	CONSTANT :  STRING_    (34)

	.  reduce 34


state 105
	CONSTANT :  CONSTANT_ID_    (35)

	.  reduce 35


state 106
	STRING :  string_literal_tok_    (36)

	.  reduce 36


state 107
	STRING :  single_char_tok_    (37)

	.  reduce 37


state 108
	CONSTANT_ID :  const_id_tok_    (38)

	.  reduce 38


state 109
	BODY :  begin_tok $$94_STAT_LIST end_tok . 
	EMPTY_STAT : _    (209)

	begin_tok  shift 139
	case_tok  shift 149
	for_tok  shift 152
	goto_tok  shift 138
	if_tok  shift 153
	repeat_tok  shift 151
	while_tok  shift 150
	i_num_tok  shift 124
	undef_id_tok  shift 136
	var_id_tok  shift 145
	proc_id_tok  shift 135
	proc_param_tok  shift 137
	fun_id_tok  shift 146
	fun_param_tok  shift 147
	break_tok  shift 129
	.  reduce 209

	STAT_LIST  goto 118
	COMPOUND_STAT  goto 130
	STATEMENT  goto 119
	UNLAB_STAT  goto 120
	S_LABEL  goto 121
	SIMPLE_STAT  goto 122
	STRUCT_STAT  goto 123
	ASSIGN_STAT  goto 125
	PROC_STAT  goto 126
	GO_TO_STAT  goto 127
	EMPTY_STAT  goto 128
	VARIABLE  goto 133
	FUNC_ID_AS  goto 134
	CONDIT_STAT  goto 131
	REPETIT_STAT  goto 132
	IF_STATEMENT  goto 140
	CASE_STATEMENT  goto 141
	BEGIN_IF_STAT  goto 148
	WHILE_STATEMENT  goto 142
	REP_STATEMENT  goto 143
	FOR_STATEMENT  goto 144

state 110
	BLOCK :  $$15 LABEL_DEC_PART_CONST_DEC_PART TYPE_DEC_PART $$16 VAR_DEC_PART $$17 STAT_PART 
	CONST_DEC_PART : _    (25)

	const_tok  shift 23
	.  reduce 25

	CONST_DEC_PART  goto 154

state 111
	PROCEDURE_HEAD :  procedure_tok undef_id_tok $$101_PARAM ; 
	PARAM : _    (105)

	(  shift 156
	.  reduce 105

	PARAM  goto 155

state 112
	PROCEDURE_HEAD :  procedure_tok proc_id_tok $$103_PARAM ; 
	PARAM : _    (105)

	(  shift 156
	.  reduce 105

	PARAM  goto 157

state 113
	FUNCTION_HEAD :  function_tok undef_id_tok $$117_PARAM : $$118 RESULT_TYPE $$119 ; 
	PARAM : _    (105)

	(  shift 156
	.  reduce 105

	PARAM  goto 158

state 114
	VAR_DEC :  $$85 VAR_ID_DEC_LIST : $$86_TYPE ; 
	POSSIBLE_PLUS : _    (52)

	array_tok  shift 169
	file_tok  shift 171
	record_tok  shift 170
	const_id_tok  shift 46
	type_id_tok  shift 168
	unary_plus_tok  shift 47
	^  shift 172
	.  reduce 52

	SUBRANGE_TYPE  goto 162
	TYPE  goto 159
	SIMPLE_TYPE  goto 160
	STRUCTURED_TYPE  goto 161
	TYPE_ID  goto 163
	SUB_CONSTANT  goto 44
	POSSIBLE_PLUS  goto 45
	ARRAY_TYPE  goto 164
	RECORD_TYPE  goto 165
	FILE_TYPE  goto 166
	POINTER_TYPE  goto 167

state 115
	VAR_ID_DEC_LIST :  VAR_ID_DEC_LIST , VAR_ID_    (89)

	.  reduce 89


state 116
	TYPE_DEF :  $$43 undef_id_tok $$44 = $$45_TYPE ; 
	POSSIBLE_PLUS : _    (52)

	array_tok  shift 169
	file_tok  shift 171
	record_tok  shift 170
	const_id_tok  shift 46
	type_id_tok  shift 168
	unary_plus_tok  shift 47
	^  shift 172
	.  reduce 52

	SUBRANGE_TYPE  goto 162
	TYPE  goto 173
	SIMPLE_TYPE  goto 160
	STRUCTURED_TYPE  goto 161
	TYPE_ID  goto 163
	SUB_CONSTANT  goto 44
	POSSIBLE_PLUS  goto 45
	ARRAY_TYPE  goto 164
	RECORD_TYPE  goto 165
	FILE_TYPE  goto 166
	POINTER_TYPE  goto 167

state 117
	CONST_DEC :  $$29 undef_id_tok $$30 = CONSTANT ;_    (31)

	.  reduce 31


state 118
	BODY :  begin_tok $$94 STAT_LIST_end_tok . 
	STAT_LIST :  STAT_LIST_; STATEMENT 

	end_tok  shift 174
	;  shift 175
	.  error


state 119
	STAT_LIST :  STATEMENT_    (125)

	.  reduce 125


state 120
	STATEMENT :  UNLAB_STAT_    (127)

	.  reduce 127


state 121
	STATEMENT :  S_LABEL_: UNLAB_STAT 

	:  shift 176
	.  error


state 122
	UNLAB_STAT :  SIMPLE_STAT_    (130)

	.  reduce 130


state 123
	UNLAB_STAT :  STRUCT_STAT_    (131)

	.  reduce 131


state 124
	S_LABEL :  i_num_tok_    (129)

	.  reduce 129


state 125
	SIMPLE_STAT :  ASSIGN_STAT_    (132)

	.  reduce 132


state 126
	SIMPLE_STAT :  PROC_STAT_    (133)

	.  reduce 133


state 127
	SIMPLE_STAT :  GO_TO_STAT_    (134)

	.  reduce 134


state 128
	SIMPLE_STAT :  EMPTY_STAT_    (135)

	.  reduce 135


state 129
	SIMPLE_STAT :  break_tok_    (136)

	.  reduce 136


state 130
	STRUCT_STAT :  COMPOUND_STAT_    (210)

	.  reduce 210


state 131
	STRUCT_STAT :  CONDIT_STAT_    (211)

	.  reduce 211


state 132
	STRUCT_STAT :  REPETIT_STAT_    (212)

	.  reduce 212


state 133
	ASSIGN_STAT :  VARIABLE_assign_tok $$137 EXPRESS 

	assign_tok  shift 177
	.  error


state 134
	ASSIGN_STAT :  FUNC_ID_AS_assign_tok $$139 EXPRESS 

	assign_tok  shift 178
	.  error


state 135
	PROC_STAT :  proc_id_tok_    (204)

	.  reduce 204


state 136
	PROC_STAT :  undef_id_tok_    (205)

	.  reduce 205


state 137
	PROC_STAT :  proc_param_tok_$$206 PARAM_LIST 
	$$206 : _    (206)

	.  reduce 206

	$$206  goto 179

state 138
	GO_TO_STAT :  goto_tok_i_num_tok 

	i_num_tok  shift 180
	.  error


state 139
	COMPOUND_STAT :  begin_tok_$$123 STAT_LIST end_tok 
	$$123 : _    (123)

	.  reduce 123

	$$123  goto 181

state 140
	CONDIT_STAT :  IF_STATEMENT_    (213)

	.  reduce 213


state 141
	CONDIT_STAT :  CASE_STATEMENT_    (214)

	.  reduce 214


state 142
	REPETIT_STAT :  WHILE_STATEMENT_    (234)

	.  reduce 234


state 143
	REPETIT_STAT :  REP_STATEMENT_    (235)

	.  reduce 235


state 144
	REPETIT_STAT :  FOR_STATEMENT_    (236)

	.  reduce 236


state 145
	VARIABLE :  var_id_tok_$$141 VAR_DESIG_LIST 
	VARIABLE :  var_id_tok_    (143)
	$$141 : _    (141)

	[  reduce 141
	.  reduce 141
	.  reduce 143

	$$141  goto 182

state 146
	FUNC_ID_AS :  fun_id_tok_    (144)

	.  reduce 144


state 147
	FUNC_ID_AS :  fun_param_tok_    (145)

	.  reduce 145


148: shift/reduce conflict (shift 184, red'n 215) on else_tok
state 148
	IF_STATEMENT :  BEGIN_IF_STAT_    (215)
	IF_STATEMENT :  BEGIN_IF_STAT_ELSE_STAT 

	else_tok  shift 184
	.  reduce 215

	ELSE_STAT  goto 183

state 149
	CASE_STATEMENT :  case_tok_$$222 EXPRESS of_tok $$223 CASE_EL_LIST END_CASE 
	$$222 : _    (222)

	.  reduce 222

	$$222  goto 185

state 150
	WHILE_STATEMENT :  while_tok_$$237 EXPRESS $$238 do_tok STATEMENT 
	$$237 : _    (237)

	.  reduce 237

	$$237  goto 186

state 151
	REP_STATEMENT :  repeat_tok_$$240 STAT_LIST until_tok $$241 EXPRESS 
	$$240 : _    (240)

	.  reduce 240

	$$240  goto 187

state 152
	FOR_STATEMENT :  for_tok_$$243 CONTROL_VAR assign_tok $$244 FOR_LIST do_tok $$245 STATEMENT 
	$$243 : _    (243)

	.  reduce 243

	$$243  goto 188

state 153
	BEGIN_IF_STAT :  if_tok_$$217 EXPRESS $$218 then_tok STATEMENT 
	$$217 : _    (217)

	.  reduce 217

	$$217  goto 189

state 154
	BLOCK :  $$15 LABEL_DEC_PART CONST_DEC_PART_TYPE_DEC_PART $$16 VAR_DEC_PART $$17 STAT_PART 
	TYPE_DEC_PART : _    (39)

	type_tok  shift 34
	.  reduce 39

	TYPE_DEC_PART  goto 190

state 155
	PROCEDURE_HEAD :  procedure_tok undef_id_tok $$101 PARAM_; 

	;  shift 191
	.  error


state 156
	PARAM :  (_$$106 FORM_PAR_SEC_L ) 
	$$106 : _    (106)

	.  reduce 106

	$$106  goto 192

state 157
	PROCEDURE_HEAD :  procedure_tok proc_id_tok $$103 PARAM_; 

	;  shift 193
	.  error


state 158
	FUNCTION_HEAD :  function_tok undef_id_tok $$117 PARAM_: $$118 RESULT_TYPE $$119 ; 

	:  shift 194
	.  error


state 159
	VAR_DEC :  $$85 VAR_ID_DEC_LIST : $$86 TYPE_; 

	;  shift 195
	.  error


state 160
	TYPE :  SIMPLE_TYPE_    (47)

	.  reduce 47


state 161
	TYPE :  STRUCTURED_TYPE_    (48)

	.  reduce 48


state 162
	SIMPLE_TYPE :  SUBRANGE_TYPE_    (49)

	.  reduce 49


state 163
	SIMPLE_TYPE :  TYPE_ID_    (50)

	.  reduce 50


state 164
	STRUCTURED_TYPE :  ARRAY_TYPE_    (57)

	.  reduce 57


state 165
	STRUCTURED_TYPE :  RECORD_TYPE_    (58)

	.  reduce 58


state 166
	STRUCTURED_TYPE :  FILE_TYPE_    (59)

	.  reduce 59


state 167
	STRUCTURED_TYPE :  POINTER_TYPE_    (60)

	.  reduce 60


state 168
	TYPE_ID :  type_id_tok_    (56)

	.  reduce 56


state 169
	ARRAY_TYPE :  array_tok_[ INDEX_TYPE ] of_tok COMPONENT_TYPE 
	ARRAY_TYPE :  array_tok_[ INDEX_TYPE , INDEX_TYPE ] of_tok COMPONENT_TYPE 

	[  shift 196
	.  error


state 170
	RECORD_TYPE :  record_tok_$$67 FIELD_LIST end_tok 
	$$67 : _    (67)

	.  reduce 67

	$$67  goto 197

state 171
	FILE_TYPE :  file_tok_of_tok $$79 TYPE 

	of_tok  shift 198
	.  error


state 172
	POINTER_TYPE :  ^_type_id_tok 

	type_id_tok  shift 199
	.  error


state 173
	TYPE_DEF :  $$43 undef_id_tok $$44 = $$45 TYPE_; 

	;  shift 200
	.  error


state 174
	BODY :  begin_tok $$94 STAT_LIST end_tok_. 

	.  shift 201
	.  error


state 175
	STAT_LIST :  STAT_LIST ;_STATEMENT 
	EMPTY_STAT : _    (209)

	begin_tok  shift 139
	case_tok  shift 149
	for_tok  shift 152
	goto_tok  shift 138
	if_tok  shift 153
	repeat_tok  shift 151
	while_tok  shift 150
	i_num_tok  shift 124
	undef_id_tok  shift 136
	var_id_tok  shift 145
	proc_id_tok  shift 135
	proc_param_tok  shift 137
	fun_id_tok  shift 146
	fun_param_tok  shift 147
	break_tok  shift 129
	.  reduce 209

	COMPOUND_STAT  goto 130
	STATEMENT  goto 202
	UNLAB_STAT  goto 120
	S_LABEL  goto 121
	SIMPLE_STAT  goto 122
	STRUCT_STAT  goto 123
	ASSIGN_STAT  goto 125
	PROC_STAT  goto 126
	GO_TO_STAT  goto 127
	EMPTY_STAT  goto 128
	VARIABLE  goto 133
	FUNC_ID_AS  goto 134
	CONDIT_STAT  goto 131
	REPETIT_STAT  goto 132
	IF_STATEMENT  goto 140
	CASE_STATEMENT  goto 141
	BEGIN_IF_STAT  goto 148
	WHILE_STATEMENT  goto 142
	REP_STATEMENT  goto 143
	FOR_STATEMENT  goto 144

state 176
	STATEMENT :  S_LABEL :_UNLAB_STAT 
	EMPTY_STAT : _    (209)

	begin_tok  shift 139
	case_tok  shift 149
	for_tok  shift 152
	goto_tok  shift 138
	if_tok  shift 153
	repeat_tok  shift 151
	while_tok  shift 150
	undef_id_tok  shift 136
	var_id_tok  shift 145
	proc_id_tok  shift 135
	proc_param_tok  shift 137
	fun_id_tok  shift 146
	fun_param_tok  shift 147
	break_tok  shift 129
	.  reduce 209

	COMPOUND_STAT  goto 130
	UNLAB_STAT  goto 203
	SIMPLE_STAT  goto 122
	STRUCT_STAT  goto 123
	ASSIGN_STAT  goto 125
	PROC_STAT  goto 126
	GO_TO_STAT  goto 127
	EMPTY_STAT  goto 128
	VARIABLE  goto 133
	FUNC_ID_AS  goto 134
	CONDIT_STAT  goto 131
	REPETIT_STAT  goto 132
	IF_STATEMENT  goto 140
	CASE_STATEMENT  goto 141
	BEGIN_IF_STAT  goto 148
	WHILE_STATEMENT  goto 142
	REP_STATEMENT  goto 143
	FOR_STATEMENT  goto 144

state 177
	ASSIGN_STAT :  VARIABLE assign_tok_$$137 EXPRESS 
	$$137 : _    (137)

	.  reduce 137

	$$137  goto 204

state 178
	ASSIGN_STAT :  FUNC_ID_AS assign_tok_$$139 EXPRESS 
	$$139 : _    (139)

	.  reduce 139

	$$139  goto 205

state 179
	PROC_STAT :  proc_param_tok $$206_PARAM_LIST 

	(  shift 207
	.  error

	PARAM_LIST  goto 206

state 180
	GO_TO_STAT :  goto_tok i_num_tok_    (208)

	.  reduce 208


state 181
	COMPOUND_STAT :  begin_tok $$123_STAT_LIST end_tok 
	EMPTY_STAT : _    (209)

	begin_tok  shift 139
	case_tok  shift 149
	for_tok  shift 152
	goto_tok  shift 138
	if_tok  shift 153
	repeat_tok  shift 151
	while_tok  shift 150
	i_num_tok  shift 124
	undef_id_tok  shift 136
	var_id_tok  shift 145
	proc_id_tok  shift 135
	proc_param_tok  shift 137
	fun_id_tok  shift 146
	fun_param_tok  shift 147
	break_tok  shift 129
	.  reduce 209

	STAT_LIST  goto 208
	COMPOUND_STAT  goto 130
	STATEMENT  goto 119
	UNLAB_STAT  goto 120
	S_LABEL  goto 121
	SIMPLE_STAT  goto 122
	STRUCT_STAT  goto 123
	ASSIGN_STAT  goto 125
	PROC_STAT  goto 126
	GO_TO_STAT  goto 127
	EMPTY_STAT  goto 128
	VARIABLE  goto 133
	FUNC_ID_AS  goto 134
	CONDIT_STAT  goto 131
	REPETIT_STAT  goto 132
	IF_STATEMENT  goto 140
	CASE_STATEMENT  goto 141
	BEGIN_IF_STAT  goto 148
	WHILE_STATEMENT  goto 142
	REP_STATEMENT  goto 143
	FOR_STATEMENT  goto 144

state 182
	VARIABLE :  var_id_tok $$141_VAR_DESIG_LIST 

	[  shift 211
	.  shift 212
	.  error

	VAR_DESIG_LIST  goto 209
	VAR_DESIG  goto 210

state 183
	IF_STATEMENT :  BEGIN_IF_STAT ELSE_STAT_    (216)

	.  reduce 216


state 184
	ELSE_STAT :  else_tok_$$220 STATEMENT 
	$$220 : _    (220)

	.  reduce 220

	$$220  goto 213

state 185
	CASE_STATEMENT :  case_tok $$222_EXPRESS of_tok $$223 CASE_EL_LIST END_CASE 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 214
	UNARY_OP  goto 215
	FACTOR  goto 216

state 186
	WHILE_STATEMENT :  while_tok $$237_EXPRESS $$238 do_tok STATEMENT 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 225
	UNARY_OP  goto 215
	FACTOR  goto 216

state 187
	REP_STATEMENT :  repeat_tok $$240_STAT_LIST until_tok $$241 EXPRESS 
	EMPTY_STAT : _    (209)

	begin_tok  shift 139
	case_tok  shift 149
	for_tok  shift 152
	goto_tok  shift 138
	if_tok  shift 153
	repeat_tok  shift 151
	while_tok  shift 150
	i_num_tok  shift 124
	undef_id_tok  shift 136
	var_id_tok  shift 145
	proc_id_tok  shift 135
	proc_param_tok  shift 137
	fun_id_tok  shift 146
	fun_param_tok  shift 147
	break_tok  shift 129
	.  reduce 209

	STAT_LIST  goto 226
	COMPOUND_STAT  goto 130
	STATEMENT  goto 119
	UNLAB_STAT  goto 120
	S_LABEL  goto 121
	SIMPLE_STAT  goto 122
	STRUCT_STAT  goto 123
	ASSIGN_STAT  goto 125
	PROC_STAT  goto 126
	GO_TO_STAT  goto 127
	EMPTY_STAT  goto 128
	VARIABLE  goto 133
	FUNC_ID_AS  goto 134
	CONDIT_STAT  goto 131
	REPETIT_STAT  goto 132
	IF_STATEMENT  goto 140
	CASE_STATEMENT  goto 141
	BEGIN_IF_STAT  goto 148
	WHILE_STATEMENT  goto 142
	REP_STATEMENT  goto 143
	FOR_STATEMENT  goto 144

state 188
	FOR_STATEMENT :  for_tok $$243_CONTROL_VAR assign_tok $$244 FOR_LIST do_tok $$245 STATEMENT 

	var_id_tok  shift 228
	.  error

	CONTROL_VAR  goto 227

state 189
	BEGIN_IF_STAT :  if_tok $$217_EXPRESS $$218 then_tok STATEMENT 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 229
	UNARY_OP  goto 215
	FACTOR  goto 216

state 190
	BLOCK :  $$15 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART_$$16 VAR_DEC_PART $$17 STAT_PART 
	$$16 : _    (16)

	.  reduce 16

	$$16  goto 230

state 191
	PROCEDURE_HEAD :  procedure_tok undef_id_tok $$101 PARAM ;_    (102)

	.  reduce 102


state 192
	PARAM :  ( $$106_FORM_PAR_SEC_L ) 
	$$112 : _    (112)

	var_tok  shift 234
	.  reduce 112

	FORM_PAR_SEC_L  goto 231
	FORM_PAR_SEC  goto 232
	$$112  goto 233

state 193
	PROCEDURE_HEAD :  procedure_tok proc_id_tok $$103 PARAM ;_    (104)

	.  reduce 104


state 194
	FUNCTION_HEAD :  function_tok undef_id_tok $$117 PARAM :_$$118 RESULT_TYPE $$119 ; 
	$$118 : _    (118)

	.  reduce 118

	$$118  goto 235

state 195
	VAR_DEC :  $$85 VAR_ID_DEC_LIST : $$86 TYPE ;_    (87)

	.  reduce 87


state 196
	ARRAY_TYPE :  array_tok [_INDEX_TYPE ] of_tok COMPONENT_TYPE 
	ARRAY_TYPE :  array_tok [_INDEX_TYPE , INDEX_TYPE ] of_tok COMPONENT_TYPE 
	POSSIBLE_PLUS : _    (52)

	const_id_tok  shift 46
	type_id_tok  shift 238
	unary_plus_tok  shift 47
	.  reduce 52

	SUBRANGE_TYPE  goto 237
	SUB_CONSTANT  goto 44
	POSSIBLE_PLUS  goto 45
	INDEX_TYPE  goto 236

state 197
	RECORD_TYPE :  record_tok $$67_FIELD_LIST end_tok 
	RECORD_SECTION : _    (74)
	$$71 : _    (71)

	undef_id_tok  reduce 71
	field_id_tok  reduce 71
	.  reduce 74

	FIELD_LIST  goto 239
	RECORD_SECTION  goto 240
	$$71  goto 241

state 198
	FILE_TYPE :  file_tok of_tok_$$79 TYPE 
	$$79 : _    (79)

	.  reduce 79

	$$79  goto 242

state 199
	POINTER_TYPE :  ^ type_id_tok_    (61)

	.  reduce 61


state 200
	TYPE_DEF :  $$43 undef_id_tok $$44 = $$45 TYPE ;_    (46)

	.  reduce 46


state 201
	BODY :  begin_tok $$94 STAT_LIST end_tok ._    (95)

	.  reduce 95


state 202
	STAT_LIST :  STAT_LIST ; STATEMENT_    (126)

	.  reduce 126


state 203
	STATEMENT :  S_LABEL : UNLAB_STAT_    (128)

	.  reduce 128


state 204
	ASSIGN_STAT :  VARIABLE assign_tok $$137_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 243
	UNARY_OP  goto 215
	FACTOR  goto 216

state 205
	ASSIGN_STAT :  FUNC_ID_AS assign_tok $$139_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 244
	UNARY_OP  goto 215
	FACTOR  goto 216

state 206
	PROC_STAT :  proc_param_tok $$206 PARAM_LIST_    (207)

	.  reduce 207


state 207
	PARAM_LIST :  (_$$196 ACTUAL_PARAM_L ) 
	$$196 : _    (196)

	.  reduce 196

	$$196  goto 245

state 208
	COMPOUND_STAT :  begin_tok $$123 STAT_LIST_end_tok 
	STAT_LIST :  STAT_LIST_; STATEMENT 

	end_tok  shift 246
	;  shift 175
	.  error


state 209
	VARIABLE :  var_id_tok $$141 VAR_DESIG_LIST_    (142)
	VAR_DESIG_LIST :  VAR_DESIG_LIST_VAR_DESIG 

	[  shift 211
	.  shift 212
	.  reduce 142

	VAR_DESIG  goto 247

state 210
	VAR_DESIG_LIST :  VAR_DESIG_    (146)

	.  reduce 146


state 211
	VAR_DESIG :  [_$$148 EXPRESS VAR_DESIG1 
	$$148 : _    (148)

	.  reduce 148

	$$148  goto 248

state 212
	VAR_DESIG :  ._field_id_tok 
	VAR_DESIG :  ._hhb0_tok 
	VAR_DESIG :  ._hhb1_tok 

	hhb0_tok  shift 250
	hhb1_tok  shift 251
	field_id_tok  shift 249
	.  error


state 213
	ELSE_STAT :  else_tok $$220_STATEMENT 
	EMPTY_STAT : _    (209)

	begin_tok  shift 139
	case_tok  shift 149
	for_tok  shift 152
	goto_tok  shift 138
	if_tok  shift 153
	repeat_tok  shift 151
	while_tok  shift 150
	i_num_tok  shift 124
	undef_id_tok  shift 136
	var_id_tok  shift 145
	proc_id_tok  shift 135
	proc_param_tok  shift 137
	fun_id_tok  shift 146
	fun_param_tok  shift 147
	break_tok  shift 129
	.  reduce 209

	COMPOUND_STAT  goto 130
	STATEMENT  goto 252
	UNLAB_STAT  goto 120
	S_LABEL  goto 121
	SIMPLE_STAT  goto 122
	STRUCT_STAT  goto 123
	ASSIGN_STAT  goto 125
	PROC_STAT  goto 126
	GO_TO_STAT  goto 127
	EMPTY_STAT  goto 128
	VARIABLE  goto 133
	FUNC_ID_AS  goto 134
	CONDIT_STAT  goto 131
	REPETIT_STAT  goto 132
	IF_STATEMENT  goto 140
	CASE_STATEMENT  goto 141
	BEGIN_IF_STAT  goto 148
	WHILE_STATEMENT  goto 142
	REP_STATEMENT  goto 143
	FOR_STATEMENT  goto 144

state 214
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 
	CASE_STATEMENT :  case_tok $$222 EXPRESS_of_tok $$223 CASE_EL_LIST END_CASE 

	of_tok  shift 267
	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  error


state 215
	EXPRESS :  UNARY_OP_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 268
	UNARY_OP  goto 215
	FACTOR  goto 216

state 216
	EXPRESS :  FACTOR_    (185)

	.  reduce 185


state 217
	UNARY_OP :  unary_plus_tok_    (186)

	.  reduce 186


state 218
	UNARY_OP :  unary_minus_tok_    (187)

	.  reduce 187


state 219
	UNARY_OP :  not_tok_    (188)

	.  reduce 188


state 220
	FACTOR :  (_$$189 EXPRESS ) 
	$$189 : _    (189)

	.  reduce 189

	$$189  goto 269

state 221
	FACTOR :  VARIABLE_    (191)

	.  reduce 191


state 222
	FACTOR :  CONSTANT_    (192)

	.  reduce 192


state 223
	FACTOR :  fun_id_tok_    (193)

	.  reduce 193


state 224
	FACTOR :  fun_param_tok_$$194 PARAM_LIST 
	$$194 : _    (194)

	.  reduce 194

	$$194  goto 270

state 225
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 
	WHILE_STATEMENT :  while_tok $$237 EXPRESS_$$238 do_tok STATEMENT 
	$$238 : _    (238)

	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 238

	$$238  goto 271

state 226
	STAT_LIST :  STAT_LIST_; STATEMENT 
	REP_STATEMENT :  repeat_tok $$240 STAT_LIST_until_tok $$241 EXPRESS 

	until_tok  shift 272
	;  shift 175
	.  error


state 227
	FOR_STATEMENT :  for_tok $$243 CONTROL_VAR_assign_tok $$244 FOR_LIST do_tok $$245 STATEMENT 

	assign_tok  shift 273
	.  error


state 228
	CONTROL_VAR :  var_id_tok_    (247)

	.  reduce 247


state 229
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 
	BEGIN_IF_STAT :  if_tok $$217 EXPRESS_$$218 then_tok STATEMENT 
	$$218 : _    (218)

	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 218

	$$218  goto 274

state 230
	BLOCK :  $$15 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART $$16_VAR_DEC_PART $$17 STAT_PART 
	VAR_DEC_PART : _    (81)

	var_tok  shift 49
	.  reduce 81

	VAR_DEC_PART  goto 275

state 231
	PARAM :  ( $$106 FORM_PAR_SEC_L_) 
	FORM_PAR_SEC_L :  FORM_PAR_SEC_L_; FORM_PAR_SEC 

	;  shift 277
	)  shift 276
	.  error


state 232
	FORM_PAR_SEC_L :  FORM_PAR_SEC_    (108)

	.  reduce 108


state 233
	FORM_PAR_SEC :  $$112_FORM_PAR_SEC1 
	$$110 : _    (110)

	.  reduce 110

	FORM_PAR_SEC1  goto 278
	$$110  goto 279

state 234
	FORM_PAR_SEC :  var_tok_$$114 FORM_PAR_SEC1 
	$$114 : _    (114)

	.  reduce 114

	$$114  goto 280

state 235
	FUNCTION_HEAD :  function_tok undef_id_tok $$117 PARAM : $$118_RESULT_TYPE $$119 ; 
	POSSIBLE_PLUS : _    (52)

	array_tok  shift 169
	file_tok  shift 171
	record_tok  shift 170
	const_id_tok  shift 46
	type_id_tok  shift 168
	unary_plus_tok  shift 47
	^  shift 172
	.  reduce 52

	SUBRANGE_TYPE  goto 162
	TYPE  goto 282
	SIMPLE_TYPE  goto 160
	STRUCTURED_TYPE  goto 161
	TYPE_ID  goto 163
	SUB_CONSTANT  goto 44
	POSSIBLE_PLUS  goto 45
	ARRAY_TYPE  goto 164
	RECORD_TYPE  goto 165
	FILE_TYPE  goto 166
	POINTER_TYPE  goto 167
	RESULT_TYPE  goto 281

state 236
	ARRAY_TYPE :  array_tok [ INDEX_TYPE_] of_tok COMPONENT_TYPE 
	ARRAY_TYPE :  array_tok [ INDEX_TYPE_, INDEX_TYPE ] of_tok COMPONENT_TYPE 

	,  shift 284
	]  shift 283
	.  error


state 237
	INDEX_TYPE :  SUBRANGE_TYPE_    (64)

	.  reduce 64


state 238
	INDEX_TYPE :  type_id_tok_    (65)

	.  reduce 65


state 239
	RECORD_TYPE :  record_tok $$67 FIELD_LIST_end_tok 
	FIELD_LIST :  FIELD_LIST_; RECORD_SECTION 

	end_tok  shift 285
	;  shift 286
	.  error


state 240
	FIELD_LIST :  RECORD_SECTION_    (69)

	.  reduce 69


state 241
	RECORD_SECTION :  $$71_FIELD_ID_LIST : $$72 TYPE 

	undef_id_tok  shift 289
	field_id_tok  shift 290
	.  error

	FIELD_ID_LIST  goto 287
	FIELD_ID  goto 288

state 242
	FILE_TYPE :  file_tok of_tok $$79_TYPE 
	POSSIBLE_PLUS : _    (52)

	array_tok  shift 169
	file_tok  shift 171
	record_tok  shift 170
	const_id_tok  shift 46
	type_id_tok  shift 168
	unary_plus_tok  shift 47
	^  shift 172
	.  reduce 52

	SUBRANGE_TYPE  goto 162
	TYPE  goto 291
	SIMPLE_TYPE  goto 160
	STRUCTURED_TYPE  goto 161
	TYPE_ID  goto 163
	SUB_CONSTANT  goto 44
	POSSIBLE_PLUS  goto 45
	ARRAY_TYPE  goto 164
	RECORD_TYPE  goto 165
	FILE_TYPE  goto 166
	POINTER_TYPE  goto 167

state 243
	ASSIGN_STAT :  VARIABLE assign_tok $$137 EXPRESS_    (138)
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 138


state 244
	ASSIGN_STAT :  FUNC_ID_AS assign_tok $$139 EXPRESS_    (140)
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 140


state 245
	PARAM_LIST :  ( $$196_ACTUAL_PARAM_L ) 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 294
	UNARY_OP  goto 215
	FACTOR  goto 216
	ACTUAL_PARAM_L  goto 292
	ACTUAL_PARAM  goto 293

state 246
	COMPOUND_STAT :  begin_tok $$123 STAT_LIST end_tok_    (124)

	.  reduce 124


state 247
	VAR_DESIG_LIST :  VAR_DESIG_LIST VAR_DESIG_    (147)

	.  reduce 147


state 248
	VAR_DESIG :  [ $$148_EXPRESS VAR_DESIG1 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 295
	UNARY_OP  goto 215
	FACTOR  goto 216

state 249
	VAR_DESIG :  . field_id_tok_    (150)

	.  reduce 150


state 250
	VAR_DESIG :  . hhb0_tok_    (151)

	.  reduce 151


state 251
	VAR_DESIG :  . hhb1_tok_    (152)

	.  reduce 152


state 252
	ELSE_STAT :  else_tok $$220 STATEMENT_    (221)

	.  reduce 221


state 253
	EXPRESS :  EXPRESS +_$$157 EXPRESS 
	$$157 : _    (157)

	.  reduce 157

	$$157  goto 296

state 254
	EXPRESS :  EXPRESS -_$$159 EXPRESS 
	$$159 : _    (159)

	.  reduce 159

	$$159  goto 297

state 255
	EXPRESS :  EXPRESS *_$$161 EXPRESS 
	$$161 : _    (161)

	.  reduce 161

	$$161  goto 298

state 256
	EXPRESS :  EXPRESS div_tok_$$163 EXPRESS 
	$$163 : _    (163)

	.  reduce 163

	$$163  goto 299

state 257
	EXPRESS :  EXPRESS =_$$165 EXPRESS 
	$$165 : _    (165)

	.  reduce 165

	$$165  goto 300

state 258
	EXPRESS :  EXPRESS not_eq_tok_$$167 EXPRESS 
	$$167 : _    (167)

	.  reduce 167

	$$167  goto 301

state 259
	EXPRESS :  EXPRESS mod_tok_$$169 EXPRESS 
	$$169 : _    (169)

	.  reduce 169

	$$169  goto 302

state 260
	EXPRESS :  EXPRESS <_$$171 EXPRESS 
	$$171 : _    (171)

	.  reduce 171

	$$171  goto 303

state 261
	EXPRESS :  EXPRESS >_$$173 EXPRESS 
	$$173 : _    (173)

	.  reduce 173

	$$173  goto 304

state 262
	EXPRESS :  EXPRESS less_eq_tok_$$175 EXPRESS 
	$$175 : _    (175)

	.  reduce 175

	$$175  goto 305

state 263
	EXPRESS :  EXPRESS great_eq_tok_$$177 EXPRESS 
	$$177 : _    (177)

	.  reduce 177

	$$177  goto 306

state 264
	EXPRESS :  EXPRESS and_tok_$$179 EXPRESS 
	$$179 : _    (179)

	.  reduce 179

	$$179  goto 307

state 265
	EXPRESS :  EXPRESS or_tok_$$181 EXPRESS 
	$$181 : _    (181)

	.  reduce 181

	$$181  goto 308

state 266
	EXPRESS :  EXPRESS /_$$183 EXPRESS 
	$$183 : _    (183)

	.  reduce 183

	$$183  goto 309

state 267
	CASE_STATEMENT :  case_tok $$222 EXPRESS of_tok_$$223 CASE_EL_LIST END_CASE 
	$$223 : _    (223)

	.  reduce 223

	$$223  goto 310

state 268
	EXPRESS :  UNARY_OP EXPRESS_    (156)
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	.  reduce 156


state 269
	FACTOR :  ( $$189_EXPRESS ) 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 311
	UNARY_OP  goto 215
	FACTOR  goto 216

state 270
	FACTOR :  fun_param_tok $$194_PARAM_LIST 

	(  shift 207
	.  error

	PARAM_LIST  goto 312

state 271
	WHILE_STATEMENT :  while_tok $$237 EXPRESS $$238_do_tok STATEMENT 

	do_tok  shift 313
	.  error


state 272
	REP_STATEMENT :  repeat_tok $$240 STAT_LIST until_tok_$$241 EXPRESS 
	$$241 : _    (241)

	.  reduce 241

	$$241  goto 314

state 273
	FOR_STATEMENT :  for_tok $$243 CONTROL_VAR assign_tok_$$244 FOR_LIST do_tok $$245 STATEMENT 
	$$244 : _    (244)

	.  reduce 244

	$$244  goto 315

state 274
	BEGIN_IF_STAT :  if_tok $$217 EXPRESS $$218_then_tok STATEMENT 

	then_tok  shift 316
	.  error


state 275
	BLOCK :  $$15 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART $$16 VAR_DEC_PART_$$17 STAT_PART 
	$$17 : _    (17)

	.  reduce 17

	$$17  goto 317

state 276
	PARAM :  ( $$106 FORM_PAR_SEC_L )_    (107)

	.  reduce 107


state 277
	FORM_PAR_SEC_L :  FORM_PAR_SEC_L ;_FORM_PAR_SEC 
	$$112 : _    (112)

	var_tok  shift 234
	.  reduce 112

	FORM_PAR_SEC  goto 318
	$$112  goto 233

state 278
	FORM_PAR_SEC :  $$112 FORM_PAR_SEC1_    (113)

	.  reduce 113


state 279
	FORM_PAR_SEC1 :  $$110_VAR_ID_DEC_LIST : type_id_tok 

	undef_id_tok  shift 82
	var_id_tok  shift 83
	field_id_tok  shift 84
	.  error

	VAR_ID_DEC_LIST  goto 319
	VAR_ID  goto 81

state 280
	FORM_PAR_SEC :  var_tok $$114_FORM_PAR_SEC1 
	$$110 : _    (110)

	.  reduce 110

	FORM_PAR_SEC1  goto 320
	$$110  goto 279

state 281
	FUNCTION_HEAD :  function_tok undef_id_tok $$117 PARAM : $$118 RESULT_TYPE_$$119 ; 
	$$119 : _    (119)

	.  reduce 119

	$$119  goto 321

state 282
	RESULT_TYPE :  TYPE_    (121)

	.  reduce 121


state 283
	ARRAY_TYPE :  array_tok [ INDEX_TYPE ]_of_tok COMPONENT_TYPE 

	of_tok  shift 322
	.  error


state 284
	ARRAY_TYPE :  array_tok [ INDEX_TYPE ,_INDEX_TYPE ] of_tok COMPONENT_TYPE 
	POSSIBLE_PLUS : _    (52)

	const_id_tok  shift 46
	type_id_tok  shift 238
	unary_plus_tok  shift 47
	.  reduce 52

	SUBRANGE_TYPE  goto 237
	SUB_CONSTANT  goto 44
	POSSIBLE_PLUS  goto 45
	INDEX_TYPE  goto 323

state 285
	RECORD_TYPE :  record_tok $$67 FIELD_LIST end_tok_    (68)

	.  reduce 68


state 286
	FIELD_LIST :  FIELD_LIST ;_RECORD_SECTION 
	RECORD_SECTION : _    (74)
	$$71 : _    (71)

	undef_id_tok  reduce 71
	field_id_tok  reduce 71
	.  reduce 74

	RECORD_SECTION  goto 324
	$$71  goto 241

state 287
	RECORD_SECTION :  $$71 FIELD_ID_LIST_: $$72 TYPE 
	FIELD_ID_LIST :  FIELD_ID_LIST_, FIELD_ID 

	,  shift 326
	:  shift 325
	.  error


state 288
	FIELD_ID_LIST :  FIELD_ID_    (75)

	.  reduce 75


state 289
	FIELD_ID :  undef_id_tok_    (77)

	.  reduce 77


state 290
	FIELD_ID :  field_id_tok_    (78)

	.  reduce 78


state 291
	FILE_TYPE :  file_tok of_tok $$79 TYPE_    (80)

	.  reduce 80


state 292
	PARAM_LIST :  ( $$196 ACTUAL_PARAM_L_) 
	ACTUAL_PARAM_L :  ACTUAL_PARAM_L_, $$199 ACTUAL_PARAM 

	)  shift 327
	,  shift 328
	.  error


state 293
	ACTUAL_PARAM_L :  ACTUAL_PARAM_    (198)

	.  reduce 198


state 294
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 
	ACTUAL_PARAM :  EXPRESS_WIDTH_FIELD 
	WIDTH_FIELD : _    (203)

	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	:  shift 330
	.  reduce 203

	WIDTH_FIELD  goto 329

state 295
	VAR_DESIG :  [ $$148 EXPRESS_VAR_DESIG1 
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	,  shift 333
	]  shift 332
	.  error

	VAR_DESIG1  goto 331

state 296
	EXPRESS :  EXPRESS + $$157_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 334
	UNARY_OP  goto 215
	FACTOR  goto 216

state 297
	EXPRESS :  EXPRESS - $$159_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 335
	UNARY_OP  goto 215
	FACTOR  goto 216

state 298
	EXPRESS :  EXPRESS * $$161_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 336
	UNARY_OP  goto 215
	FACTOR  goto 216

state 299
	EXPRESS :  EXPRESS div_tok $$163_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 337
	UNARY_OP  goto 215
	FACTOR  goto 216

state 300
	EXPRESS :  EXPRESS = $$165_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 338
	UNARY_OP  goto 215
	FACTOR  goto 216

state 301
	EXPRESS :  EXPRESS not_eq_tok $$167_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 339
	UNARY_OP  goto 215
	FACTOR  goto 216

state 302
	EXPRESS :  EXPRESS mod_tok $$169_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 340
	UNARY_OP  goto 215
	FACTOR  goto 216

state 303
	EXPRESS :  EXPRESS < $$171_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 341
	UNARY_OP  goto 215
	FACTOR  goto 216

state 304
	EXPRESS :  EXPRESS > $$173_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 342
	UNARY_OP  goto 215
	FACTOR  goto 216

state 305
	EXPRESS :  EXPRESS less_eq_tok $$175_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 343
	UNARY_OP  goto 215
	FACTOR  goto 216

state 306
	EXPRESS :  EXPRESS great_eq_tok $$177_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 344
	UNARY_OP  goto 215
	FACTOR  goto 216

state 307
	EXPRESS :  EXPRESS and_tok $$179_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 345
	UNARY_OP  goto 215
	FACTOR  goto 216

state 308
	EXPRESS :  EXPRESS or_tok $$181_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 346
	UNARY_OP  goto 215
	FACTOR  goto 216

state 309
	EXPRESS :  EXPRESS / $$183_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 347
	UNARY_OP  goto 215
	FACTOR  goto 216

state 310
	CASE_STATEMENT :  case_tok $$222 EXPRESS of_tok $$223_CASE_EL_LIST END_CASE 

	others_tok  shift 353
	i_num_tok  shift 352
	.  error

	CASE_EL_LIST  goto 348
	CASE_ELEMENT  goto 349
	CASE_LAB_LIST  goto 350
	CASE_LAB  goto 351

state 311
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 
	FACTOR :  ( $$189 EXPRESS_) 

	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	)  shift 354
	.  error


state 312
	FACTOR :  fun_param_tok $$194 PARAM_LIST_    (195)

	.  reduce 195


state 313
	WHILE_STATEMENT :  while_tok $$237 EXPRESS $$238 do_tok_STATEMENT 
	EMPTY_STAT : _    (209)

	begin_tok  shift 139
	case_tok  shift 149
	for_tok  shift 152
	goto_tok  shift 138
	if_tok  shift 153
	repeat_tok  shift 151
	while_tok  shift 150
	i_num_tok  shift 124
	undef_id_tok  shift 136
	var_id_tok  shift 145
	proc_id_tok  shift 135
	proc_param_tok  shift 137
	fun_id_tok  shift 146
	fun_param_tok  shift 147
	break_tok  shift 129
	.  reduce 209

	COMPOUND_STAT  goto 130
	STATEMENT  goto 355
	UNLAB_STAT  goto 120
	S_LABEL  goto 121
	SIMPLE_STAT  goto 122
	STRUCT_STAT  goto 123
	ASSIGN_STAT  goto 125
	PROC_STAT  goto 126
	GO_TO_STAT  goto 127
	EMPTY_STAT  goto 128
	VARIABLE  goto 133
	FUNC_ID_AS  goto 134
	CONDIT_STAT  goto 131
	REPETIT_STAT  goto 132
	IF_STATEMENT  goto 140
	CASE_STATEMENT  goto 141
	BEGIN_IF_STAT  goto 148
	WHILE_STATEMENT  goto 142
	REP_STATEMENT  goto 143
	FOR_STATEMENT  goto 144

state 314
	REP_STATEMENT :  repeat_tok $$240 STAT_LIST until_tok $$241_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 356
	UNARY_OP  goto 215
	FACTOR  goto 216

state 315
	FOR_STATEMENT :  for_tok $$243 CONTROL_VAR assign_tok $$244_FOR_LIST do_tok $$245 STATEMENT 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 358
	UNARY_OP  goto 215
	FACTOR  goto 216
	FOR_LIST  goto 357

state 316
	BEGIN_IF_STAT :  if_tok $$217 EXPRESS $$218 then_tok_STATEMENT 
	EMPTY_STAT : _    (209)

	begin_tok  shift 139
	case_tok  shift 149
	for_tok  shift 152
	goto_tok  shift 138
	if_tok  shift 153
	repeat_tok  shift 151
	while_tok  shift 150
	i_num_tok  shift 124
	undef_id_tok  shift 136
	var_id_tok  shift 145
	proc_id_tok  shift 135
	proc_param_tok  shift 137
	fun_id_tok  shift 146
	fun_param_tok  shift 147
	break_tok  shift 129
	.  reduce 209

	COMPOUND_STAT  goto 130
	STATEMENT  goto 359
	UNLAB_STAT  goto 120
	S_LABEL  goto 121
	SIMPLE_STAT  goto 122
	STRUCT_STAT  goto 123
	ASSIGN_STAT  goto 125
	PROC_STAT  goto 126
	GO_TO_STAT  goto 127
	EMPTY_STAT  goto 128
	VARIABLE  goto 133
	FUNC_ID_AS  goto 134
	CONDIT_STAT  goto 131
	REPETIT_STAT  goto 132
	IF_STATEMENT  goto 140
	CASE_STATEMENT  goto 141
	BEGIN_IF_STAT  goto 148
	WHILE_STATEMENT  goto 142
	REP_STATEMENT  goto 143
	FOR_STATEMENT  goto 144

state 317
	BLOCK :  $$15 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART $$16 VAR_DEC_PART $$17_STAT_PART 

	begin_tok  shift 361
	.  error

	STAT_PART  goto 360

state 318
	FORM_PAR_SEC_L :  FORM_PAR_SEC_L ; FORM_PAR_SEC_    (109)

	.  reduce 109


state 319
	VAR_ID_DEC_LIST :  VAR_ID_DEC_LIST_, VAR_ID 
	FORM_PAR_SEC1 :  $$110 VAR_ID_DEC_LIST_: type_id_tok 

	,  shift 99
	:  shift 362
	.  error


state 320
	FORM_PAR_SEC :  var_tok $$114 FORM_PAR_SEC1_    (115)

	.  reduce 115


state 321
	FUNCTION_HEAD :  function_tok undef_id_tok $$117 PARAM : $$118 RESULT_TYPE $$119_; 

	;  shift 363
	.  error


state 322
	ARRAY_TYPE :  array_tok [ INDEX_TYPE ] of_tok_COMPONENT_TYPE 
	POSSIBLE_PLUS : _    (52)

	array_tok  shift 169
	file_tok  shift 171
	record_tok  shift 170
	const_id_tok  shift 46
	type_id_tok  shift 168
	unary_plus_tok  shift 47
	^  shift 172
	.  reduce 52

	SUBRANGE_TYPE  goto 162
	TYPE  goto 365
	SIMPLE_TYPE  goto 160
	STRUCTURED_TYPE  goto 161
	TYPE_ID  goto 163
	SUB_CONSTANT  goto 44
	POSSIBLE_PLUS  goto 45
	ARRAY_TYPE  goto 164
	RECORD_TYPE  goto 165
	FILE_TYPE  goto 166
	POINTER_TYPE  goto 167
	COMPONENT_TYPE  goto 364

state 323
	ARRAY_TYPE :  array_tok [ INDEX_TYPE , INDEX_TYPE_] of_tok COMPONENT_TYPE 

	]  shift 366
	.  error


state 324
	FIELD_LIST :  FIELD_LIST ; RECORD_SECTION_    (70)

	.  reduce 70


state 325
	RECORD_SECTION :  $$71 FIELD_ID_LIST :_$$72 TYPE 
	$$72 : _    (72)

	.  reduce 72

	$$72  goto 367

state 326
	FIELD_ID_LIST :  FIELD_ID_LIST ,_FIELD_ID 

	undef_id_tok  shift 289
	field_id_tok  shift 290
	.  error

	FIELD_ID  goto 368

state 327
	PARAM_LIST :  ( $$196 ACTUAL_PARAM_L )_    (197)

	.  reduce 197


state 328
	ACTUAL_PARAM_L :  ACTUAL_PARAM_L ,_$$199 ACTUAL_PARAM 
	$$199 : _    (199)

	.  reduce 199

	$$199  goto 369

state 329
	ACTUAL_PARAM :  EXPRESS WIDTH_FIELD_    (201)

	.  reduce 201


state 330
	WIDTH_FIELD :  :_i_num_tok 

	i_num_tok  shift 370
	.  error


state 331
	VAR_DESIG :  [ $$148 EXPRESS VAR_DESIG1_    (149)

	.  reduce 149


state 332
	VAR_DESIG1 :  ]_    (153)

	.  reduce 153


state 333
	VAR_DESIG1 :  ,_$$154 EXPRESS ] 
	$$154 : _    (154)

	.  reduce 154

	$$154  goto 371

state 334
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS + $$157 EXPRESS_    (158)
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 158


state 335
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS - $$159 EXPRESS_    (160)
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 160


state 336
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS * $$161 EXPRESS_    (162)
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	.  reduce 162


state 337
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS div_tok $$163 EXPRESS_    (164)
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	.  reduce 164


state 338
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS = $$165 EXPRESS_    (166)
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	=  error
	not_eq_tok  error
	<  error
	>  error
	less_eq_tok  error
	great_eq_tok  error
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 166


state 339
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS not_eq_tok $$167 EXPRESS_    (168)
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	=  error
	not_eq_tok  error
	<  error
	>  error
	less_eq_tok  error
	great_eq_tok  error
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 168


state 340
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS mod_tok $$169 EXPRESS_    (170)
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	.  reduce 170


state 341
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS < $$171 EXPRESS_    (172)
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	=  error
	not_eq_tok  error
	<  error
	>  error
	less_eq_tok  error
	great_eq_tok  error
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 172


state 342
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS > $$173 EXPRESS_    (174)
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	=  error
	not_eq_tok  error
	<  error
	>  error
	less_eq_tok  error
	great_eq_tok  error
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 174


state 343
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS less_eq_tok $$175 EXPRESS_    (176)
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	=  error
	not_eq_tok  error
	<  error
	>  error
	less_eq_tok  error
	great_eq_tok  error
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 176


state 344
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS great_eq_tok $$177 EXPRESS_    (178)
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	=  error
	not_eq_tok  error
	<  error
	>  error
	less_eq_tok  error
	great_eq_tok  error
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 178


state 345
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS and_tok $$179 EXPRESS_    (180)
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	.  reduce 180


state 346
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS or_tok $$181 EXPRESS_    (182)
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 182


state 347
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 
	EXPRESS :  EXPRESS / $$183 EXPRESS_    (184)

	.  reduce 184


state 348
	CASE_STATEMENT :  case_tok $$222 EXPRESS of_tok $$223 CASE_EL_LIST_END_CASE 
	CASE_EL_LIST :  CASE_EL_LIST_; CASE_ELEMENT 

	end_tok  shift 374
	;  shift 373
	.  error

	END_CASE  goto 372

state 349
	CASE_EL_LIST :  CASE_ELEMENT_    (225)

	.  reduce 225


state 350
	CASE_ELEMENT :  CASE_LAB_LIST_: UNLAB_STAT 
	CASE_LAB_LIST :  CASE_LAB_LIST_, CASE_LAB 

	,  shift 376
	:  shift 375
	.  error


state 351
	CASE_LAB_LIST :  CASE_LAB_    (228)

	.  reduce 228


state 352
	CASE_LAB :  i_num_tok_    (230)

	.  reduce 230


state 353
	CASE_LAB :  others_tok_    (231)

	.  reduce 231


state 354
	FACTOR :  ( $$189 EXPRESS )_    (190)

	.  reduce 190


state 355
	WHILE_STATEMENT :  while_tok $$237 EXPRESS $$238 do_tok STATEMENT_    (239)

	.  reduce 239


state 356
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 
	REP_STATEMENT :  repeat_tok $$240 STAT_LIST until_tok $$241 EXPRESS_    (242)

	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 242


state 357
	FOR_STATEMENT :  for_tok $$243 CONTROL_VAR assign_tok $$244 FOR_LIST_do_tok $$245 STATEMENT 

	do_tok  shift 377
	.  error


state 358
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 
	FOR_LIST :  EXPRESS_$$248 to_tok $$249 EXPRESS 
	FOR_LIST :  EXPRESS_$$251 downto_tok $$252 EXPRESS 
	$$248 : _    (248)
	$$251 : _    (251)

	to_tok  reduce 248
	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 251

	$$248  goto 378
	$$251  goto 379

state 359
	BEGIN_IF_STAT :  if_tok $$217 EXPRESS $$218 then_tok STATEMENT_    (219)

	.  reduce 219


state 360
	BLOCK :  $$15 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART $$16 VAR_DEC_PART $$17 STAT_PART_    (18)

	.  reduce 18


state 361
	STAT_PART :  begin_tok_STAT_LIST end_tok 
	EMPTY_STAT : _    (209)

	begin_tok  shift 139
	case_tok  shift 149
	for_tok  shift 152
	goto_tok  shift 138
	if_tok  shift 153
	repeat_tok  shift 151
	while_tok  shift 150
	i_num_tok  shift 124
	undef_id_tok  shift 136
	var_id_tok  shift 145
	proc_id_tok  shift 135
	proc_param_tok  shift 137
	fun_id_tok  shift 146
	fun_param_tok  shift 147
	break_tok  shift 129
	.  reduce 209

	STAT_LIST  goto 380
	COMPOUND_STAT  goto 130
	STATEMENT  goto 119
	UNLAB_STAT  goto 120
	S_LABEL  goto 121
	SIMPLE_STAT  goto 122
	STRUCT_STAT  goto 123
	ASSIGN_STAT  goto 125
	PROC_STAT  goto 126
	GO_TO_STAT  goto 127
	EMPTY_STAT  goto 128
	VARIABLE  goto 133
	FUNC_ID_AS  goto 134
	CONDIT_STAT  goto 131
	REPETIT_STAT  goto 132
	IF_STATEMENT  goto 140
	CASE_STATEMENT  goto 141
	BEGIN_IF_STAT  goto 148
	WHILE_STATEMENT  goto 142
	REP_STATEMENT  goto 143
	FOR_STATEMENT  goto 144

state 362
	FORM_PAR_SEC1 :  $$110 VAR_ID_DEC_LIST :_type_id_tok 

	type_id_tok  shift 381
	.  error


state 363
	FUNCTION_HEAD :  function_tok undef_id_tok $$117 PARAM : $$118 RESULT_TYPE $$119 ;_    (120)

	.  reduce 120


state 364
	ARRAY_TYPE :  array_tok [ INDEX_TYPE ] of_tok COMPONENT_TYPE_    (62)

	.  reduce 62


state 365
	COMPONENT_TYPE :  TYPE_    (66)

	.  reduce 66


state 366
	ARRAY_TYPE :  array_tok [ INDEX_TYPE , INDEX_TYPE ]_of_tok COMPONENT_TYPE 

	of_tok  shift 382
	.  error


state 367
	RECORD_SECTION :  $$71 FIELD_ID_LIST : $$72_TYPE 
	POSSIBLE_PLUS : _    (52)

	array_tok  shift 169
	file_tok  shift 171
	record_tok  shift 170
	const_id_tok  shift 46
	type_id_tok  shift 168
	unary_plus_tok  shift 47
	^  shift 172
	.  reduce 52

	SUBRANGE_TYPE  goto 162
	TYPE  goto 383
	SIMPLE_TYPE  goto 160
	STRUCTURED_TYPE  goto 161
	TYPE_ID  goto 163
	SUB_CONSTANT  goto 44
	POSSIBLE_PLUS  goto 45
	ARRAY_TYPE  goto 164
	RECORD_TYPE  goto 165
	FILE_TYPE  goto 166
	POINTER_TYPE  goto 167

state 368
	FIELD_ID_LIST :  FIELD_ID_LIST , FIELD_ID_    (76)

	.  reduce 76


state 369
	ACTUAL_PARAM_L :  ACTUAL_PARAM_L , $$199_ACTUAL_PARAM 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 294
	UNARY_OP  goto 215
	FACTOR  goto 216
	ACTUAL_PARAM  goto 384

state 370
	WIDTH_FIELD :  : i_num_tok_    (202)

	.  reduce 202


state 371
	VAR_DESIG1 :  , $$154_EXPRESS ] 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 385
	UNARY_OP  goto 215
	FACTOR  goto 216

state 372
	CASE_STATEMENT :  case_tok $$222 EXPRESS of_tok $$223 CASE_EL_LIST END_CASE_    (224)

	.  reduce 224


state 373
	CASE_EL_LIST :  CASE_EL_LIST ;_CASE_ELEMENT 
	END_CASE :  ;_end_tok 

	end_tok  shift 387
	others_tok  shift 353
	i_num_tok  shift 352
	.  error

	CASE_ELEMENT  goto 386
	CASE_LAB_LIST  goto 350
	CASE_LAB  goto 351

state 374
	END_CASE :  end_tok_    (232)

	.  reduce 232


state 375
	CASE_ELEMENT :  CASE_LAB_LIST :_UNLAB_STAT 
	EMPTY_STAT : _    (209)

	begin_tok  shift 139
	case_tok  shift 149
	for_tok  shift 152
	goto_tok  shift 138
	if_tok  shift 153
	repeat_tok  shift 151
	while_tok  shift 150
	undef_id_tok  shift 136
	var_id_tok  shift 145
	proc_id_tok  shift 135
	proc_param_tok  shift 137
	fun_id_tok  shift 146
	fun_param_tok  shift 147
	break_tok  shift 129
	.  reduce 209

	COMPOUND_STAT  goto 130
	UNLAB_STAT  goto 388
	SIMPLE_STAT  goto 122
	STRUCT_STAT  goto 123
	ASSIGN_STAT  goto 125
	PROC_STAT  goto 126
	GO_TO_STAT  goto 127
	EMPTY_STAT  goto 128
	VARIABLE  goto 133
	FUNC_ID_AS  goto 134
	CONDIT_STAT  goto 131
	REPETIT_STAT  goto 132
	IF_STATEMENT  goto 140
	CASE_STATEMENT  goto 141
	BEGIN_IF_STAT  goto 148
	WHILE_STATEMENT  goto 142
	REP_STATEMENT  goto 143
	FOR_STATEMENT  goto 144

state 376
	CASE_LAB_LIST :  CASE_LAB_LIST ,_CASE_LAB 

	others_tok  shift 353
	i_num_tok  shift 352
	.  error

	CASE_LAB  goto 389

state 377
	FOR_STATEMENT :  for_tok $$243 CONTROL_VAR assign_tok $$244 FOR_LIST do_tok_$$245 STATEMENT 
	$$245 : _    (245)

	.  reduce 245

	$$245  goto 390

state 378
	FOR_LIST :  EXPRESS $$248_to_tok $$249 EXPRESS 

	to_tok  shift 391
	.  error


state 379
	FOR_LIST :  EXPRESS $$251_downto_tok $$252 EXPRESS 

	downto_tok  shift 392
	.  error


state 380
	STAT_PART :  begin_tok STAT_LIST_end_tok 
	STAT_LIST :  STAT_LIST_; STATEMENT 

	end_tok  shift 393
	;  shift 175
	.  error


state 381
	FORM_PAR_SEC1 :  $$110 VAR_ID_DEC_LIST : type_id_tok_    (111)

	.  reduce 111


state 382
	ARRAY_TYPE :  array_tok [ INDEX_TYPE , INDEX_TYPE ] of_tok_COMPONENT_TYPE 
	POSSIBLE_PLUS : _    (52)

	array_tok  shift 169
	file_tok  shift 171
	record_tok  shift 170
	const_id_tok  shift 46
	type_id_tok  shift 168
	unary_plus_tok  shift 47
	^  shift 172
	.  reduce 52

	SUBRANGE_TYPE  goto 162
	TYPE  goto 365
	SIMPLE_TYPE  goto 160
	STRUCTURED_TYPE  goto 161
	TYPE_ID  goto 163
	SUB_CONSTANT  goto 44
	POSSIBLE_PLUS  goto 45
	ARRAY_TYPE  goto 164
	RECORD_TYPE  goto 165
	FILE_TYPE  goto 166
	POINTER_TYPE  goto 167
	COMPONENT_TYPE  goto 394

state 383
	RECORD_SECTION :  $$71 FIELD_ID_LIST : $$72 TYPE_    (73)

	.  reduce 73


state 384
	ACTUAL_PARAM_L :  ACTUAL_PARAM_L , $$199 ACTUAL_PARAM_    (200)

	.  reduce 200


state 385
	VAR_DESIG1 :  , $$154 EXPRESS_] 
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 

	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	]  shift 395
	.  error


state 386
	CASE_EL_LIST :  CASE_EL_LIST ; CASE_ELEMENT_    (226)

	.  reduce 226


state 387
	END_CASE :  ; end_tok_    (233)

	.  reduce 233


state 388
	CASE_ELEMENT :  CASE_LAB_LIST : UNLAB_STAT_    (227)

	.  reduce 227


state 389
	CASE_LAB_LIST :  CASE_LAB_LIST , CASE_LAB_    (229)

	.  reduce 229


state 390
	FOR_STATEMENT :  for_tok $$243 CONTROL_VAR assign_tok $$244 FOR_LIST do_tok $$245_STATEMENT 
	EMPTY_STAT : _    (209)

	begin_tok  shift 139
	case_tok  shift 149
	for_tok  shift 152
	goto_tok  shift 138
	if_tok  shift 153
	repeat_tok  shift 151
	while_tok  shift 150
	i_num_tok  shift 124
	undef_id_tok  shift 136
	var_id_tok  shift 145
	proc_id_tok  shift 135
	proc_param_tok  shift 137
	fun_id_tok  shift 146
	fun_param_tok  shift 147
	break_tok  shift 129
	.  reduce 209

	COMPOUND_STAT  goto 130
	STATEMENT  goto 396
	UNLAB_STAT  goto 120
	S_LABEL  goto 121
	SIMPLE_STAT  goto 122
	STRUCT_STAT  goto 123
	ASSIGN_STAT  goto 125
	PROC_STAT  goto 126
	GO_TO_STAT  goto 127
	EMPTY_STAT  goto 128
	VARIABLE  goto 133
	FUNC_ID_AS  goto 134
	CONDIT_STAT  goto 131
	REPETIT_STAT  goto 132
	IF_STATEMENT  goto 140
	CASE_STATEMENT  goto 141
	BEGIN_IF_STAT  goto 148
	WHILE_STATEMENT  goto 142
	REP_STATEMENT  goto 143
	FOR_STATEMENT  goto 144

state 391
	FOR_LIST :  EXPRESS $$248 to_tok_$$249 EXPRESS 
	$$249 : _    (249)

	.  reduce 249

	$$249  goto 397

state 392
	FOR_LIST :  EXPRESS $$251 downto_tok_$$252 EXPRESS 
	$$252 : _    (252)

	.  reduce 252

	$$252  goto 398

state 393
	STAT_PART :  begin_tok STAT_LIST end_tok_    (122)

	.  reduce 122


state 394
	ARRAY_TYPE :  array_tok [ INDEX_TYPE , INDEX_TYPE ] of_tok COMPONENT_TYPE_    (63)

	.  reduce 63


state 395
	VAR_DESIG1 :  , $$154 EXPRESS ]_    (155)

	.  reduce 155


state 396
	FOR_STATEMENT :  for_tok $$243 CONTROL_VAR assign_tok $$244 FOR_LIST do_tok $$245 STATEMENT_    (246)

	.  reduce 246


state 397
	FOR_LIST :  EXPRESS $$248 to_tok $$249_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 399
	UNARY_OP  goto 215
	FACTOR  goto 216

state 398
	FOR_LIST :  EXPRESS $$251 downto_tok $$252_EXPRESS 

	r_num_tok  shift 103
	i_num_tok  shift 102
	string_literal_tok  shift 106
	single_char_tok  shift 107
	var_id_tok  shift 145
	fun_id_tok  shift 223
	fun_param_tok  shift 224
	const_id_tok  shift 108
	unary_plus_tok  shift 217
	unary_minus_tok  shift 218
	not_tok  shift 219
	(  shift 220
	.  error

	CONSTANT  goto 222
	STRING  goto 104
	CONSTANT_ID  goto 105
	VARIABLE  goto 221
	EXPRESS  goto 400
	UNARY_OP  goto 215
	FACTOR  goto 216

state 399
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 
	FOR_LIST :  EXPRESS $$248 to_tok $$249 EXPRESS_    (250)

	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 250


state 400
	EXPRESS :  EXPRESS_+ $$157 EXPRESS 
	EXPRESS :  EXPRESS_- $$159 EXPRESS 
	EXPRESS :  EXPRESS_* $$161 EXPRESS 
	EXPRESS :  EXPRESS_div_tok $$163 EXPRESS 
	EXPRESS :  EXPRESS_= $$165 EXPRESS 
	EXPRESS :  EXPRESS_not_eq_tok $$167 EXPRESS 
	EXPRESS :  EXPRESS_mod_tok $$169 EXPRESS 
	EXPRESS :  EXPRESS_< $$171 EXPRESS 
	EXPRESS :  EXPRESS_> $$173 EXPRESS 
	EXPRESS :  EXPRESS_less_eq_tok $$175 EXPRESS 
	EXPRESS :  EXPRESS_great_eq_tok $$177 EXPRESS 
	EXPRESS :  EXPRESS_and_tok $$179 EXPRESS 
	EXPRESS :  EXPRESS_or_tok $$181 EXPRESS 
	EXPRESS :  EXPRESS_/ $$183 EXPRESS 
	FOR_LIST :  EXPRESS $$251 downto_tok $$252 EXPRESS_    (253)

	=  shift 257
	not_eq_tok  shift 258
	<  shift 260
	>  shift 261
	less_eq_tok  shift 262
	great_eq_tok  shift 263
	+  shift 253
	-  shift 254
	or_tok  shift 265
	*  shift 255
	/  shift 266
	div_tok  shift 256
	mod_tok  shift 259
	and_tok  shift 264
	.  reduce 253


77/127 terminals, 159/300 nonterminals
254/600 grammar rules, 401/750 states
1 shift/reduce, 0 reduce/reduce conflicts reported
159/350 working sets used
memory: states,etc. 4333/12000, parser 932/12000
135/600 distinct lookahead sets
400 extra closures
970 shift entries, 49 exceptions
242 goto entries
432 entries saved by goto default
Optimizer space used: input 2267/12000, output 526/12000
526 table entries, 0 zero
maximum spread: 315, maximum offset: 398
