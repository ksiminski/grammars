/*

Example of a reduce-reduce conflict.

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

%token 'a'   
	
%%

S : %empty
  | A
  ;
  
A : %empty
  | A 'a'
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
 
