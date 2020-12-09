# docker build . -t modicn/pandoc && docker push modicn/pandoc

FROM pandoc/latex:2.11.2

RUN tlmgr install ctex

ENV LANG C.UTF-8
