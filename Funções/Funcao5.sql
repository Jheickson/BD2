-- Criar uma função chamada getResponsavel que recebe o
-- nome de uma fazenda e retorne o nome do seu responsável.

CREATE OR REPLACE FUNCTION getResponsavel(fazenda varchar)
RETURNS varchar as $$

DECLARE

	codFunc integer;
	nomeResp varchar;

BEGIN

	codFunc := (
		SELECT codfuncresp
		FROM fazendas
		WHERE nome = fazenda
	);
	
	nomeResp := (
		SELECT nome
		FROM funcionarios
		WHERE codigo = codFunc
	);
	
	RETURN nomeResp;
	
END

$$ LANGUAGE plpgsql;

SELECT getResponsavel('Só despesa')