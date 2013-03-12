/* description: Basic grammar that contains a nullable A nonterminal. */

%lex
%%

\s+               {/* skip whitespace */}
[a-zA-Z_]\w*      {return 'x';}

/lex

%%

S   : A
           { return $1+" identifiers"; }
    ;
A   : /* empty */  
           { 
              console.log("starting"); 
              $$ = 0; 
           }
    | A x  { 
              $$ = $1 + 1;  
              console.log($$)
           }
    ;

