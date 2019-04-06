for f in ./images/*.svg; do
   OLDNAME=$f
   NEWNAME="./images/`basename $f .svg`.pdf"
   cairosvg -f pdf $OLDNAME -o $NEWNAME
done;
