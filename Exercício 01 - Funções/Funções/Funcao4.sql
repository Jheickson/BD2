-- Criar uma função chamada getQtdFuncionarios que retorna a quantidade de funcionários
-- que trabalham em uma determinada fazenda cujo nome é passado como parâmetro.

CREATE OR REPLACE FUNCTION getQtdFuncionarios()
RETURNS real as $$

DECLARE

	count real;
	
BEGIN

	FOR count IN
	
		SELECT codigo
		FROM funcionarios
	
	LOOP
		
		count = count + 1;		
	
	END LOOP;
	
	count = count - 1;
	
	RETURN count;
	
END
	
$$ LANGUAGE plpgsql;

SELECT getQtdFuncionarios()