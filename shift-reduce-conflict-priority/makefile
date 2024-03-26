

.PHONY: clean

__start__: compiler
	./compiler

compiler: lex.yy.c parser.tab.c
	g++ parser.tab.c lex.yy.c -o compiler

parser.tab.c: parser.y
	bison parser.y --defines
	./pl2en.sh
	
lex.yy.c: lekser.l  
	flex lekser.l 
	

clean : 
	rm *.c *.h *.output compiler

