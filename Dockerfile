# docker build . -t modicn/pandoc && docker push modicn/pandoc

FROM pandoc/latex:2.14

RUN tlmgr install ctex lipsum

ENV LANG C.UTF-8
