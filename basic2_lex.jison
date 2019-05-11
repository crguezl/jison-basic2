/* description: Basic grammar that contains a nullable A nonterminal. */

%lex
%%

\s+               {/* skip whitespace */}
\d+               { return 'num'; }
[a-zA-Z_]\w*      { return 'x'; }

/lex

%%

A   : /* empty */  
           { 
              console.log(`starting`); 
              $$ = 0; 
           }
    | A x { 
              $$ = $1 + 1;  
              console.log(`One more word (${yytext}) count: `+$$)
           }
    | A num { 
              $$ = $1 + 1;  
              console.log(`One more num (${yytext}) count: `+$$)
           }
    ;

