%{
#include <stdio.h>
int yylex(void);
int yyerror(const char *s) { printf("Error: %s\n", s); return 0; }
%}

%token NUMBER

%%
expr    : expr '+' term   { printf("%d\n", $1 + $3); $$ = $1 + $3; }
        | term            { $$ = $1; }
        ;
term    : NUMBER          { $$ = $1; }
        ;
%%

int main() {
    return yyparse();
}
