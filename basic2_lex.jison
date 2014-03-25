/* lenguaje de secuencias de sentencias de asignación de la forma ID = NUM 
   separadas por ';'  */

%lex
%%

\s+                          { /* skip whitespace */ }
[a-zA-Z_]\w*                 { return 'ID'; }
\d+(\.\d*)?([-+]?[eE]\d+)?   { yytext = Number(yytext); return 'NUM'; }
[=;]                         { return yytext; }
.                            { return 'INVALID'}

/lex

%{
var s = {};

var make_traverse = function() {
          var seen = [];
          return function(key, val) {
            if (typeof val == "object") {
              if (seen.indexOf(val) >= 0) return undefined
              seen.push(val)
            }
            return val
          };
};
%}

%%
p   : s { 
          var ss = JSON.stringify(s, undefined, 2); 
          console.log(ss); 
  

          return "<ul>\n<li>symbol table:<p>"+ss+
                 "\n</ul>";
        }
    ;

s   : e
    | s ';' e
    ;

e   : ID '=' NUM       { s[$1] = $$ = $3;}
    | ID '=' INVALID   
        {  
          throw new Error('Number expected on line ' + (yy.lexer.yylineno + 1) + ":\n" + yy.lexer.showPosition()+'\n');
        }
    ;

