all:
	yacc -d sintatico.y
	flex lexico.l
	gcc lex.yy.c y.tab.c
	./a.out