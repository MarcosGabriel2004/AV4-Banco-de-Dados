USE GerenciamentoOperacoes;

-- Registro de todas as embarcações e as empresas proprietárias em ordem alfabética
SELECT e.nome, c.razaosocial FROM embarcacoes AS e INNER JOIN clientes AS c ON e.cod_cliente = c.cod_cliente ORDER BY c.razaosocial, e.nome;

-- Quantidade de viagens registradas de cada embarcação
SELECT e.nome, COUNT(v.cod_viagem) AS qtd_viagens FROM embarcacoes AS e LEFT JOIN viagens AS v ON e.cod_embarcacao = v.cod_embarcacao GROUP BY e.cod_embarcacao ORDER BY qtd_viagens DESC;

-- Funcionários e seus gerentes
SELECT f.nome, c.nome as nome_cais, (SELECT g.nome FROM funcionarios AS g WHERE g.cod_funcionario = f.cod_gerente) AS nome_gerente FROM funcionarios AS f LEFT JOIN cais AS c ON f.cod_cais = c.cod_cais 
ORDER BY f.cod_gerente, ISNULL(c.nome), c.nome;

-- Gerentes e quantidade de subordinados contratados antes de 2021
SELECT cod_gerente, COUNT(cod_funcionario) AS qtd_subordinados FROM funcionarios WHERE cod_gerente IS NOT NULL AND data_contratacao < '2021-01-01' GROUP BY cod_gerente;

-- Operações Portuárias com média de peso de cargas acima de 2 toneladas
SELECT op.cod_operacaoportuaria, AVG(cg.peso) AS media_peso 
FROM operacoesportuarias AS op 
LEFT JOIN operacaoportuaria_carga AS oc ON op.cod_operacaoportuaria = oc.cod_operacaoportuaria
INNER JOIN cargas AS cg ON cg.cod_carga = oc.cod_carga
GROUP BY op.cod_operacaoportuaria
HAVING media_peso > 2000;

-- Operações Portuárias com média de peso de cargas acima de 2 toneladas (utilizando a VIEW)
SELECT Nome_Embarcacao, Data_Operacao, Horario_Operacao, Nome_Cais, Tipo_Operacao, MediaPeso_Carga FROM operacoes WHERE MediaPeso_Carga > 2000;

-- Próximas operações agendadas (utilizando VIEW)
SELECT Nome_Embarcacao, Data_Operacao, Horario_Operacao, Nome_Cais, Tipo_Operacao FROM operacoes WHERE Data_Operacao >= CURRENT_DATE() OR (Data_Operacao = CURRENT_DATE() AND Horario_Operacao >= CURRENT_TIME());

-- Quantidade de agendas ocupadas para cada cais a partir de hoje
SELECT c.nome, COUNT(o.cod_operacaoportuaria) AS agendas FROM cais AS c LEFT JOIN operacoesportuarias AS o ON c.cod_cais = o.cod_cais WHERE o.data >= CURRENT_DATE() OR (o.data = CURRENT_DATE() AND o.hora >= CURRENT_TIME()) GROUP BY c.cod_cais;