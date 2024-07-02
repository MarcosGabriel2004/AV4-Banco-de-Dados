USE GerenciamentoOperacoes;

INSERT INTO clientes (cnpj, razaosocial, telefone, email, endereco) VALUES
	('01234567890123', 'Petrobras', '2123324556', 'petrobras@gmail.com', 'Avenida A, Rio de Janeiro'),
    ('43210567890123', 'MSC', '112977556', 'msc@gmail.com', 'Rodovia Dutra, São Paulo'),
    (NULL, 'Portugas Navegações', '+35112977556', 'portugas.nav@gmail.com', 'Rua João VI, Porto, Portugal');
    
INSERT INTO embarcacoes (cod_embarcacao, nome, cod_cliente) VALUES
	('IMO0912457', 'PetroNavio', '1'),
    ('IMO6374645', 'Rei do Mar', '2'),
    ('IMO9840576', 'Crusader', '2'),
    ('IMO4327643', 'Cruzeiro Camões', '3');
    
INSERT INTO viagens (datahora_inicio, datahora_termino, origem, destino, qtd_carga, cod_embarcacao) VALUES
	('2024-06-30 12:00:00', '2024-07-07 15:00:00', 'África do Sul', 'Brasil', 120, 'IMO0912457'),
    ('2024-07-10 08:00:00', '2024-07-14 20:00:00', 'Brasil', 'Estados Unidos da América', 150, 'IMO0912457'),
    ('2024-06-15 16:00:00', '2024-07-20 11:00:00', 'Estados Unidos da América', 'Brasil', 100, 'IMO0912457'),
    ('2024-06-30 08:00:00', '2024-07-28 15:00:00', 'Brasil', 'China', 200, 'IMO6374645'),
    ('2024-07-31 12:00:00', '2024-08-25 15:00:00', 'China', 'Brasil', 120, 'IMO6374645'),
    ('2024-06-30 12:00:00', '2024-07-05 15:00:00', 'Espanha', 'Brasil', 120, 'IMO9840576');
    
INSERT INTO cais (nome) VALUES
	('Cais 01'),
    ('Cais 02'),
    ('Cais 03'),
    ('Cais 04');
    
INSERT INTO funcionarios (nome, cpf, telefone, data_contratacao, data_rescisao, cod_gerente, cod_cais) VALUES
	('João Passos', '01234567891', '21945635474', '2019-02-05', NULL, NULL, 2),
    ('Mario Augusto', '53464754736', '21984754637', '2018-07-14', '2021-09-17', NULL, NULL),
    ('Ivana Silva', '75648573945', '21994948573', '2023-12-06', NULL, 1, NULL),
    ('Ítalo Neves', '98364753245', '21964538273', '2019-04-23', NULL, 1, 2),
    ('Gustavo Almeida', '87594837485', '21953764474', '2021-07-05', NULL, NULL, 3),
    ('Otávio Santos', '67483948276', '21997836273', '2022-11-26', NULL, 5, NULL),
    ('Nívea Silva', '16728394876', '21987879687', '2017-09-13', NULL, 5, 3),
    ('Íris Mota', '73464387645', '21998787987', '2017-07-16', NULL, NULL, 1),
    ('Otávio Santos', '67485643676', '21997836273', '2022-10-23', NULL, 8, NULL),
    ('Silvio Ribeiro', '95847584756', '21996785968', '2018-03-17', NULL, 8, 1),
    ('Henrique Almeida', '17628374837', '21993746354', '2016-02-05', NULL, NULL, 4),
    ('Mateus Simas', '28374837483', '21976858576', '2019-05-18', NULL, 11, NULL),
    ('Ariane Costa', '34527384958', '21997878676', '2017-04-07', NULL, 11, 4);
    
INSERT INTO tipooperacao (nome) VALUES
	('Carga'),
    ('Descarga');
    
INSERT INTO operacoesportuarias (data, hora, cod_viagem, cod_cais, cod_tipooperacao) VALUES
	('2024-07-07', '14:00:00', 1, 3, 2),
    ('2024-07-10', '09:00:00', 2, 1, 1),
    ('2024-07-19', '15:00:00', 3, 3, 2),
    ('2024-06-30', '08:00:00', 4, 2, 1),
    ('2024-08-25', '15:00:00', 5, 2, 2),
    ('2024-07-05', '08:00:00', 6, 3, 2);
    
INSERT INTO tipocarga (nome) VALUES
	('Contêiner'),
    ('Skid'),
    ('Tubos'),
    ('Juntas de Risers');
    
INSERT INTO cargas (descricao, peso, volume, cod_tipocarga) VALUES
    ('Contêiner P', 2500, 50, 1),
    ('Contêiner M', 3000, 60, 1),
    ('Contêiner G', 3500, 70, 1),
    ('Skid P', 500, 10, 2),
    ('Skid M', 800, 15, 2),
    ('Skid G', 1000, 20, 2),
    ('Load de Tubo P', 1500, 30, 3),
    ('Load de Tubo M', 1700, 50, 3),
    ('Load de Tubo G', 2000, 70, 3),
    ('Junta de Risers P', 1000, 20, 4),
    ('Junta de Risers M', 1500, 30, 4),
    ('Junta de Risers G', 2000, 50, 4);
    
INSERT INTO operacaoportuaria_carga (cod_operacaoportuaria, cod_carga) VALUES
	(1, 8),
    (2, 8),
    (1, 7),
    (3, 6),
    (3, 7),
    (3, 8),
    (4, 1),
    (4, 2),
    (5, 3),
    (5, 3),
    (6, 10),
    (6, 12),
    (6, 11);