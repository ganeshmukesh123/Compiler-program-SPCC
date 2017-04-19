%{
#include<stdio.h>
#include<stdlib.h>
int nestcnt=0;
%}
%token IF OB CB RELOP NUMBER ID 
%%
stmt:if_stmt {printf("# of if statements=%d\n",nestcnt); exit(0);};
if_stmt:IF'('cond')'OB CB {nestcnt++;} |IF'('cond')'OB if_stmt {nestcnt++;} CB;
cond:x RELOP x;
x:ID|NUMBER;
%%
#include"lex.yy.c"
#include<stdio.h>
int yyerror(char *msg)
{
printf("INVALID EXPRESSION");
return 0;
}
void main()
{
printf("Enter the IF statement:");
yyparse();
}
