/*
====================================================
PROJETO LÓGICO DE BANCO DE DADOS - OFICINA MECÂNICA
Autor: Rodrigo Oliveira
====================================================
*/

DROP DATABASE IF EXISTS oficina;

CREATE DATABASE oficina;
USE oficina;

-- CLIENTES

CREATE TABLE cliente(
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(20),
	endereco VARCHAR(255)
);

-- VEÍCULOS

CREATE TABLE veiculo(
	idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
	placa VARCHAR(10) NOT NULL UNIQUE,
	modelo VARCHAR(100),
	marca VARCHAR(100),
	ano INT,
	cliente_idCliente INT NOT NULL,
    
	CONSTRAINT fk_veiculo_cliente
	FOREIGN KEY (cliente_idCliente)
	REFERENCES cliente(idCliente)
);

-- EQUIPES

CREATE TABLE equipe(
	idEquipe INT AUTO_INCREMENT PRIMARY KEY,
	nomeEquipe VARCHAR(100) NOT NULL
);

-- MECÂNICOS

CREATE TABLE mecanico(
	idMecanico INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	endereco VARCHAR(255),
	especialidade VARCHAR(100),
	idEquipe INT NOT NULL,
    
	CONSTRAINT fk_mecanico_equipe
	FOREIGN KEY(idEquipe)
	REFERENCES equipe(idEquipe)
);

-- ORDEM DE SERVIÇO

CREATE TABLE ordemServico(
	numOS INT AUTO_INCREMENT PRIMARY KEY,
	dataEmissao DATE NOT NULL,
	dataConclusao DATE,
	statusOS ENUM(
		'Aberta',
		'Em andamento',
		'Concluída',
		'Cancelada'
	) DEFAULT 'Aberta',
	valorTotal DECIMAL(10,2),
	autorizacaoCliente BOOLEAN DEFAULT FALSE,
    
	idEquipe INT NOT NULL,
	idVeiculo INT NOT NULL,
    
	CONSTRAINT fk_os_equipe
	FOREIGN KEY(idEquipe)
	REFERENCES equipe(idEquipe),
    
	CONSTRAINT fk_os_veiculo
	FOREIGN KEY(idVeiculo)
	REFERENCES veiculo(idVeiculo)
);

-- SERVIÇOS

CREATE TABLE servico(
	idServico INT AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(255),
	valorMaoObra DECIMAL(10,2)
);

-- TABELA DE MÃO DE OBRA

CREATE TABLE tabelaMaoObra(
	idTabelaMaoObra INT AUTO_INCREMENT PRIMARY KEY,
	descricaoServico VARCHAR(255),
	valorHora DECIMAL(10,2),
    
	idServico INT NOT NULL,
    
	CONSTRAINT fk_tabela_servico
	FOREIGN KEY(idServico)
	REFERENCES servico(idServico)
);

-- PEÇAS

CREATE TABLE peca(
	idPeca INT AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(255),
	valorUnitario DECIMAL(10,2)
);

-- RELAÇÃO OS X SERVIÇO

CREATE TABLE osServico(
	numOS INT,
	idServico INT,
	quantidade INT NOT NULL,
	valorServico DECIMAL(10,2),
    
	PRIMARY KEY(numOS,idServico),
    
	CONSTRAINT fk_osservico_os
	FOREIGN KEY(numOS)
	REFERENCES ordemServico(numOS),
    
	CONSTRAINT fk_osservico_servico
	FOREIGN KEY(idServico)
	REFERENCES servico(idServico)
);

-- RELAÇÃO OS X PEÇA

CREATE TABLE osPeca(
	numOS INT,
	idPeca INT,
	quantidade INT NOT NULL,
	valorTotalPeca DECIMAL(10,2),
    
	PRIMARY KEY(numOS,idPeca),
    
	CONSTRAINT fk_ospeca_os
	FOREIGN KEY(numOS)
	REFERENCES ordemServico(numOS),
    
	CONSTRAINT fk_ospeca_peca
	FOREIGN KEY(idPeca)
	REFERENCES peca(idPeca)
);

