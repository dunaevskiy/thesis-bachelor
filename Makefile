all: temp thesis

thesis: temp
	arara main.tex

temp:
	sh ./bin/acronyms.sh

clean:
	git clean -Xdf