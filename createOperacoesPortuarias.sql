DROP DATABASE IF EXISTS GerenciamentoOperacoes;
CREATE DATABASE GerenciamentoOperacoes;

DROP USER IF EXISTS 'admin'@'localhost';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON GerenciamentoOperacoes.* TO 'admin'@'localhost';

USE GerenciamentoOperacoes;

CREATE TABLE clientes (
	cod_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(14),
    razaosocial VARCHAR(60) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(60) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);

CREATE TABLE embarcacoes (
	cod_embarcacao VARCHAR(10) NOT NULL PRIMARY KEY,
    nome VARCHAR(30),
    cod_cliente INT NOT NULL,
    FOREIGN KEY (cod_cliente) REFERENCES clientes(cod_cliente)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE viagens (
	cod_viagem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	datahora_inicio DATETIME NOT NULL,
    datahora_termino DATETIME,
    origem VARCHAR(30) NOT NULL,
    destino VARCHAR(30) NOT NULL,
    qtd_carga INT NOT NULL,
    cod_embarcacao VARCHAR(10) NOT NULL,
    FOREIGN KEY (cod_embarcacao) REFERENCES embarcacoes(cod_embarcacao)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE cais (
	cod_cais INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(10) NOT NULL
);

CREATE TABLE funcionarios (
	cod_funcionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    data_contratacao DATE NOT NULL,
    data_rescisao DATE,
    cod_gerente INT,
    cod_cais INT,
    FOREIGN KEY (cod_gerente) REFERENCES funcionarios(cod_funcionario)
		ON UPDATE CASCADE
        ON DELETE SET NULL,
	FOREIGN KEY (cod_cais) REFERENCES cais(cod_cais)
		ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE tipooperacao (
	cod_tipooperacao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE operacoesportuarias (
	cod_operacaoportuaria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    cod_viagem INT NOT NULL,
    cod_cais INT NOT NULL,
    cod_tipooperacao INT NOT NULL,
    FOREIGN KEY (cod_viagem) REFERENCES viagens(cod_viagem)
		ON UPDATE CASCADE
        ON DELETE RESTRICT,
	FOREIGN KEY (cod_cais) REFERENCES cais(cod_cais)
		ON UPDATE CASCADE
        ON DELETE RESTRICT,
	FOREIGN KEY (cod_tipooperacao) REFERENCES tipooperacao(cod_tipooperacao)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE tipocarga (
	cod_tipocarga INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE cargas (
	cod_carga INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    peso DECIMAL,
    volume DECIMAL,
    cod_tipocarga INT NOT NULL,
    FOREIGN KEY (cod_tipocarga) REFERENCES tipocarga(cod_tipocarga)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE operacaoportuaria_carga(
	cod_operacaoportuaria INT NOT NULL,
    cod_carga INT NOT NULL,
    FOREIGN KEY (cod_operacaoportuaria) REFERENCES operacoesportuarias(cod_operacaoportuaria)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY (cod_carga) REFERENCES cargas(cod_carga)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);