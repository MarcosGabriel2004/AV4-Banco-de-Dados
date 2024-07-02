USE GerenciamentoOperacoes;

UPDATE embarcacoes
SET nome = 'Crusader I'
WHERE cod_embarcacao = 'IMO9840576';

-- Funcionário promovido a gerente.
UPDATE funcionarios
SET cod_gerente = NULL
WHERE cod_funcionario = 5;

-- Rescisão de funcionário
UPDATE funcionarios
SET data_rescisao = CURRENT_DATE()
WHERE cpf = '95847584756';

-- Fechamento de cais
DELETE FROM cais
WHERE cod_cais = 4;

-- Operação não vai mais ocorrer (Exclui relacionamento em cascata). OBS: Carga só pode ser deletada caso não esteja lrelacionada a operações portuárias.

DELETE FROM operacoesportuarias
WHERE cod_operacaoportuaria = 4;
