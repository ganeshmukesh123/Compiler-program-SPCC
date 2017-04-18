%{
#include<stdio.h>
#include<stdlib.h>
%}
%token DIGIT LETTER NL UND
%%
stmt:variable NL {printf("Valid Identifiers\n"); exit(0);};
variable:LETTER alphanumeric;
alphanumeric:LETTER alphanumeric |
DIGIT alphanumeric |
UND alphanumeric |
LETTER |
DIGIT |
UND;
%%
#include "lex.yy.c"
#include<stdio.h>
int yyerror(char *msg)
{
printf("Invalid Expression:%s\n",msg);
exit (0);
}
int main()
{
printf("Enter the variable name\n");yyparse();
}
