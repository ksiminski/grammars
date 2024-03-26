/*

Priorities to solve shift-reduce conflicts.

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

%token NUMBER  

//%token PLUS TIMES
%left PLUS                  // lower priority
%left TIMES                 // higher priority


%%

expression : expression PLUS  expression 
           | NUMBER
           | expression TIMES expression
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
 
