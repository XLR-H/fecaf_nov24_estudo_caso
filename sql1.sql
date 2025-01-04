#create database db_smgozzo;
#use db_smgozzo;

/* esqueci de por 'not null' nos campos, por isso tem alter table em baixo!
create table tbl_cliente (
	id int primary key not null auto_increment,
    nome varchar(100),
    cpf varchar(12),
    email varchar(100),
    telefone varchar(12),
    status tinyint(0)
);

alter table tbl_cliente 
	modify nome varchar(100) not null,
    modify cpf varchar(12) not null,
    modify email varchar(100) not null,
    modify telefone varchar(13) not null,
    modify status tinyint(0) not null;

#mudei telefone pra 13 
alter table tbl_cliente modify telefone varchar(13) not null;
*/

#descreve a tabela para conferir as colunas 
describe tbl_cliente;

#populando a tabela
insert into tbl_cliente (nome, cpf, email, telefone, status) values (
	'Carol', '361769378-41', 'kakangelgirl@hotmail.com','19-99265-4775',0
);

#conferindo os dados
select * from tbl_cliente;

#tudo OK, vou agora criar todas as outras tabelas

create table tbl_endereco (
	id int not null primary key auto_increment,
    logradouro varchar(100) not null,
    cep varchar(10) not null,
    bairro varchar(100) not null,
    cidade varchar(100) not null,
    id_cliente int not null,
    
    constraint FK_Cliente_Endereco
    foreign key (id_cliente)
    references tbl_cliente (id),
    
    unique index(id)
);

create table tbl_produto (
	id int not null primary key auto_increment,
    descricao varchar(100) not null,
    cod_barra varchar(13) not null,
    p_custo float not null,
    p_venda float not null,
    estoque int not null,
    unique index(id)
);

create table tbl_forma_pag (
	id int not null primary key auto_increment,
    finalizadora varchar(10) not null
);

create table tbl_funcionario (
	id int not null primary key auto_increment,
    nome varchar(100)
);

create table tbl_pedido (
	id int not null primary key auto_increment,
    valor float not null,
    emissao date not null,
    id_cliente int not null,
    id_funcionario int not null,
    id_forma_pag int not null,
    
    constraint FK_Pedido_Cliente foreign key (id_cliente) references tbl_cliente (id),
    constraint FK_Pedido_Funcionario foreign key (id_funcionario) references tbl_funcionario (id),
    constraint FK_Pedido_Forma_Pag foreign key (id_forma_pag) references tbl_forma_pag (id),
    
    unique index (id)
);

create table tbl_pedido_produto (
	id int not null primary key auto_increment,
    id_produto int not null,
    id_pedido int not null,
    
    #CRIA O RELACIONAMENTO ENTRE AS TABELAS
	constraint FK_Produto_Pedido_Produto foreign key (id_produto) references tbl_produto(id),
    constraint FK_Pedido_Pedido_Produto foreign key (id_pedido) references tbl_pedido(id),
        
    unique index (id)
);

#SE VC SALVAR E SAIR, E VOLTAR DEPOIS, TEM QUE DAR USE DB_SMGOZZO DE NOVO, PRA USAR O BANCO
use db_smgozzo;
show tables;

#É ISSO, POR HOJE É SÓ PE-PE-PESSOAL