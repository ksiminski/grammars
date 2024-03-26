
%option noyywrap

%{
   /* FLEX or LEX  */
   #include <stdlib.h> 
   #include <iostream>
   #include "parser.tab.h"
%}
 
%%

0		return ZERO;
1		return ONE;


%%
