%option noyywrap
%option yylineno
%{
    #include <stdio.h>
    #include "trabSin.tab.h"
    void print(char*);
%}

cB            [a-z]
cA            [A-Z]

%%

"inteiro"         {print("TIPO inteiro"); return TIPO_INT;}
"real"            {print("TIPO real"); return TIPO_REAL;}
"letra"           {print("TIPO char"); return TIPO_CHAR;}
"palavra"         {print("TIPO string"); return TIPO_STRING;}

\"([^"\\]|\\.)*\"   {print("STRING"); return STRING;}
\'[^\'\n]\'         { print("CARACTERE"); return CHAR; }


"se"              {print("KW if"); return KW_IF;}
"senao"             {print("KW else"); return KW_ELSE;}
"enquanto"        {print("KW while"); return KW_WHILE;}
"para"            {print("KW for"); return KW_FOR;}
"retorne"         {print("KW return"); return KW_RETURN;}
"="               {print("KW atribuicao"); return OP_ATRIBUICAO;}
"recebe"          {print("KW atribuicao"); return OP_ATRIBUICAO;}

{cA}{cB}({cA}|{cB})* {print("FUNCAO"); return FUNCAO;}
{cA}({cA}|[0-9])*      {print("CONSTANTE"); return CONSTANTE;}
{cB}({cB}|[0-9])* {print("VARIAVEL"); return VARIAVEL;}
[0-9]+                {print("INTEIRO"); return NUMERO_INT;}
[0-9]+[,.][0-9]+      {print("REAL"); return NUMERO_REAL;}

"=="              { print("OP_REL IGUAL"); return OP_REL_IGUAL; }
"!="              { print("OP_REL DIFERENTE"); return OP_REL_DIFERENTE; }
"<="              { print("OP_REL MENOR OU IGUAL"); return OP_REL_MENOR_IGUAL; }
">="              { print("OP_REL MAIOR OU IGUAL"); return OP_REL_MAIOR_IGUAL; }
"&&"              { print("OP_LOG E"); return OP_LOG_E; }
"||"              { print("OP_LOG OU"); return OP_LOG_OU; }
"<"               { print("OP_REL MENOR"); return OP_REL_MENOR; }
">"               { print("OP_REL MAIOR"); return OP_REL_MAIOR; }
"+"               { print("OP_ARIT ADD"); return OP_ARIT_ADD; }
"-"               { print("OP_ARIT SUB"); return OP_ARIT_SUB; }
"*"               { print("OP_ARIT MULTI"); return OP_ARIT_MULTI; }
"/"               { print("OP_ARIT DIV"); return OP_ARIT_DIV; }
"++"              { print("OP_ARIT INC"); return OP_ARIT_INC; }
"--"              { print("OP_ARIT DEC"); return OP_ARIT_DEC; }
"!"             {print("KW not"); return KW_NOT;}



[ \t\n]+            { }
"("               { print("DELIM_ABRE_PAR"); return DELIM_ABRE_PAR; }
")"               { print("DELIM_FECHA_PAR"); return DELIM_FECHA_PAR; }
"{"               { print("DELIM_ABRE_CHAVE"); return DELIM_ABRE_CHAVE; }
"}"               { print("DELIM_FECHA_CHAVE"); return DELIM_FECHA_CHAVE; }
"["               { print("DELIM_ABRE_COL"); return DELIM_ABRE_COL; }
"]"               { print("DELIM_FECHA_COL"); return DELIM_FECHA_COL; }
","               { print("DELIM_VIRGULA"); return DELIM_VIRGULA; }
";"               { print("DELIM_PONTOEVIRGULA"); return DELIM_PONTOEVIRGULA; }


#.* { print("comentario simples"); }
"/*"([^*]|\*+[^*/])*\*+"/"   {print("comentario composto"); } 

.                 { print("ERRO caractere inesperado"); }


%%

void print(char* token){
    printf("L:%d  tipo: %s tamanho: %d cadeia: %s\n",yylineno,token,yyleng,yytext);
}