# 支持中文的 Pandoc Docker 镜像

[Pandoc](https://pandoc.org/) 是文档转换工具；LaTeX 是排版系统，Pandoc 使用 LaTeX 来输出 PDF；[ctex](https://github.com/CTeX-org/ctex-kit) 为 LaTeX 提供中文支持。

本项目构建了 `modidh/pandoc` Docker 镜像，该镜像以 Pandoc 官方 LaTeX / Alpine 镜像为基础，添加了 ctex 宏集，支持中文的处理。

## 使用方法

举个例子，如果要把 Markdown 文件 input.md 转换为 PDF 文件 output.pdf：

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

或使用包含上面命令的脚本：`./test.sh`

指定字体：

    -V mainfont:noto-sans-sc-regular.otf

## 参考资料

-   LaTex 官方简介：[Introduction to LaTeX](https://www.latex-project.org/about/)
-   [Basic Usage of tlmgr, the TEX Live Manager](http://tug.ctan.org/info/tlmgrbasics/doc/tlmgr.pdf)
-   Pandoc 官方用户手册：[Pandoc - Pandoc User’s Guide](https://pandoc.org/MANUAL.html)
-   [XeLaTeX - Overleaf, Online LaTeX Editor](https://www.overleaf.com/learn/latex/XeLaTeX)
-   经验与技巧
    -   [全面总结如何在 LaTeX 中使用中文 (2020 最新版) - jdhao's blog](https://jdhao.github.io/2018/03/29/latex-chinese.zh/)
    -   [Getting started with XeLaTeX | Rob J Hyndman](https://robjhyndman.com/hyndsight/xelatex/)
    -   https://zydecx.github.io/2015/08/pandoc-tutorial.html
    -   [LaTeX document without \documentclass - TeX - LaTeX Stack Exchange](https://tex.stackexchange.com/questions/94724/latex-document-without-documentclass)
    -   [Word to Markdown using Pandoc | A Mutable Log](https://tewarid.github.io/2017/12/04/word-to-markdown-using-pandoc.html)
    -   [Pandoc 的使用和遇到的问题 - 简书](https://www.jianshu.com/p/dcc2f95cc086)
-   LaTex 模板与样式
    -   [mohuangrui/ucasthesis: [最新样式] 中国科学院大学学位论文 LaTeX 模板 LaTeX Thesis Template for the University of Chinese Academy of Sciences](https://github.com/mohuangrui/ucasthesis)
    -   [Clean Thesis — A LaTeX Style for Thesis Documents • Developed by Ricardo Langner](http://cleanthesis.der-ric.de/)
