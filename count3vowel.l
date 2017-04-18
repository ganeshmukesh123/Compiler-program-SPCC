%{
#include<stdio.h>
int vowelcnt=0,consonantcnt=0,spc=0;
%}
VOWEL[aeiou]
CONSONANT [b-df-hj-np-tv-z]
BLANK [ ]
%%
{VOWEL} {vowelcnt++;}
{CONSONANT} {consonantcnt++;}
{BLANK} {spc++;}
%%
int yywrap()
{
return 1;
}
int main(int argc,char *argv[])
{
if(argc!=2)
{
printf("Error!!! Hey There");
exit(0);
}
yyin = fopen(argv[1],"r");
yylex();
printf("NO of VOWEL =%d \nNO of CONSONANT =%d \nNO of SPACE =%d\n",vowelcnt, consonantcnt, spc);
return 0;
}
