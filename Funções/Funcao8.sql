-- Criar uma função chamada getPai que recebe o código de um animal
-- e retorna a filiação desse animal, ou seja, o nome do seu pai.

CREATE OR REPLACE FUNCTION getPai(codAnimal integer)
RETURNS varchar as $$

DECLARE

	paiCod integer;
	paiNome varchar;

BEGIN

	paiCod := (
	
		SELECT codpai
		FROM animais
		WHERE codigo = codAnimal
		
	);
	
	paiNome := (
		
		SELECT nome
		FROM animais
		WHERE codigo = paiCod
	
	);

	RETURN paiNome;

END

$$ LANGUAGE plpgsql;

SELECT getPai(5);