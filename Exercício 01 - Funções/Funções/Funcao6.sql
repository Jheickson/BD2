-- Criar uma função chamada getIdadeFuncionario que 
-- recebe o código do funcionário e retorna a idade dele.

CREATE OR REPLACE FUNCTION getIdadeFuncionario(codFunc integer)
RETURNS varchar as $$

DECLARE

	dataNasc date;
	
BEGIN

	dataNasc := (
		SELECT datanascimento
		FROM funcionarios
		WHERE codigo = codFunc
	);
	
	RETURN age(dataNasc);

END

$$ LANGUAGE plpgsql;

SELECT getIdadeFuncionario(1)