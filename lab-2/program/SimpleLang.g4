grammar SimpleLang;

prog: stat+ ;

stat: expr NEWLINE ;

expr
    : expr '^' expr              # Power        
    | expr op=('*'|'/'|'%') expr # MulDivMod
    | expr op=('+'|'-') expr     # AddSub
    | INT                        # Int
    | FLOAT                      # Float
    | STRING                     # String
    | BOOL                       # Bool
    | '(' expr ')'               # Parens
    ;

INT: [0-9]+ ;
FLOAT: [0-9]+'.'[0-9]* ;
STRING: '"' .*? '"' ;
BOOL: 'true' | 'false' ;
NEWLINE: '\r'? '\n' ;
WS: [ \t]+ -> skip ;
