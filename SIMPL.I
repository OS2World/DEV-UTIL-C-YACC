
state 0
	$accept : _exp $end 

	ID  shift 5
	(  shift 4
	.  error

	exp  goto 1
	term  goto 2
	fact  goto 3

state 1
	$accept :  exp_$end 
	exp :  exp_+ term 

	$end  accept
	+  shift 6
	.  error


state 2
	exp :  term_    (2)
	term :  term_* fact 

	*  shift 7
	.  reduce 2


state 3
	term :  fact_    (4)

	.  reduce 4


state 4
	fact :  (_exp ) 

	ID  shift 5
	(  shift 4
	.  error

	exp  goto 8
	term  goto 2
	fact  goto 3

state 5
	fact :  ID_    (6)

	.  reduce 6


state 6
	exp :  exp +_term 

	ID  shift 5
	(  shift 4
	.  error

	term  goto 9
	fact  goto 3

state 7
	term :  term *_fact 

	ID  shift 5
	(  shift 4
	.  error

	fact  goto 10

state 8
	exp :  exp_+ term 
	fact :  ( exp_) 

	+  shift 6
	)  shift 11
	.  error


state 9
	exp :  exp + term_    (1)
	term :  term_* fact 

	*  shift 7
	.  reduce 1


state 10
	term :  term * fact_    (3)

	.  reduce 3


state 11
	fact :  ( exp )_    (5)

	.  reduce 5


8/127 terminals, 3/300 nonterminals
7/600 grammar rules, 12/750 states
0 shift/reduce, 0 reduce/reduce conflicts reported
7/350 working sets used
memory: states,etc. 100/12000, parser 8/12000
8/600 distinct lookahead sets
4 extra closures
13 shift entries, 1 exceptions
6 goto entries
3 entries saved by goto default
Optimizer space used: input 37/12000, output 218/12000
218 table entries, 206 zero
maximum spread: 257, maximum offset: 43
