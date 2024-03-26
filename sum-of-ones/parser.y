/*
 
YACC or BISON

**/

%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <iostream>
	
	void yyerror(char *s);
	int yylex();
	extern FILE* yyin;
	
%}

%verbose 

%token ONE ZERO  


%%

G : ZERO B 
  | ONE G ONE
  ; 

B : ZERO
  | ONE B ONE
  ;

  
  
%%

void yyerror(char *s) 
{
    fprintf(stderr, "%s\n", s);
}

int main() 
{
    std::ios_base::sync_with_stdio (true);
    yyparse();    
    return 0;
}
 
