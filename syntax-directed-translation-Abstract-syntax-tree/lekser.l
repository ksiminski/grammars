
%option noyywrap

%{
   #include <stdlib.h> 
   #include <iostream>
   #include "parser.tab.h"
   #include "ast.h"
%}
 
%%

int      return INT;
for      return FOR;
[a-zA-Z_][a-zA-Z0-9_]*      { 
      auto p = new IdSymbol();
      p->value = std::string(yytext);
      yylval.p = p;
      return ID;
      }
[0-9]+                    { 
      auto p = new NumberSymbol();
      p->value = atoi(yytext);
      yylval.p = p;
      return NUMBER;
      }  
"++"                        return INCR;
"!="                        return NEQ;
"<="                        return LTEQ;
[();,<={}]                  return yytext[0];

[ \t\r\n]            /* remove white chars */

%%
