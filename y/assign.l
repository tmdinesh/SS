%{
#include "y.tab.h"
%}

%%
[a-zA-Z][a-zA-Z0-9]*    { return ID; }
[0-9]+                  { yylval = atoi(yytext); return NUMBER; }
"="                     { return '='; }
";"                     { return ';'; }
[ \t\n]                 ;
.                       { return yytext[0]; }
%%
