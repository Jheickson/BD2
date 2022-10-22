-- Criar uma Função chamada getfuncionario que recebe o código de um funcionário e retorna todos os seus dados.
-- Dica: a função retorna um SETOF

DROP FUNCTION getfuncionario;

CREATE OR REPLACE FUNCTION getfuncionario(integer)
RETURNS SETOF funcionarios as $$

	SELECT * 
	FROM funcionarios
	WHERE codigo=$1;
	
$$ LANGUAGE SQL;

SELECT getfuncionario(1);