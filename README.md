# 🛠️ Modelo Conceitual – Oficina Mecânica

## 📌 Descrição do Projeto
Este projeto apresenta a construção de um **modelo conceitual de banco de dados** para um **Sistema de Controle e Gerenciamento de Ordens de Serviço (OS)** em uma oficina mecânica.

O modelo foi desenvolvido a partir de uma narrativa fornecida como desafio de projeto, com o objetivo de identificar corretamente as **entidades**, **atributos** e **relacionamentos** envolvidos no contexto de uma oficina mecânica.

Sempre que a narrativa não detalhou explicitamente alguma informação, foram realizadas **inferências coerentes com o domínio do problema**, devidamente justificadas neste documento.

---

## 🎯 Objetivo
Criar um **esquema conceitual (Modelo Entidade-Relacionamento)** que represente:
- O cadastro de clientes e seus veículos
- A organização de equipes de mecânicos
- O controle de ordens de serviço
- A execução de serviços e utilização de peças
- O cálculo do valor total da ordem de serviço

---

## 🧩 Contexto do Sistema
Em uma oficina mecânica:

- Clientes levam seus veículos para **consertos ou revisões periódicas**
- Cada veículo é designado a uma **equipe de mecânicos**
- A equipe avalia o veículo e cria uma **Ordem de Serviço (OS)**
- A OS contém data de emissão, prazo de conclusão, status e valor total
- O valor da OS é calculado com base:
  - Na **tabela de referência de mão de obra**
  - No **valor das peças utilizadas**
- O cliente **autoriza a execução dos serviços**
- A mesma equipe que avalia é responsável pela execução

---

## 🏗️ Entidades Identificadas

### ✅ Cliente
Armazena as informações do cliente da oficina.
- id_cliente
- nome
- telefone
- endereço

> 🔎 Inferência: dados de contato do cliente não foram especificados na narrativa, mas são essenciais para o funcionamento do sistema.

---

### ✅ Veículo
Representa os veículos levados à oficina.
- id_veiculo
- placa
- marca
- modelo
- ano
- id_cliente

**Relacionamento:**  
Um cliente pode possuir vários veículos, mas cada veículo pertence a apenas um cliente (1:N).

---

### ✅ Equipe
Agrupa os mecânicos responsáveis por avaliar e executar serviços.
- id_equipe
- nome_equipe

> 🔎 Inferência: a narrativa menciona equipes, mas não define atributos. Foi criado um identificador e um nome para organização.

---

### ✅ Mecânico
Representa os profissionais da oficina.
- cod_mecanico
- nome
- endereço
- especialidade
- id_equipe

**Relacionamento:**  
Uma equipe pode ter vários mecânicos; um mecânico pertence a uma única equipe (1:N).

---

### ✅ Ordem de Serviço (OS)
Controla os serviços executados em um veículo.
- num_os
- data_emissao
- data_conclusao
- status
- valor_total
- autorizacao_cliente
- id_veiculo
- id_equipe

**Relacionamentos:**
- Um veículo pode possuir várias ordens de serviço
- Uma equipe pode ser responsável por várias ordens de serviço

---

### ✅ Serviço
Representa os serviços que podem ser executados.
- id_servico
- descricao
- valor_mao_obra

---

### ✅ Tabela de Referência de Mão de Obra
Usada para calcular o valor dos serviços.
- id_referencia
- descricao_servico
- valor_hora

---

### ✅ Peça
Representa peças utilizadas nos serviços.
- id_peca
- descricao
- valor_unitario

---

## 🔗 Entidades Associativas

### ✅ OS_Serviço
Relaciona ordens de serviço e serviços executados.
- num_os
- id_servico
- quantidade
- valor_servico

**Relacionamento:**  
Uma OS pode conter vários serviços e um serviço pode aparecer em várias OS (N:N).

---

### ✅ OS_Peça
Relaciona ordens de serviço e peças utilizadas.
- num_os
- id_peca
- quantidade
- valor_total_peca

**Relacionamento:**  
Uma OS pode utilizar várias peças e uma peça pode ser usada em várias OS (N:N).

---

## 📜 Regras de Negócio
- Uma Ordem de Serviço só pode ser executada após **autorização do cliente**
- O valor total da OS é a soma:
  - Dos serviços executados
  - Das peças utilizadas
- A mesma equipe avalia e executa os serviços
- Um mecânico pertence a apenas uma equipe
- Um veículo pertence a apenas um cliente

---

## 🖼️ Diagrama
O diagrama do modelo conceitual está disponível neste repositório no arquivo:

📄 `<img width="866" height="865" alt="Oficina (SQL)" src="https://github.com/user-attachments/assets/b325f487-7070-496e-bfb2-4c20360b2a41" />
`  
*(ou em outro formato conforme a ferramenta utilizada)*

---

## ✅ Conclusão
O modelo conceitual desenvolvido atende aos requisitos apresentados na narrativa, representando de forma clara e organizada as principais entidades, relacionamentos e regras de negócio de uma oficina mecânica.

Este esquema serve como base sólida para a evolução do projeto para os modelos **lógico** e **físico** de banco de dados.

---

📚 **Projeto desenvolvido para fins educacionais.**
