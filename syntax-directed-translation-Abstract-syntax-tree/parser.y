
%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <iostream>
   #include <vector>
   #include <memory>
   #include <string>
   #include <sstream>

	void yyerror(char *s);
	int yylex();
	extern FILE* yyin;
	
   #include "ast.h"

%}

%verbose 
%union
{
   int integer; 
   class Symbol * p;
   char * str;
}

%token FOR INCR INT LTEQ NEQ
%token<p> ID NUMBER

%type<p> for_loop assingment exp type condition incremention block operator statements statement def 


%%

loop : for_loop  { std::cout << $1->emit() << std::endl; 
                   delete $1;
                 }
      ;

for_loop : FOR '(' assingment ';' condition ';' incremention ')' block  { 
        $$ = new ForLoopSymbol();
        $$->symbols.push_back($3);
        $$->symbols.push_back($5);
        $$->symbols.push_back($7);
        $$->symbols.push_back($9);
     }  
     ;

def : type ID    { 
                     $$ = new DefSymbol(); 
                     $$->symbols.push_back($1);
                     $$->symbols.push_back($2);
                 }
     ; 
assingment : ID '=' exp  {
                            $$ = new AssignmentSymbol();
                            $$->symbols.push_back($1);
                            $$->symbols.push_back($3);
                         }
         | def '=' exp  {
                               $$ = new AssignmentSymbol();
                               $$->symbols.push_back($1);
                               $$->symbols.push_back($3);
                           }
         ;

type : INT    { $$ = new IntSymbol(); }  
     ;

condition : ID operator exp    {  $$ = new ConditionSymbol();
                      $$->symbols.push_back($1);
                      $$->symbols.push_back($2);
                      $$->symbols.push_back($3);
                    } 
    ;

operator : '<'      { auto p = new OperatorSymbol();
                       p->value = std::string{"<"};
                       $$ = p;
                    } 
      | NEQ         { auto p = new OperatorSymbol();
                       p->value = std::string{"!="};
                       $$ = p;
                    }
      | LTEQ        { auto p = new OperatorSymbol();
                       p->value = std::string{"<="};
                       $$ = p;
                    }
      ;


block : statement    { $$ = $1; } 
     | '{' statements '}'   { 
         $$ = new BlockSymbol(); 
         $$->symbols.push_back($2); 
       }
     ;

statements : %empty     { $$ = new StatementsSymbol(); }
           | statements statement  { $$ = new StatementsSymbol();
                                 $$->symbols.push_back($1);
                                 $$->symbols.push_back($2);
                               } 
           ; 

statement : ';'            { $$ = new StatementSymbol(); } 
      | exp ';'        { 
          $$ = new StatementSymbol();
          $$->symbols.push_back($1);
        } 

incremention : INCR ID    { 
         $$ = new IncrementationSymbol();
         $$->symbols.push_back($2);
       }
     | ID INCR  { 
         $$ = new IncrementationSymbol();
         $$->symbols.push_back($1);
       }
     ; 

exp : NUMBER   { auto p = new ExpressionSymbol();
                   p->symbols.push_back($1);
                   $$ = p;
                 } 
    | assingment     { auto p = new ExpressionSymbol();
                   p->symbols.push_back($1);
                   $$ = p;
                 }
    | incremention      { auto p = new ExpressionSymbol();
                   p->symbols.push_back($1);
                   $$ = p;
                 }
    ;


%%

void yyerror(char *s) 
{
    fprintf(stderr, "%s\n", s);
}

int main() 
{
    std::ios_base::sync_with_stdio (true);
    yyin = fopen("input.cpp", "r");
    yyparse();    
    return 0;
}
 
