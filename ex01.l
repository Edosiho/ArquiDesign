%{
#include <stdio.h>	
%}
%%
[ \t] {}
"if" 	{printf("Palabra reservada: if\n");}
"for"	{printf("Palabra reservada: for\n");}
"while"	{printf("Palabra reservada: while\n");}
[a-z][a-z0-9_]* {printf("Identificador: %s\n",yytext);}
[+-]?[0-9]+\.[0-9]+ ([E e][+-]?[0-9]+)?	{printf("Palabra reservada: constante doble\n");}
"+" 	{printf("Operador: +\n");}
\n		{return(0);}
.		{printf("Otra Cosa ");}
%%