-- Criar uma função denominada totalSalario que retorne o valor total pago de salários aos 
-- funcionários que ocupam uma dada função passada por parâmetro. Lembre que na tabela funcionários
-- temos as seguintes funções: Vaqueiro, Cowboy, Capataz.


CREATE OR REPLACE FUNCTION totalSalario(entrada enum_funcao)
RETURNS real as $$
	
	SELECT sum(salario)
	FROM funcionarios
	WHERE funcionarios.funcao = entrada;
	
$$ LANGUAGE SQL;

SELECT totalsalario('Cowboy')