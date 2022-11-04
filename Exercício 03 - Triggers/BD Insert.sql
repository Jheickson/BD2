create table usuario(
	id integer not null primary key,
	nm_login character varying,
	db_senha character varying,
	fg_bloqueado boolean,
	nu_tentativa_login integer
);

create table bkg_usuario(
	id integer not null,
	nm_login character varying,
	db_senha character varying,
	fg_bloqueado boolean,
	nu_tentativa_login integer,
	data_exclusao timestamp,
	constraint pk_bkp_usuario primary key(id)
);

insert into usuario values
(1, 'hallan', 'hallan2011', false, 0),
(2, 'maria', 'abcd1234', false, 2),
(3, 'joao', '123456', false, 0);

create or replace function backup() returns trigger as $$
begin
	insert into bkg_usuario values
	(old.id, old.nm_login, old.db_senha, old.fg_bloqueado, old.nu_tentativa_login, NOW());
	
	return new;
end
$$ language plpgsql;


create or replace trigger trigger_usuario after delete
on usuario for each row
execute procedure backup();

delete from usuario where id = 2;

select * from bkg_usuario;

create table usuario_auditoria(
	id integer not null,
	data_alteracao timestamp,
	operacao_realizada character varying
);