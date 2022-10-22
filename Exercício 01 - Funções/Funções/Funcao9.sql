-- Criar uma função denominada signo que recebe o código de um funcionário
-- e devolve o signo dele com base na sua data de nascimento.

CREATE OR REPLACE FUNCTION signo(codFunc integer)
RETURNS varchar as $$

DECLARE

	nascFunc date;
	zodiaco varchar;

BEGIN

	nascFunc := (
		SELECT datanascimento
		FROM funcionarios
		WHERE codigo = codFunc
	);
	
  	CASE
	WHEN (EXTRACT(MONTH FROM nascFunc) = 3 AND EXTRACT(DAY FROM nascFunc) >= 21) OR (EXTRACT(MONTH FROM nascFunc) = 4 AND EXTRACT(DAY FROM nascFunc) <= 20) THEN zodiaco := 'Aries';
	WHEN (EXTRACT(MONTH FROM nascFunc) = 4 AND EXTRACT(DAY FROM nascFunc) >= 21) OR (EXTRACT(MONTH FROM nascFunc) = 5 AND EXTRACT(DAY FROM nascFunc) <= 20) THEN zodiaco := 'Touro';
	WHEN (EXTRACT(MONTH FROM nascFunc) = 5 AND EXTRACT(DAY FROM nascFunc) >= 21) OR (EXTRACT(MONTH FROM nascFunc) = 6 AND EXTRACT(DAY FROM nascFunc) <= 20) THEN zodiaco := 'Gemeos';
	WHEN (EXTRACT(MONTH FROM nascFunc) = 6 AND EXTRACT(DAY FROM nascFunc) >= 21) OR (EXTRACT(MONTH FROM nascFunc) = 7 AND EXTRACT(DAY FROM nascFunc) <= 22) THEN zodiaco := 'Cancer';
	WHEN (EXTRACT(MONTH FROM nascFunc) = 7 AND EXTRACT(DAY FROM nascFunc) >= 23) OR (EXTRACT(MONTH FROM nascFunc) = 8 AND EXTRACT(DAY FROM nascFunc) <= 22) THEN zodiaco := 'Leao';
	WHEN (EXTRACT(MONTH FROM nascFunc) = 8 AND EXTRACT(DAY FROM nascFunc) >= 23) OR (EXTRACT(MONTH FROM nascFunc) = 9 AND EXTRACT(DAY FROM nascFunc) <= 22) THEN zodiaco := 'Virgem';
	WHEN (EXTRACT(MONTH FROM nascFunc) = 9 AND EXTRACT(DAY FROM nascFunc) >= 23) OR (EXTRACT(MONTH FROM nascFunc) = 10 AND EXTRACT(DAY FROM nascFunc) <= 22) THEN zodiaco := 'Libra';
	WHEN (EXTRACT(MONTH FROM nascFunc) = 10 AND EXTRACT(DAY FROM nascFunc) >= 23) OR (EXTRACT(MONTH FROM nascFunc) = 11 AND EXTRACT(DAY FROM nascFunc) <= 21) THEN zodiaco := 'Escorpiao';
	WHEN (EXTRACT(MONTH FROM nascFunc) = 11 AND EXTRACT(DAY FROM nascFunc) >= 22) OR (EXTRACT(MONTH FROM nascFunc) = 12 AND EXTRACT(DAY FROM nascFunc) <= 21) THEN zodiaco := 'Sagitario';
	WHEN (EXTRACT(MONTH FROM nascFunc) = 12 AND EXTRACT(DAY FROM nascFunc) >= 22) OR (EXTRACT(MONTH FROM nascFunc) = 1 AND EXTRACT(DAY FROM nascFunc) <= 20) THEN zodiaco := 'Capricornio';
	WHEN (EXTRACT(MONTH FROM nascFunc) = 1 AND EXTRACT(DAY FROM nascFunc) >= 21) OR (EXTRACT(MONTH FROM nascFunc) = 2 AND EXTRACT(DAY FROM nascFunc) <= 18) THEN zodiaco := 'Aquario';
	WHEN (EXTRACT(MONTH FROM nascFunc) = 2 AND EXTRACT(DAY FROM nascFunc) >= 19) OR (EXTRACT(MONTH FROM nascFunc) = 3 AND EXTRACT(DAY FROM nascFunc) <= 20) THEN zodiaco := 'Peixes';
	END CASE;
	
	
	RETURN zodiaco;

END

$$ LANGUAGE plpgsql;


SELECT signo(1);