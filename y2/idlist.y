%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex(void);
int yyerror(const char *s);
%}

%token ID

%%
list : list ',' ID   { printf("ID: %s\n", $3); }
     | ID            { printf("ID: %s\n", $1); }
     ;
%%
int main() {
    printf("Enter ID list:\n");
    yyparse();
}
int yyerror(const char *s) { printf("Error: %s\n", s); return 0; }
