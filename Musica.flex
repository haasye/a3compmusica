%%
%public
%class Lexer
%unicode
%cup

%{
  import java_cup.runtime.Symbol;
%}

%%

\s+                     { /* ignora */ }
"//".*                  { /* ignora comentários */ }

"COMPASSO"                { return new Symbol(sym.COMPASSO); }
"BPM"                     { return new Symbol(sym.BPM); }

";"                     { return new Symbol(sym.SEMICOLON); }
"{"                     { return new Symbol(sym.LBRACE); }
"}"                     { return new Symbol(sym.RBRACE); }
"/"                     { return new Symbol(sym.SLASH); }


[0-9]+ "/" [0-9]+         { return new Symbol(sym.FRACTION, yytext()); }
[0-9]+                    { return new Symbol(sym.NUM, Integer.parseInt(yytext())); }

[A-Ga-g]                  { return new Symbol(sym.NOTE, yytext().toUpperCase()); }

.                         { System.err.println("Caractere inválido: " + yytext()); return null; }
