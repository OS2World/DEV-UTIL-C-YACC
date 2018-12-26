
 %term ONE
 %term TWO
 %term THREE
 %term FOUR
 %term FIVE
 %term SIX
 %term SEVEN
 %term EIGHT
 %term NINE
 %term DOT
%%
number    :front =
{       float _L1L_;
{ _L1L_ = (float) _ap [0]._t1;
                    _ap += 1; 
--_ap; _ap[0]._t0 = _L1L_;
  }
}
             |front DOT back =
{       float _L1L_;
{ _L1L_ = (float) _ap [2]._t1 + _ap [0]._t0;
                    _ap += 3; 
--_ap; _ap[0]._t0 = _L1L_;
  }
};
front    :id 
             |front id =
{       int _L1L_;
{ _L1L_ = 10 * _ap [1]._t1 + _ap [0]._t1;
                    _ap += 2; 
--_ap; _ap[0]._t1 = _L1L_;
  }
};
back    :zero_th_digit fd 
             |back inc_dig_pos fd =
{       int _L1L_;
       float _L2L_;
{ _L2L_ = _ap [2]._t0 + _ap [0]._t0;
                    _ap += 4; 
--_ap; _ap[0]._t1 = _L1L_;
--_ap; _ap[0]._t0 = _L2L_;
  }
};
fd    :id =
{       float _L1L_;
{ _L1L_ = ( (float) _ap [0]._t1) / (power (10, _ap [1]._t1));
                    _ap += 1; 
--_ap; _ap[0]._t0 = _L1L_;
  }
};
zero_th_digit    :=
{     _ap -= 1;
{ _ap [0]._t1 = 1;
                }
};
inc_dig_pos    :=
{     _ap -= 1;
{ _ap [0]._t1 = _ap [2]._t1 + 1;
                }
};
id    :ONE =
{     _ap -= 1;
{ _ap [0]._t1 = 1;
                }
}
             |TWO =
{     _ap -= 1;
{ _ap [0]._t1 = 2;
                }
}
             |THREE =
{     _ap -= 1;
{ _ap [0]._t1 = 3;
                }
}
             |FOUR =
{     _ap -= 1;
{ _ap [0]._t1 = 4;
                }
}
             |FIVE =
{     _ap -= 1;
{ _ap [0]._t1 = 5;
                }
}
             |SIX =
{     _ap -= 1;
{ _ap [0]._t1 = 6;
                }
}
             |SEVEN =
{     _ap -= 1;
{ _ap [0]._t1 = 7;
                }
}
             |EIGHT =
{     _ap -= 1;
{ _ap [0]._t1 = 8;
                }
}
             |NINE =
{     _ap -= 1;
{ _ap [0]._t1 = 9;
                }
};

%%


#ifndef ATT_SIZE
#define ATT_SIZE     150
#endif

union _attr_elem {
  float  _t0;
  int  _t1;
} _attr_stack [ATT_SIZE];
union _attr_elem *_ap =      &_attr_stack [ATT_SIZE - 1];

 /* processed by a YACC preprocessor */ 
