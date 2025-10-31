%{
#include "y.tab.h"
%}
%%
[a-zA-Z][a-zA-Z0-9]*   { yylval = strdup(yytext); return ID; }
","                    { return ','; }
\n                     { return '\n'; }
[ \t]                  ;
.                      { return yytext[0]; }
%%
