%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
int yyerror(const char *s);

typedef struct {
    char name[50];
    int value;
} Symbol;

Symbol symtab[100];
int symcount = 0;

int lookup(char *id) {
    for (int i = 0; i < symcount; i++) {
        if (strcmp(symtab[i].name, id) == 0) return symtab[i].value;
    }
    return 0; // default 0 if undeclared
}

void assign(char *id, int val) {
    for (int i = 0; i < symcount; i++) {
        if (strcmp(symtab[i].name, id) == 0) {
            symtab[i].value = val;
            return;
        }
    }
    strcpy(symtab[symcount].name, id);
    symtab[symcount].value = val;
    symcount++;
}
%}

%union {
    int num;
    char *id;
}

%token <num> NUMBER
%token <id> ID
%token IF ELSE

%type <num> expr

%right '='
%left '+'

%%
program : program stmt
        | /* empty */
        ;

stmt    : ID '=' expr ';'     { assign($1, $3); printf("%s = %d\n", $1, $3); }
        | IF '(' expr ')' stmt                { if ($3) { /* execute stmt */ } }
        | IF '(' expr ')' stmt ELSE stmt      { if ($3) { /* execute first stmt */ } else { /* execute second stmt */ } }
        ;

expr    : expr '+' expr       { $$ = $1 + $3; }
        | NUMBER              { $$ = $1; }
        | ID                  { $$ = lookup($1); }
        ;
%%

int main() {
    printf("Enter statements (Ctrl+D to stop):\n");
    return yyparse();
}

int yyerror(const char *s) {
    printf("Error: %s\n", s);
    return 0;
}
