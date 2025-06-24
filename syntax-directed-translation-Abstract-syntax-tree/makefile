
.PHONY: clean

__start__: compiler
	./compiler

compiler: lex.yy.c parser.tab.c
	g++ parser.tab.c lex.yy.c -o compiler
	./pl2en.sh

parser.tab.c: parser.y
	bison parser.y --defines
	
lex.yy.c: lekser.l  
	flex lekser.l 

clean : 
	rm *.yy.c *.tab.c *.tab.h *.output compiler

