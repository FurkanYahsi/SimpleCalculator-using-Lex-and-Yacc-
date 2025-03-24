%{
#include "y.tab.h"  
#include <stdlib.h> 
%}

int yyerror(char *s);

digit   [0-9]

%%

[0-9]+\.[0-9]+  { yylval.fval = atof(yytext); return FLOAT; }
[0-9]+           { yylval.ival = atoi(yytext); return NUMBER; }
[ \t]+           {} /* Ignore spaces and tabs */
"+"              { return PLUS; }
"-"              { return MINUS; }
"*"              { return TIMES; }
"/"              { return DIVIDE; }
"("              { return LPAREN; }
")"              { return RPAREN; }
"**"             { return EXP; }
"^"              { return EXP; }
\n	         { return '\n'; }
.                {} /* Don't do anything for unrecognized characters. */

%%

