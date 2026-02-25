#bin/bash

scriptdir="/bin/Scripts/ResourceImporters"

UndertaleModCli load ./lambdarune-orig/data.win -o ./lambdarune/data.win \
-s "$scriptdir/ImportGraphics.csx"

echo "/home/yartom/Downloads/lambdarune/code/import
/home/yartom/Downloads/lambdarune/code/new
./fonts
" | UndertaleModCli load ./lambdarune/data.win -o ./lambdarune/data.win \
-s "$scriptdir/ImportGML.csx" \
-s "$scriptdir/ImportGML.csx" \
-s "$scriptdir/ImportFonts.csx"
