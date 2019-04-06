all: thesis

thesis: temp
	arara main.tex

temp:
	sh ./bin/acronyms.sh

clean:
	git clean -Xdf

fast:
	xelatex -shell-escape main.tex

convertimg:
	sh ./bin/convert_images.sh