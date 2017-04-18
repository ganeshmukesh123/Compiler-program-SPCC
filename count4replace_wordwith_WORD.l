%{
#include<stdio.h>
int wc = 0, cc = 0, spc = 0, lc = 0;
%}
WORD[^ \t\n,.:]+
BLANK [ ]
EOL [\n]
%%
{BLANK} {printf("BLANKSPACE");spc++;}
{EOL} {printf("ENDOFLINE");lc++;}
{WORD} {printf("WORD");wc++;cc=cc+yyleng;}
%%
int yywrap()
{
return 1;
}
int main(int argc, char *argv[])
{
if(argc!=2)
{
printf("Error!!! Hey There");
exit(0);
}
yyin = fopen(argv[1],"r");
yylex();
printf("\nNO of Words =%d \nNO of Spaces =%d \nNO of Characters =%d \nNO of Lines =%d\n",wc, spc, cc, lc);
return 0;
}
