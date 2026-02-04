%option noyywrap
%option yylineno
%{
    #include <stdio.h>
    void print(char*);
%}

cB          [a-z]
cA          [A-Z]

%%

"inteiro"               {print("TIPO inteiro");}
"real"                  {print("TIPO real");}
"letra"                 {print("TIPO char");}
"palavra"               {print("TIPO string");}

\"([^"\\]|\\.)*\"       {print("STRING");}
\'[^\'\n]\'             { print("CARACTERE"); }


"se"                    {print("KW if");}
"nao"                   {print("KW not");}
"enquanto"              {print("KW while");}
"para"                  {print("KW for");}
"retorne"               {print("KW return");}
"="                     {print("KW atribuicao");}
"recebe"                {print("KW atribuicao");}

{cA}{cB}({cA}|{cB})*    {print("FUNCAO");}
{cA}({cA}|[0-9])+       {print("CONSTANTE");}
{cB}({cB}|[0-9])*       {print("VARIAVEL");}
[0-9]+                  {print("INTEIRO");}
[0-9]+[,.][0-9]+        {print("REAL");}

"=="                    { print("OP_REL IGUAL"); }
"!="                    { print("OP_REL DIFERENTE"); }
"<="                    { print("OP_REL MENOR OU IGUAL"); }
">="                    { print("OP_REL MAIOR OU IGUAL"); }
"&&"                    { print("OP_LOG E"); }
"||"                    { print("OP_LOG OU"); }
"<"                     { print("OP_REL MENOR"); }
">"                     { print("OP_REL MAIOR"); }
"+"                     { print("OP_ARIT ADD"); }
"-"                     { print("OP_ARIT SUB"); }
"*"                     { print("OP_ARIT MULTI"); }
"/"                     { print("OP_ARIT DIV"); }
"++"                    { print("OP_ARIT INC"); }


[ \t]+                  {}
\n                      {print("Delimitador de linha");}
"("                     { print("DELIM_ABRE_PAR"); }
")"                     { print("DELIM_FECHA_PAR"); }
"{"                     { print("DELIM_ABRE_CHAVE"); }
"}"                     { print("DELIM_FECHA_CHAVE"); }
"["                     { print("DELIM_ABRE_COL"); }
"]"                     { print("DELIM_FECHA_COL"); }
","                     { print("DELIM_VIRGULA"); }
";"                     { print("DELIM_PONTOEVIRGULA"); }


#.*                             { print("comentario simples");}
"/*"([^*]|\*+[^*/])*\*+"/"         {print("comentario composto");} 

.   { print("ERRO caractere inesperado"); }


%%

void print(char* token){
    printf("L:%d  tipo: %s tamanho: %d cadeia: %s\n",yylineno,token,yyleng,yytext);
}

int main(void){
    yylex();
    return 0;
}