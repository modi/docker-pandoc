#!/bin/sh

docker run --rm -u $(id -u):$(id -g) -v $(pwd):/work -w /work modicn/pandoc \
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
	-o example/output.pdf \
	example/input.md
