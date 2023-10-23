%{
#include <stdio.h> 
%}
// %token NUM
// %token ID


%start program

%token NUMBER

%token IDENTIFIER

%token IF WHILE
%token SKIP THEN ELSE FI DO END
%token INTEGER READ WRITE LET IN
%token ASSGNOP
%left '-' '+'
%left '*' '/'
%right '^'

%%

program : 
LET
	declarations
IN { ; }
	commands
END { printf ("Programa sintaticamente correto!\n"); YYACCEPT;  }
;

declarations : /* empty */
| INTEGER id_seq IDENTIFIER '.' { ; }
;
id_seq : /* empty */
| id_seq IDENTIFIER ',' { ; }
;

commands : /* empty */
| commands command ';'
;

command : 
SKIP
| READ IDENTIFIER { ; }
| WRITE exp { ; }
| IDENTIFIER ASSGNOP exp { ; }
| IF exp
THEN commands
ELSE
{ ; }
commands
FI
| WHILE
{ ; }
exp
{ ; }
DO
commands
END
{ ; }

exp : NUMBER { ; }
| IDENTIFIER { ; }
| exp '<' exp { ; }
| exp '=' exp { ; }
| exp '>' exp { ; }
| exp '+' exp { ; }
| exp '-' exp { ; }
| exp '*' exp { ; }
| exp '/' exp { ; }
| exp '^' exp { ; }
| '(' exp ')' ;

%%
main () 
{
	yyparse ();
}
yyerror (s) /* Called by yyparse on error */
	char *s;
{
	printf ("Problema com a analise sintatica!\n", s);
}


