FROM ubuntu:22.04

LABEL description="Compilador Portugol - Unesp"
LABEL maintainer="Raí da Silva de Mattos"

# Instala gcc, flex, bison e make
RUN apt-get update && apt-get install -y \
    gcc \
    flex \
    bison \
    make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app


ENTRYPOINT ["./meu_analisador"]