
%option noyywrap

%{
   #include <stdlib.h> 
   #include <iostream>
   #include "parser.tab.h"
%}
 
%%

[a-z]              return *yytext;


%%
