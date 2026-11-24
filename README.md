# 🔧 Projeto de Banco de Dados para Oficina Mecânica

## 📌 Descrição

Projeto desenvolvido como parte dos desafios da formação SQL Database Specialist da DIO.

O projeto iniciou com a modelagem conceitual de um sistema de controle e gerenciamento de Ordens de Serviço (OS) para uma oficina mecânica e evoluiu para a implementação completa de um banco de dados relacional utilizando MySQL.

Além da modelagem, foram desenvolvidos:

- Modelo lógico
- Implementação do banco de dados
- Inserção de dados para testes
- Consultas SQL para análise das informações

---

## 🎯 Objetivo

Representar de forma estruturada os processos de uma oficina mecânica, incluindo:

- Cadastro de clientes
- Cadastro de veículos
- Controle de equipes e mecânicos
- Gestão de ordens de serviço
- Controle de serviços executados
- Controle de peças utilizadas
- Cálculo dos valores das ordens de serviço

---

## 🧩 Contexto do Sistema

Em uma oficina mecânica:

- Clientes levam veículos para manutenção ou revisão.
- Cada veículo pertence a um cliente.
- Equipes de mecânicos são responsáveis pela avaliação e execução dos serviços.
- Ordens de Serviço (OS) registram os atendimentos realizados.
- Serviços e peças são vinculados às ordens de serviço.
- O cliente deve autorizar a execução dos serviços.
- O valor total da OS é calculado com base nos serviços executados e peças utilizadas.

---

## 🏗️ Modelo de Dados

### Principais Entidades

- Cliente
- Veículo
- Equipe
- Mecânico
- Ordem de Serviço
- Serviço
- Tabela de Mão de Obra
- Peça

### Entidades Associativas

- OS_Serviço
- OS_Peça

### Relacionamentos

- Um cliente pode possuir vários veículos.
- Um veículo pertence a um único cliente.
- Uma equipe pode possuir vários mecânicos.
- Uma Ordem de Serviço está vinculada a um veículo.
- Uma Ordem de Serviço está vinculada a uma equipe.
- Uma Ordem de Serviço pode possuir vários serviços.
- Uma Ordem de Serviço pode utilizar várias peças.

---

## 🛠️ Tecnologias Utilizadas

- MySQL
- SQL
- MySQL Workbench
- GitHub

---

## 📂 Estrutura do Projeto

### oficina.sql

Arquivo contendo:

- Criação do banco de dados
- Criação das tabelas
- Relacionamentos
- Inserção dos dados para testes
- Consultas SQL

### Oficina.mwb

Arquivo do modelo desenvolvido no MySQL Workbench.

### Oficina (SQL).png

Imagem do modelo lógico utilizado no banco de dados.

---

## 📊 Consultas Desenvolvidas

Foram implementadas consultas contendo:

### SELECT

Recuperação de clientes, veículos, serviços e ordens de serviço.

### WHERE

Filtragem de ordens de serviço por status e valor.

### CASE

Criação de atributos derivados para classificação dos serviços.

### ORDER BY

Ordenação das ordens de serviço por valor.

### HAVING

Identificação de clientes com mais de uma ordem de serviço.

### JOIN

Relacionamentos entre:

- Clientes e veículos
- Equipes e mecânicos
- Ordens de serviço e serviços
- Ordens de serviço e peças

---

## ✅ Resultados

O banco de dados foi implementado com sucesso.

Foram realizadas:

- Criação do esquema relacional
- Inserção de dados de teste
- Validação dos relacionamentos
- Execução das consultas SQL

Todas as tabelas, relacionamentos, inserções e consultas executaram sem erros.

---

## 📚 Evolução do Projeto

Este projeto evoluiu através das seguintes etapas:

✅ Modelo Conceitual (ER)

✅ Modelo Lógico

✅ Implementação Física (SQL)

✅ Persistência de Dados

✅ Consultas SQL para Análise

---

## 👨‍💻 Autor

Rodrigo Oliveira

Projeto desenvolvido para fins educacionais durante a formação SQL Database Specialist da DIO.
