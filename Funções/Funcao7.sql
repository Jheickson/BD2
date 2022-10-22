-- Criar uma função denominada numVogais que recebe o código de um
-- funcionário e devolve o número de vogais contidas no seu nome.

CREATE OR REPLACE FUNCTION numVogais(codFunc integer)
RETURNS integer as $$

DECLARE
	
	nomeFunc varchar;
	countVog integer;
	lngth integer;
	charAtual char;
	
BEGIN

	nomeFunc := (
		SELECT nome
		FROM funcionarios
		WHERE codigo = codFunc
	);
	
	nomeFunc := LOWER(nomeFunc);

	lngth := (
		length(nomeFunc)
	);

	FOR i IN 1..lngth LOOP 
	
        charAtual := Substr(nomeFunc, i, 1); 
  
        IF charAtual IN ( 'a', 'e', 'i', 'o', 'u' ) 
		THEN 
          countVog := countVog + 1; 
        END IF; 
    END LOOP; 
		
	RETURN countVog;

END

$$ LANGUAGE plpgsql;

SELECT numVogais(1);