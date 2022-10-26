-- 2) Criar uma função que recebe um nome e retorne o primeiro e último nome desse nome.
-- Ex.: Manoel da Silva Alves      RETORNO: Manoel Alves

CREATE OR REPLACE FUNCTION nomeSobrenome(inputNome varchar)
RETURNS varchar AS $$

DECLARE

    nome varchar;

BEGIN

    nome := substring(trim(inputNome) FROM '^([^ ]+)') || ' ' || substring(trim(inputNome) FROM '([^ ]+)$');

    RETURN nome;

END


$$ LANGUAGE PLPGSQL;

SELECT nomeSobrenome('Jheickson Felipe Sousa Santos');