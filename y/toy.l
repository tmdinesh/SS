%{
#include "y.tab.h"
%}

%%
[0-9]+                  { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]*    { return ID; }
"="                     { return '='; }
";"                     { return ';'; }
[+]                     { return '+'; }
[*]                     { return '*'; }
[ \t\n]                 ;   // ignore spaces
.                       { return yytext[0]; }
%%
