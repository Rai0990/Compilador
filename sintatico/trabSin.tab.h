/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_TRABSIN_TAB_H_INCLUDED
# define YY_YY_TRABSIN_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    TIPO_INT = 258,                /* TIPO_INT  */
    TIPO_REAL = 259,               /* TIPO_REAL  */
    TIPO_CHAR = 260,               /* TIPO_CHAR  */
    TIPO_STRING = 261,             /* TIPO_STRING  */
    STRING = 262,                  /* STRING  */
    CHAR = 263,                    /* CHAR  */
    KW_IF = 264,                   /* KW_IF  */
    KW_NOT = 265,                  /* KW_NOT  */
    KW_WHILE = 266,                /* KW_WHILE  */
    KW_FOR = 267,                  /* KW_FOR  */
    KW_RETURN = 268,               /* KW_RETURN  */
    KW_ELSE = 269,                 /* KW_ELSE  */
    OP_ATRIBUICAO = 270,           /* OP_ATRIBUICAO  */
    FUNCAO = 271,                  /* FUNCAO  */
    CONSTANTE = 272,               /* CONSTANTE  */
    VARIAVEL = 273,                /* VARIAVEL  */
    NUMERO_INT = 274,              /* NUMERO_INT  */
    NUMERO_REAL = 275,             /* NUMERO_REAL  */
    OP_REL_IGUAL = 276,            /* OP_REL_IGUAL  */
    OP_REL_DIFERENTE = 277,        /* OP_REL_DIFERENTE  */
    OP_REL_MENOR_IGUAL = 278,      /* OP_REL_MENOR_IGUAL  */
    OP_REL_MAIOR_IGUAL = 279,      /* OP_REL_MAIOR_IGUAL  */
    OP_LOG_E = 280,                /* OP_LOG_E  */
    OP_LOG_OU = 281,               /* OP_LOG_OU  */
    OP_REL_MENOR = 282,            /* OP_REL_MENOR  */
    OP_REL_MAIOR = 283,            /* OP_REL_MAIOR  */
    OP_ARIT_ADD = 284,             /* OP_ARIT_ADD  */
    OP_ARIT_SUB = 285,             /* OP_ARIT_SUB  */
    OP_ARIT_MULTI = 286,           /* OP_ARIT_MULTI  */
    OP_ARIT_DIV = 287,             /* OP_ARIT_DIV  */
    OP_ARIT_INC = 288,             /* OP_ARIT_INC  */
    OP_ARIT_DEC = 289,             /* OP_ARIT_DEC  */
    DELIM_ABRE_PAR = 290,          /* DELIM_ABRE_PAR  */
    DELIM_FECHA_PAR = 291,         /* DELIM_FECHA_PAR  */
    DELIM_ABRE_CHAVE = 292,        /* DELIM_ABRE_CHAVE  */
    DELIM_FECHA_CHAVE = 293,       /* DELIM_FECHA_CHAVE  */
    DELIM_ABRE_COL = 294,          /* DELIM_ABRE_COL  */
    DELIM_FECHA_COL = 295,         /* DELIM_FECHA_COL  */
    DELIM_VIRGULA = 296,           /* DELIM_VIRGULA  */
    DELIM_PONTOEVIRGULA = 297,     /* DELIM_PONTOEVIRGULA  */
    UMINUS = 298                   /* UMINUS  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_TRABSIN_TAB_H_INCLUDED  */
