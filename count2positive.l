%{
#include<stdio.h>
int spacecnt=0,linecnt=0,poscnt=0,negcnt=0;
%}
PNUMBER [+]?[1-9][0-9]*
NNUMBER [-][1-9][0-9]*
EOL [\n]
BLANK [ ]
%%
{PNUMBER} {poscnt++;}
{NNUMBER} {negcnt++;}
{EOL} {linecnt++;}
{BLANK} {spacecnt++;}
%%
int yywrap(){
return 1;
}
int main(int argc,char *argv[])
{
if(argc!=2)
{
printf("Use the following command <./a.out><filename>");
exit(0);
}
yyin=fopen(argv[1],"r");
yylex();
printf("No. of spaces=%d \nNo. of +ine nos=%d \nNo. of -ine nos=%d \nNo. of line nos=%d \n",spacecnt,poscnt,negcnt,linecnt);
return 0;
}
