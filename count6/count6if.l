%{
#include<stdio.h>
%}

%%
"if" {return IF;}
"{" {return OB;}
"}" {return CB;}
"<"|"=="|"!="|"<="|">=" {return RELOP;}
[0-9]+ {return NUMBER;}
[a-zA-Z][a-zA-Z0-9_]* {return ID;}
\n {;}
. {return yytext[0];}
%%
int yywrap()
{
return 1;
}
