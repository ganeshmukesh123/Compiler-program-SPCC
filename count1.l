%{
#include<stdio.h>
int cc=0,lc=0,spc=0,wc=0;
%}
WORD [^\t\n,\.:]+
EOL [\n]
BLANK []
%%
{WORD} {wc++;cc=cc+yyleng;}
{EOL} {lc++;}
{BLANK} {spc++;}
.{cc++;}
%%
int yywrap()
{
return 1;
}
int main(int argc,char *argv[])
{
if(argc!=2)
{
printf("ERROR");
exit(0);
}
yyin=fopen(argv[1],"r");
yylex();
printf("No.of Words are:%d\n No. of spaces are:%d\n No.of character are:%d\n No. of lines are:%d",wc,spc,cc,lc);
return 0;
}
