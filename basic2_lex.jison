/* description: Basic grammar that contains a nullable A nonterminal. */

%lex
%%

\s+               {/* skip whitespace */}
\d+               { return 'num'; }
[a-zA-Z_]\w*      { return 'x'; }

/lex

%%

A   : /* empty */  
    | A x 
    | A num
    ;

