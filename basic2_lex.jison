/* lenguaje de secuencias de sentencias de asignación de la forma ID = NUM 
   separadas por ';'  */

%lex
%%

\s+                          { /* skip whitespace */ }
[a-zA-Z_]\w*                 { return 'ID'; }
\d+(\.\d*)?([-+]?[eE]\d+)?   { return 'NUM'; }
[=;]]                        { return yytext; }
.                            { return 'INVALID'}

/lex

%{
var symbol_table = {};
%}

%%

s   : e
    | s ';' e
    ;

e   : ID '=' NUM
    ;