/*
====================================================
2. INSERÇÃO DOS DADOS
====================================================
*/

-- CLIENTES

INSERT INTO cliente
(nome, telefone, endereco)
VALUES
('Rodrigo Oliveira','11988887777','São Paulo/SP'),
('Karina Oliveira','11977776666','São Paulo/SP'),
('Caio Oliveira','11966665555','São Paulo/SP'),
('Maria Scartigno','11955554444','Santo André/SP'),
('Victoria Anderson','11944443333','Praia Grande/SP');

-- VEÍCULOS

INSERT INTO veiculo
(placa, modelo, marca, ano, cliente_idCliente)
VALUES
('ABC1A23','Gol','Volkswagen',2018,1),
('DEF2B34','Onix','Chevrolet',2020,2),
('GHI3C45','HB20','Hyundai',2021,3),
('JKL4D56','Corolla','Toyota',2019,4),
('MNO5E67','Civic','Honda',2022,5);

-- EQUIPES

INSERT INTO equipe
(nomeEquipe)
VALUES
('Equipe A'),
('Equipe B');

-- MECÂNICOS

INSERT INTO mecanico
(nome, endereco, especialidade, idEquipe)
VALUES
('Carlos Silva','São Paulo/SP','Motor',1),
('André Souza','Santo André/SP','Suspensão',1),
('Ricardo Lima','São Paulo/SP','Freios',2),
('João Santos','São Bernardo/SP','Elétrica',2);

-- SERVIÇOS

INSERT INTO servico
(descricao, valorMaoObra)
VALUES
('Troca de óleo',120.00),
('Alinhamento e balanceamento',180.00),
('Troca de pastilhas de freio',250.00),
('Diagnóstico elétrico',150.00),
('Revisão completa',500.00);

-- TABELA DE MÃO DE OBRA

INSERT INTO tabelaMaoObra
(descricaoServico, valorHora, idServico)
VALUES
('Serviço básico',80.00,1),
('Serviço de alinhamento',100.00,2),
('Serviço de freios',120.00,3),
('Serviço elétrico',110.00,4),
('Revisão avançada',150.00,5);

-- PEÇAS

INSERT INTO peca
(descricao, valorUnitario)
VALUES
('Filtro de óleo',35.00),
('Óleo sintético 5W30',55.00),
('Pastilha de freio',180.00),
('Bateria 60Ah',450.00),
('Pneu 175/70 R13',350.00);

-- ORDEM DE SERVIÇO

INSERT INTO ordemServico
(
	dataEmissao,
	dataConclusao,
	statusOS,
	valorTotal,
	autorizacaoCliente,
	idEquipe,
	idVeiculo
)
VALUES
('2026-11-01','2026-11-02','Concluída',210.00,TRUE,1,1),
('2026-11-05',NULL,'Em andamento',430.00,TRUE,2,2),
('2026-11-08','2026-11-09','Concluída',680.00,TRUE,1,3),
('2026-11-10',NULL,'Aberta',0.00,FALSE,2,4),
('2026-11-15','2026-11-16','Concluída',850.00,TRUE,1,5);

-- RELAÇÃO OS X SERVIÇOS

INSERT INTO osServico
(numOS, idServico, quantidade, valorServico)
VALUES
(1,1,1,120.00),
(2,3,1,250.00),
(3,5,1,500.00),
(4,4,1,150.00),
(5,2,1,180.00);

-- RELAÇÃO OS X PEÇAS

INSERT INTO osPeca
(numOS, idPeca, quantidade, valorTotalPeca)
VALUES
(1,1,1,35.00),
(1,2,1,55.00),
(2,3,1,180.00),
(3,4,1,450.00),
(5,5,2,700.00);

INSERT INTO ordemServico
(
    dataEmissao,
    dataConclusao,
    statusOS,
    valorTotal,
    autorizacaoCliente,
    idEquipe,
    idVeiculo
)
VALUES
(
    '2026-11-20',
    NULL,
    'Em andamento',
    300.00,
    TRUE,
    1,
    1
);

