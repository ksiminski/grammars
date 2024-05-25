
%option noyywrap

%{
   #include <stdlib.h> 
   #include <iostream>
   #include "parser.tab.h"
%}
 
%%

x              return *yytext;


%%
