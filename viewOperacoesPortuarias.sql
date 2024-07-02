CREATE VIEW operacoes AS
SELECT 
	e.cod_embarcacao AS IMO_Embarcacao,
    e.nome AS Nome_Embarcacao,
    o.data AS Data_Operacao,
    o.hora AS Horario_Operacao,
    cs.nome AS Nome_Cais,
    tp.nome AS Tipo_Operacao,
    COUNT(oc.cod_operacaoportuaria) AS Quantidade_Carga,
    AVG(cg.peso) AS MediaPeso_Carga,
	c.razaosocial AS Razao_Social,
    c.cnpj AS CNPJ,
    c.email AS Email,
    v.origem AS Origem_Viagem,
    v.destino AS Destino_Viagem
FROM 
	clientes AS c
    INNER JOIN embarcacoes AS e ON e.cod_cliente = c.cod_cliente
    INNER JOIN viagens AS v ON v.cod_embarcacao = e.cod_embarcacao
    INNER JOIN operacoesportuarias as o ON o.cod_viagem = v.cod_viagem
    INNER JOIN tipooperacao AS tp ON tp.cod_tipooperacao = o.cod_tipooperacao
    LEFT JOIN operacaoportuaria_carga AS oc ON oc.cod_operacaoportuaria = o.cod_operacaoportuaria
    INNER JOIN cargas AS cg ON cg.cod_carga = oc.cod_carga
    LEFT JOIN cais AS cs ON cs.cod_cais = o.cod_cais
GROUP BY o.cod_operacaoportuaria
ORDER BY Data_Operacao
;

SELECT * FROM operacoes;