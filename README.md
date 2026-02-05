# Analisador Léxico e Sintático (Containerized)

Implementação de um compilador *front-end* robusto para uma linguagem estruturada baseada em Portugol. O projeto foi desenvolvido em **C** utilizando **Flex** e **Bison**, e conta com suporte total a **Docker** para garantir portabilidade e consistência de ambiente.

O sistema realiza a análise léxica e sintática completa, validando a gramática e reportando erros com precisão de linha e tipo de token.

## 🚀 Destaques de Engenharia

* **Arquitetura de Compilação:** Separação clara entre definições léxicas (Regex/Flex) e regras gramaticais (BNF/Bison).
* **Containerização (Docker):** O projeto inclui um `Dockerfile` otimizado que automatiza a configuração do ambiente (instalação de GCC, bibliotecas e build tools), eliminando problemas de compatibilidade entre sistemas operacionais.
* **Base Teórica:** Implementação baseada em Autômatos Finitos Determinísticos (DFA) e análise sintática *Bottom-Up* LR(1).

## 🛠️ Stack Tecnológica

* **Linguagem:** C 
* **Análise Léxica:** Flex 
* **Análise Sintática:** GNU Bison
* **DevOps/Build:** Docker & Make

## 🐳 Como Rodar (Via Docker - Recomendado)

A maneira mais simples e limpa de executar o projeto, sem instalar dependências na sua máquina local.

**1. Construir a Imagem**
Gera o ambiente isolado com todas as ferramentas necessárias.
```bash
docker build -t compilador-portugol .
