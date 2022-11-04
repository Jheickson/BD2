create or replace function validatePswd()
returns trigger as $$

begin

    if (new.db_senha !~ '^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$') then
        raise exception 'A senha deve conter, no mínimo, uma letra minúscula, uma maiúscula, um número, um caractere especial e comprimento de no mínimo 8 caraceres.';
    end if;

return new;

end;

$$ language plpgsql;

create or replace trigger trigger_validatePswd
before insert or update
on usuario for each row
execute procedure validatePswd();