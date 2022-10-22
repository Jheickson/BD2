-- Crie uma função chamada calcInss que retorne o Valor pago de INSS por um funcionário da fazenda, cujo código deve ser 
-- passado como parâmetro à função. A regra é a seguinte: Se o funcionário ganha igual ou menor que 2000, o inss é 10% do
-- salário; se for maior que 2000 o inss é 15% do salário.

CREATE OR REPLACE FUNCTION calcInss(integer)
RETURNS real as $$

DECLARE

	valorINSS real;

BEGIN

	SELECT salario
	FROM funcionarios
	WHERE codigo=$1
	INTO valorINSS;
	IF valorINSS <= 2000
		THEN return valorINSS * 0.1;
	ELSE return valorINSS * 0.15;
	END IF;

END

$$ LANGUAGE plpgsql;

SELECT calcInss(1);