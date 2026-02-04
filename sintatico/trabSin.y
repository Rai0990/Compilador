%{
#include <stdio.h>
#include <string.h>

extern int yylex();
extern int yylineno;
extern char* yytext;
void yyerror(const char* s);
%}

%define parse.error verbose

%token TIPO_INT TIPO_REAL TIPO_CHAR TIPO_STRING
%token STRING CHAR
%token KW_IF KW_NOT KW_WHILE KW_FOR KW_RETURN KW_ELSE
%token OP_ATRIBUICAO
%token FUNCAO CONSTANTE VARIAVEL NUMERO_INT NUMERO_REAL

%token OP_REL_IGUAL OP_REL_DIFERENTE OP_REL_MENOR_IGUAL OP_REL_MAIOR_IGUAL
%token OP_LOG_E OP_LOG_OU
%token OP_REL_MENOR OP_REL_MAIOR

%token OP_ARIT_ADD OP_ARIT_SUB OP_ARIT_MULTI OP_ARIT_DIV
%token OP_ARIT_INC
%token OP_ARIT_DEC

%token DELIM_ABRE_PAR DELIM_FECHA_PAR
%token DELIM_ABRE_CHAVE DELIM_FECHA_CHAVE
%token DELIM_ABRE_COL DELIM_FECHA_COL
%token DELIM_VIRGULA
%token DELIM_PONTOEVIRGULA


%right OP_ATRIBUICAO
%left OP_LOG_OU
%left OP_LOG_E
%left OP_REL_IGUAL OP_REL_DIFERENTE OP_REL_MENOR_IGUAL OP_REL_MAIOR_IGUAL OP_REL_MENOR OP_REL_MAIOR
%left OP_ARIT_ADD OP_ARIT_SUB
%left OP_ARIT_MULTI OP_ARIT_DIV
%right KW_NOT
%right UMINUS 
%left OP_ARIT_INC OP_ARIT_DEC

%start programa
%%

programa: lista_comandos
    ;

lista_comandos: /* vazio */
    | lista_comandos comando
    ;

comando: declaracao_completa
    /* atribuicao_completa foi removida (redundante) */
    | comando_if
    | comando_while
    | comando_for
    | comando_return
    | bloco_codigo
    | expressao DELIM_PONTOEVIRGULA
    ;

bloco_codigo: DELIM_ABRE_CHAVE lista_comandos DELIM_FECHA_CHAVE
    ;

corpo_comando: comando
    ;

comando_if: KW_IF DELIM_ABRE_PAR expressao DELIM_FECHA_PAR corpo_comando
    | KW_IF DELIM_ABRE_PAR expressao DELIM_FECHA_PAR corpo_comando KW_ELSE corpo_comando
    ;

comando_while: KW_WHILE DELIM_ABRE_PAR expressao DELIM_FECHA_PAR corpo_comando
    ;

comando_for: KW_FOR DELIM_ABRE_PAR inicializacao_for DELIM_PONTOEVIRGULA expressao DELIM_PONTOEVIRGULA expressao DELIM_FECHA_PAR corpo_comando
    ;

inicializacao_for: declaracao_sem_terminador
    | expressao
    | /* Vazio */
    ;

declaracao_sem_terminador: tipo VARIAVEL
    | tipo VARIAVEL OP_ATRIBUICAO expressao
    | tipo CONSTANTE OP_ATRIBUICAO expressao
    ;

declaracao_completa: declaracao_sem_terminador DELIM_PONTOEVIRGULA
    ;

comando_return: KW_RETURN DELIM_PONTOEVIRGULA
    | KW_RETURN expressao DELIM_PONTOEVIRGULA
    ;

expressao: valor_literal
    | VARIAVEL
    | CONSTANTE
    | VARIAVEL OP_ATRIBUICAO expressao
    | DELIM_ABRE_PAR expressao DELIM_FECHA_PAR
    | VARIAVEL OP_ARIT_INC
    | VARIAVEL OP_ARIT_DEC
    | KW_NOT expressao
    | OP_ARIT_SUB expressao %prec UMINUS 
    | expressao OP_ARIT_ADD expressao
    | expressao OP_ARIT_SUB expressao
    | expressao OP_ARIT_MULTI expressao
    | expressao OP_ARIT_DIV expressao
    | expressao OP_REL_IGUAL expressao
    | expressao OP_REL_DIFERENTE expressao
    | expressao OP_REL_MENOR_IGUAL expressao
    | expressao OP_REL_MAIOR_IGUAL expressao
    | expressao OP_LOG_E expressao
    | expressao OP_LOG_OU expressao
    | expressao OP_REL_MENOR expressao
    | expressao OP_REL_MAIOR expressao
    ;

tipo: TIPO_INT
    | TIPO_REAL
    | TIPO_CHAR
    | TIPO_STRING
    ;

valor_literal: NUMERO_INT | NUMERO_REAL | STRING | CHAR ;

/* --- REGRAS REMOVIDAS (Agora estão diretas em 'expressao') --- */
/*
op_arit: OP_ARIT_ADD | OP_ARIT_SUB | OP_ARIT_MULTI | OP_ARIT_DIV;

comparacao: OP_REL_IGUAL | OP_REL_DIFERENTE | ...
*/

%%

int main(int argc, char** argv) {
    if (yyparse() == 0) {
        printf("Análise Sintática: SUCESSO\n");
    } else {
        printf("Análise Sintática: FALHA\n");
    }
    return 0;
}


void yyerror(const char* s) {
    fprintf(stderr, "\n--- ERRO SINTÁTICO ---\n");
    fprintf(stderr, "Linha: %d\n", yylineno);
    fprintf(stderr, "Trecho encontrado: '%s'\n", yytext);
    
    fprintf(stderr, "Detalhe: %s\n", s); 
    fprintf(stderr, "----------------------\n");
}