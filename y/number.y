%{
#include <stdio.h>
%}

%token NUMBER

%%
input   : NUMBER   { printf("Valid number: %s\n", yytext); }
        ;
%%

int main() {
    yyparse();
    return 0;
}
int yyerror(const char *s) { printf("Error: %s\n", s); return 0; }
