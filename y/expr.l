%{
#include "y.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[+]         { return '+'; }
[ \t\n]     ;
.           { return yytext[0]; }
%%
