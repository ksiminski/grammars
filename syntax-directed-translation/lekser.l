
%option noyywrap

%{
   #include <stdlib.h> 
   #include <iostream>
   #include "parser.tab.h"
%}
 
%%

auto            return AUTO;
"->"            return ARROW;
int             return INT;
double          return DOUBLE;
[a-zA-Z_][a-zA-Z0-9_]*     { yylval.pName = strdup(yytext);  return ID; }

[();,]          return yytext[0];

[ \r\n\t]       /* remove white chars */

%%
