%{
#include "y.tab.h"
%}

%%
"if"        { return IF; }
"else"      { return ELSE; }
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]*   { yylval = (int)strdup(yytext); return ID; }
"="         { return '='; }
";"         { return ';'; }
"("         { return '('; }
")"         { return ')'; }
"+"         { return '+'; }
[ \t\n]     ;   // ignore spaces
.           { return yytext[0]; }
%%
