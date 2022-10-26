-- 1) Elaborar uma função que valide o digito verificador de um CPF

CREATE OR REPLACE FUNCTION validaCPF(cpf_par varchar(11))
RETURNS varchar AS $$

DECLARE

	x real;
	y real;
	len integer; 
	contador_loop integer; 
	soma integer;
	dig_1 integer; 
	dig_2 integer;
	validarpar_cpf varchar(11);

BEGIN

	x := 0;
	soma := 0;
	dig_1 := 0;
	dig_2 := 0;
	contador_loop := 0;
	validarpar_cpf := $1; 
	len := char_length(validarpar_cpf);
	x := len -1;
	contador_loop :=1;

	WHILE contador_loop <= (len -2) 
	LOOP

		y := CAST(substring(validarpar_cpf from contador_loop for 1) AS NUMERIC);
		soma := soma + ( y * x);
		x := x - 1;
		contador_loop := contador_loop +1;

	END LOOP;

	dig_1 := 11 - CAST((soma % 11) AS INTEGER);

	IF (dig_1 = 10)

		THEN dig_1 :=0 ;

	END IF;

	IF (dig_1 = 11)

		THEN dig_1 :=0 ;

	END IF;

	x := 11; soma :=0;
	contador_loop :=1;
	
	WHILE contador_loop <= (len -1)
	LOOP

		soma := soma + CAST((substring(validarpar_cpf FROM contador_loop FOR 1)) AS REAL) * x;
		x := x - 1;
		contador_loop := contador_loop +1;

	END LOOP;

	dig_2 := 11 - CAST ((soma % 11) AS INTEGER);
	
	IF (dig_2 = 10)

		THEN dig_2 := 0;

	END IF;

	IF (dig_2 = 11)

		THEN dig_2 := 0;

	END IF;

	IF ((dig_1 || '' || dig_2) = substring(validarpar_cpf FROM len-1 FOR 2))
		THEN RETURN 'CPF Válido';

	ELSE
	
	RETURN 'CPF Inválido';

	END IF;

END;

$$ LANGUAGE PLPGSQL;


SELECT validaCPF('05853552236');