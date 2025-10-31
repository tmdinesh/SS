%{
#include <stdio.h>
%}

%token ID

%%
input   : ID   { printf("Valid identifier: %s\n", yytext); }
        ;
%%

int main() { return yyparse(); }
int yyerror(const char *s) { printf("Error: %s\n", s); return 0; }
