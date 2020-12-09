# 使用 Docker 和 Pandoc 实现中文 Markdown 转 PDF

[Pandoc](https://pandoc.org/) 是文档转换工具；LaTeX 是排版系统，Pandoc 使用 LaTeX 来输出 PDF；[ctex](https://github.com/CTeX-org/ctex-kit) 为 LaTeX 提供中文支持。

本项目维护 `modicn/pandoc` Docker 镜像的构建脚本，该镜像以 Pandoc 官方 LaTeX / Alpine 镜像为基础，添加了 ctex 宏集，支持将包含中文的 Markdown 文件转换为 PDF。

举个例子，假设输入文件是 input.md，输出文件是 output.pdf：

    docker run --rm -v $PWD:/data modicn/pandoc \
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
        input.md
