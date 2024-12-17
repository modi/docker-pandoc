#!/bin/sh

docker run --rm -i \
    -u $(id -u):$(id -g) \
    -v $(pwd):/work -w /work \
    modidh/pandoc \
    --pdf-engine=xelatex \
    --toc \
    --toc-depth 2 \
    -V toc-title=目录 \
    -V pagestyle:plain \
    -V documentclass=ctexart \
    -V pagesize=a4 \
    -V geometry:margin=1in \
    -V indent:true \
    -V linkcolor:blue \
    -o output.pdf \
    examples/input.md
