#!/bin/sh

########################################################

# Example of plantuml text representation of diagram
# <!--
# @startuml diagramName2

# node ModuleA
# node ModuleB

# ModuleA -> ModuleB

# @enduml
# -->

# ![](/path/to/the/denerated/diagramName.png)

########################################################


README_DIR="."

if [ ! -f "${README_DIR}/README.md" ]
then README_DIR=".."
fi

# 1. Tools check
if ! [ -x "$(command -v brew)" ]
then
    echo "\nPlease, install brew first.\n"
    exit 1
fi
if ! [ -x "$(command -v plantuml)" ]
then
    echo "\nInstalling plantuml with brew...\n"
    brew install plantuml
    brew upgrade plantuml
fi

# 2. Generate diagrams for README.md
plantuml -tpng "$README_DIR/README.md" -o "./Docs/Images/"
echo "✅ Generated diagrams for README.md"

# 3. Generate diagrams for level 1 *.md files
plantuml -tpng "$README_DIR/Docs/*.md" -o "./Images/"
echo "✅ Generated diagrams level 1 *.md files"

# 4. Generate diagrams for level 2 *.md files
plantuml -tpng "$README_DIR/Docs/*/*.md" -o "./Images/"
echo "✅ Generated diagrams level 2 *.md files"
