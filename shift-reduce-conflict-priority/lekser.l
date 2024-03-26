
%option noyywrap

%{
   #include <stdlib.h> 
   #include <iostream>
   #include "parser.tab.h"
%}
 
%%

[0-9]+             return NUMBER;
[*]                return TIMES;
[+]                return PLUS;

%%
