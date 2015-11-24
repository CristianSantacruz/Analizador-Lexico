package analizador.lexico1;
import static analizador.lexico1.Token.*;
/*
 * INTEGRANTES:
 *  QUIMBITA LILIAN
 *  SANTACRUZ CRISTIAN
*/

%%
%class Lexer
%type Token
%line
%column

palabrasReservadas = ("int"|"float"|"bool"|"char"|"string"|"if"|"then"|"else"|"while"|"do"|"input"|"output"|"return")
boolean = ("true"|"false")
caracteresEspeciales = (","|";"|":"|"("|")"|"["|"]"|"{"|"}"|"+"|"-"|"*"|"/"|"<"|">"|"="|"!"|"&"|"$")
char = ("'")
//string = (""")
identificador = [a-zA-Z]+[a-zA-Z|0-9]*
digitos = [0-9]
espacios = [ \t\r\n]
operedores = ("<="|">="|"=="|"!="|"&&"|"||")

%{
public String lexeme;
%}
%%
"/*"[^"*/"]*"*/"+ { }
"//".* { }
{espacios} { }
{palabrasReservadas} {lexeme=yytext(); return KEYWORD;}
{boolean} {lexeme=yytext(); return BOOL;}
{char}+.*+{char} {lexeme=yytext(); return CHAR;}
//{string} {lexeme=yytext(); return STRING;}
{identificador} {lexeme=yytext(); return IDENTIFICADOR;}
{caracteresEspeciales} {lexeme=yytext(); return CARACTER;}
{operedores} {lexeme=yytext(); return OPERADOR;}
[-+]?{digitos}+ {lexeme=yytext(); return INT;}
[-+]?{digitos}","+ {digitos}+ {lexeme=yytext(); return FLOAT;}
. {System.out.println("Error Léxico   Línea: " + (yyline+1) + "   Columna: " + (yycolumn+1) + "   Caracter: " + yytext());}
