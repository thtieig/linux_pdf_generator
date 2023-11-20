#!/bin/bash

[ -z $1 ] && echo "Use $0 <path where PDF/JPEG/JPG files are stored>" && exit 1

WORKPATH="$1"
TMPDIR="workspace"

cd "$WORKPATH"

echo "Currently in $(pwd)"

echo "Preparing working environment"

# Create temp folder
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"

# Rename files - all lowercase
for f in `find . -type f`; do cp -v "$f" ""$TMPDIR"/$(echo $f | tr '[A-Z]' '[a-z]')"; done

# Convert JPEG and JPG to PDF in "$TMPDIR"
cd "$TMPDIR" && find . -type f \( -iname \*.jpg -o -iname \*.jpeg \) -exec bash -c 'convert "$1" -resize 1240x1753 -extent 1240x1753 -gravity center -units PixelsPerInch -density 150x150 "${1%.*}".pdf && rm -f "$1"' - '{}' \;

# Generate single PDF - alphabetic order
gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=combine.pdf -dBATCH $(ls)

# Move single PDF generated file in $WORKPATH
cp combine.pdf "$WORKPATH/single_pdf_report.pdf"

cd "$WORKPATH"

echo "Clening up working environment"
rm -rf "$TMPDIR"

echo -e "\n\nYour PDF report is now available here: $WORKPATH/single_pdf_report.pdf"


