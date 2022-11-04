create table usuario_auditoria(

	id serial primary key,
	data_alteracao timestamp,
	operacao_realizada character varying

);

create or replace function logChanges()
returns trigger as $$

begin

    if (TG_OP = 'DELETE') then
        insert into usuario_auditoria (data_alteracao, operacao_realizada)
            values (current_timestamp, 'VALOR DELETADO');
    return new;
    end if;

    if (TG_OP = 'UPDATE') then
        insert into usuario_auditoria (data_alteracao, operacao_realizada)
            values (current_timestamp, 'VALOR ATUALIZADO');
    return new;
    end if;

    if (TG_OP = 'INSERT') then
        insert into usuario_auditoria (data_alteracao, operacao_realizada)
            values (current_timestamp, 'VALOR INSERIDO');
    return new;
    end if;

end;

$$ language plpgsql;

create or replace trigger trigger_logChanges
after delete or update or insert
on usuario for each row
execute procedure logChanges();