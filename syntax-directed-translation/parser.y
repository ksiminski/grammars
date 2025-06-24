
%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <iostream>
   #include <string>
   #include <sstream>

	void yyerror(char *s);
	int yylex();
	extern FILE* yyin;
	

%}

%verbose 

%token INT DOUBLE AUTO ARROW 
%token<pName> ID 

%union
{
   int number;
   char * pName;
}

%type<number> params param nonemptyparams  


%%

file : function 
     | file function 

function : type ID '(' params ')' ';'  { std::cout <<  "function " << $2 << " has " << $4 << " parameters." << std::endl; } 
        | AUTO ID '(' params ')' ARROW type ';'  { std::cout <<  "function " << $2 << " has " << $4 << " parameters." << std::endl; } 
        ; 

type : INT
     | DOUBLE
     ; 

params : %empty    { $$ = 0; } 
       | nonemptyparams   { $$ = $1; } 
       ;

nonemptyparams : param        { $$ = $1; }
               | nonemptyparams ',' param  { $$ = $1 + $3; } 
               ; 

param : type ID    { $$ = 1 ; } 
      | type       { $$ = 1 ; }      
      ; 

%%

void yyerror(char *s) 
{
    fprintf(stderr, "%s\n", s);
}

int main() 
{
    std::ios_base::sync_with_stdio (true);
    yyin = fopen("input.h", "r");
    yyparse();    
    return 0;
}
 
