import java_cup.runtime.Symbol;

%%
%unicode
%cup
%line
%column

print = "PRINT"

entier = [0-9]+
chaine = \" [^\"]* \"

op_plus = "+"
op_fois = "*"
sym_equl = "="

pO = "("
pF = ")"

id_varE = [a-zA-Z0-9]+
id_varC = "$"[a-zA-Z][a-zA-Z]*


%%

{print} {return new Symbol(sym.PRINT);}

{entier} {return new Symbol(sym.NB, new Integer(yytext()));}
{chaine} {return new Symbol(sym.STR, new String(yytext()));}

{op_plus} {return new Symbol(sym.PLUS);}
{op_fois} {return new Symbol(sym.FOIS);}
{sym_equl} {return new Symbol(sym.EQUAL);}

{pO} {return new Symbol(sym.PO);}
{pF} {return new Symbol(sym.PF);}

{id_varE} {return new Symbol(sym.VARE, new String(yytext()));}
{id_varC} {return new Symbol(sym.VARC, new String(yytext()));}


\n {return new Symbol(sym.NL);}
[ ] {}
[\t] {}
. {return new Symbol(sym.NF, new String(yytext()));}
