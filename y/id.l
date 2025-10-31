%{
#include "y.tab.h"
%}

%%
[a-zA-Z][a-zA-Z0-9]*    { return ID; }
[ \t\n]                 ;
.                       { return yytext[0]; }
%%
