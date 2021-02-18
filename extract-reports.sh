#!/usr/bin/env zsh
set -euo pipefail

# For all arcives in current dir
for f in $(ls *.(zip|gz)); do
  # 1: Exctract archive, and output to STDOUT
  # 
  # 2: Pretty-print the XML
  #    Sometimes, the reports are inlined, no linebreaks.
  #    By pretty-printing, we ensure that we can insert the stylesheet node without any issues
  # 
  # 3: Insert the stylesheet node at line 2
  # 
  # 4: Output to xml file, using archive name (without extensions) as filename.
  7z e "$f" -so | xmllint --format - | sed '2i <?xml-stylesheet type="text/xsl" href="https://raw.githubusercontent.com/Matter-Tech/dmarc-xslt/master/dmarc.xslt" ?>' > "$(sed -E 's/\.(xml|gz|zip)//g' <<< $f).xml"
done
