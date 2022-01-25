
a: lex.yy.o y.tab.o
	gcc -o a lex.yy.o y.tab.o -ly -ll

lex.yy.c: scanner.l y.tab.c
	flex scanner.l

y.tab.c: parser.y
	bison -vdty parser.y

clean:
	rm -f lex.yy.c
	rm -f lex.yy.o
	rm -f y.tab.c
	rm -f y.tab.h
	rm -f y.tab.o
	rm -f a
	rm -f test.a
	rm -f y.output