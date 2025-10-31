%{
#include "y.tab.h"
%}

%%
"if"        { return IF; }
"while"     { return WHILE; }
[0-9]+      { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]* { yylval.id = strdup(yytext); return ID; }
"="         { return '='; }
";"         { return ';'; }
"("         { return '('; }
")"         { return ')'; }
"{"         { return '{'; }
"}"         { return '}'; }
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
[ \t\n]     ;   // ignore whitespace
.           { return yytext[0]; }
%%
