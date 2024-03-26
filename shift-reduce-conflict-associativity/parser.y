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

//%token PLUS
//%left PLUS        //  (E + E) + E
%right PLUS     //  E + (E + E)


%%

expression : expression PLUS expression 
           | NUMBER
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
 
