gsed -E 's/^((\w|\+)+):\s+(.*)$/\\newacronym{\L\1\E}{\1}{\3}/' ./lib/acronyms.yml > ./tmp/acronyms.tex