/*
====================================================
3. CONSULTAS SQL
====================================================
*/

/*
Pergunta:
Quais são os clientes cadastrados?
*/

SELECT *
FROM cliente;

/*
Pergunta:
Quais veículos pertencem ao cliente Rodrigo Oliveira?
*/

SELECT
    v.placa,
    v.modelo,
    v.marca,
    c.nome
FROM veiculo v
INNER JOIN cliente c
    ON v.cliente_idCliente = c.idCliente
WHERE c.nome = 'Rodrigo Oliveira';

/*
Pergunta:
Quais ordens de serviço estão em andamento?
*/

SELECT
    numOS,
    statusOS,
    dataEmissao
FROM ordemServico
WHERE statusOS = 'Em andamento';

/*
Pergunta:
Quais ordens de serviço possuem valor superior a R$ 500?
*/

SELECT
    numOS,
    valorTotal
FROM ordemServico
WHERE valorTotal > 500;

/*
Pergunta:
Classificação das ordens de serviço por valor.
(Atributo derivado)
*/

SELECT
    numOS,
    valorTotal,
    CASE
        WHEN valorTotal >= 500 THEN 'Serviço de Alto Valor'
        ELSE 'Serviço de Baixo Valor'
    END AS CategoriaServico
FROM ordemServico;

/*
Pergunta:
Ordens de serviço ordenadas pelo maior valor.
*/

SELECT
    numOS,
    valorTotal
FROM ordemServico
ORDER BY valorTotal DESC;

/*
Pergunta:
Quantas ordens de serviço cada cliente possui?
*/

SELECT
    c.nome,
    COUNT(os.numOS) AS TotalOS
FROM cliente c
INNER JOIN veiculo v
    ON c.idCliente = v.cliente_idCliente
INNER JOIN ordemServico os
    ON v.idVeiculo = os.idVeiculo
GROUP BY c.idCliente;

/*
Pergunta:
Quais clientes possuem mais de uma ordem de serviço?
(HAVING)
*/

SELECT
    c.nome,
    COUNT(os.numOS) AS TotalOS
FROM cliente c
INNER JOIN veiculo v
    ON c.idCliente = v.cliente_idCliente
INNER JOIN ordemServico os
    ON v.idVeiculo = os.idVeiculo
GROUP BY c.idCliente
HAVING COUNT(os.numOS) > 1;

/*
Pergunta:
Quais mecânicos pertencem a cada equipe?
*/

SELECT
    m.nome AS Mecanico,
    e.nomeEquipe AS Equipe
FROM mecanico m
INNER JOIN equipe e
    ON m.idEquipe = e.idEquipe
ORDER BY e.nomeEquipe;

/*
Pergunta:
Quais serviços foram realizados em cada ordem de serviço?
*/

SELECT
    os.numOS,
    s.descricao,
    os.valorServico
FROM osServico os
INNER JOIN servico s
    ON os.idServico = s.idServico
ORDER BY os.numOS;

/*
Pergunta:
Quais peças foram utilizadas em cada ordem de serviço?
*/

SELECT
    op.numOS,
    p.descricao,
    op.quantidade,
    op.valorTotalPeca
FROM osPeca op
INNER JOIN peca p
    ON op.idPeca = p.idPeca
ORDER BY op.numOS;

/*
Pergunta:
Quais clientes autorizaram os serviços?
*/

SELECT
    os.numOS,
    c.nome,
    os.autorizacaoCliente
FROM ordemServico os
INNER JOIN veiculo v
    ON os.idVeiculo = v.idVeiculo
INNER JOIN cliente c
    ON v.cliente_idCliente = c.idCliente
WHERE os.autorizacaoCliente = TRUE;

/*
Pergunta:
Valor total gasto por cliente.
*/

SELECT
    c.nome,
    SUM(os.valorTotal) AS TotalGasto
FROM cliente c
INNER JOIN veiculo v
    ON c.idCliente = v.cliente_idCliente
INNER JOIN ordemServico os
    ON v.idVeiculo = os.idVeiculo
GROUP BY c.idCliente
ORDER BY TotalGasto DESC;