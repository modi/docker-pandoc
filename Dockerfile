# docker build . -t modidh/pandoc && docker push modidh/pandoc

# https://hub.docker.com/r/pandoc/latex
FROM pandoc/latex:2.19

RUN set -eux; \
    tlmgr option repository https://mirrors.tuna.tsinghua.edu.cn/tex-historic-archive/systems/texlive/2022/tlnet-final/; \
    tlmgr install ctex lipsum

ENV LANG C.UTF-8
