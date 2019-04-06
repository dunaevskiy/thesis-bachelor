gsed -E 's/^((\w|\+)+):\s+(.*)$/\\newacronym{\L\1\E}{\1}{\3}/' ./lib/acronyms.yml > ./tmp/acronyms.unsorted.tex

sort ./tmp/acronyms.unsorted.tex > ./tmp/acronyms.tex