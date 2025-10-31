%{
#include <stdio.h>
int yylex(void);
int yyerror(const char *s) { printf("Error: %s\n", s); return 0; }
%}

%token ID NUMBER

%%
stmt    : ID '=' NUMBER ';' { printf("Assignment: %s = %d\n", yytext, $3); }
        ;
%%

int main() {
    return yyparse();
}
