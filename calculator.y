%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>  /* For pow() function */
int yylex(void);
int yyerror(char *s);
%}

%union { int ival; double fval; }

%token <fval> FLOAT
%token <ival> NUMBER
%type <fval> expr
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN EXP

/* Operator Priority */
%right EXP
%left PLUS MINUS
%left TIMES DIVIDE

%%
/* Grammar Rules */
input:
      line
    | input line /* If empty */
    ;

line:
      expr '\n' {
	  if ($1 == (int)$1)
              printf("Result: %d\n", (int)$1); /* If result is an integer, then cast it to int */
          else
              printf("Result: %.3f\n", $1); } /* Prints the result. (Shows only the first three digits after the decimal point.) */
    | '\n'
    ;


expr:
      expr EXP expr    { $$ = pow($1, $3); }
    | expr PLUS expr    { $$ = $1 + $3; }
    | expr MINUS expr   { $$ = $1 - $3; }
    | expr TIMES expr   { $$ = $1 * $3; }
    | expr DIVIDE expr  { 
                            if ($3 == 0) {
                                printf("Error: Cannot divide by zero!\n");
                                exit(1);
                            }
                            $$ = $1 / $3;
                         }
    | LPAREN expr RPAREN { $$ = $2; }
    | FLOAT              { $$ = $1; }
    | NUMBER             { $$ = $1; }
    ;
%%

int main(void) {
    printf("Calculator is running...\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
return 0;
}
