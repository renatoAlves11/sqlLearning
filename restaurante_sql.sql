create table Cliente(
	idCliente integer /*not null opcional*/ primary key, 
	nome varchar(30) not null
);

/*
ou
create table Cliente(
	idCliente integer not null, 
	nome varchar(30) not null
	primary key(idCliente)
);
*/

create table mesa(
	idmesa integer primary key
);

create table pedido(
	idpedido integer primary key,
	dtpedido date not null,
	situacao varchar(10) not null,
	motivocancela varchar(140) /*escrever null é opcional*/,
	idcliente integer not null,
	idmesa integer not null,
	foreign key(idcliente) references cliente(idcliente)
);

/*
alterar esquema
alter table nom.tabela AÇÃO
*/

alter table pedido add foreign key(idmesa) references mesa(idmesa);

create table telcliente(
	identclient integer not null /*not null opcional pois é parte da chave primaria*/,
	numtel varchar(15) not null,
	primary key(identclient, numtel),
	foreign key(identclient) references cliente(idcliente)
);

create table itemconsumo(
	iditem integer primary key,
	nome varchar(20) not null,
	precounit real not null,
	categoria varchar(6) not null,
	descricao varchar(140)
);

create table nota(
	numeroNota integer primary key,
	dtpagamento date not null,
	idpedido integer not null,
	foreign key (idpedido) references pedido(idpedido)
);

create table pedidoitem(
	idpedido integer not null,
	iditem integer not null,
	qtd integer not null,
	primary key(idpedido, iditem),
	foreign key(idpedido) references pedido(idpedido),
	foreign key(iditem) references itemconsumo(iditem)
);

-- comando de consulta
select * from itemconsumo;

--adicionando atributo
alter table itemconsumo add infonutri varchar(40) null;
--se não tiver nenhum dado adicionado pode criar atributo como not null
--se não, atributo deve ser adicionado com null

--excluindo atributo
alter table itemconsumo drop infonutri;