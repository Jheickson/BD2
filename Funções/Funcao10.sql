-- Criar uma função denominada mesAniversario que recebe o código
-- do funcionário e devolve o mês do seu aniversário por extenso.

CREATE OR REPLACE FUNCTION mesAniversario(codFunc integer)
RETURNS varchar as $$
	
DECLARE

	mesNasc varchar;
	mesFull varchar;

BEGIN

	mesNasc := (
		
		SELECT EXTRACT(MONTH FROM datanascimento)
		FROM funcionarios
		WHERE codigo = codFunc
		
	);
	
	CASE 
	
		WHEN mesNasc = '1' THEN mesFull := 'Janeiro';
		WHEN mesNasc = '2' THEN mesFull := 'Fevereiro';
		WHEN mesNasc = '3' THEN mesFull := 'Março';
		WHEN mesNasc = '4' THEN mesFull := 'Abril';
		WHEN mesNasc = '5' THEN mesFull := 'Maio';
		WHEN mesNasc = '6' THEN mesFull := 'Junho';
		WHEN mesNasc = '7' THEN mesFull := 'Julho';
		WHEN mesNasc = '8' THEN mesFull := 'Agosto';
		WHEN mesNasc = '9' THEN mesFull := 'Setembro';
		WHEN mesNasc = '10' THEN mesFull := 'Outubro';
		WHEN mesNasc = '11' THEN mesFull := 'Novembro';
		WHEN mesNasc = '12' THEN mesFull := 'Dezembro';
		
	END CASE;
	
	RETURN mesFull;

END

$$ LANGUAGE plpgsql;

SELECT mesAniversario(1);