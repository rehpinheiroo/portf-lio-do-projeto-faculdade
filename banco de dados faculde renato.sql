create database db_sistema_faculdade;
use db_sistema_faculdade;

create table tbl_aluno (
id int not null primary key auto_increment,
nome varchar(45) not null,
endereco varchar(45) not null,
cpf varchar(45) not null,
data_nasc datetime,

unique index(id)
);


CREATE TABLE tbl_email (
    id int not null primary key auto_increment,
    email varchar(45) not null,
    id_aluno int not null,
    
    constraint fk_aluno_email
    foreign key (id_aluno)
    references tbl_aluno (id),
    unique index (id)
);

CREATE TABLE tbl_telefone (
    id int not null primary key auto_increment,
    telefone varchar(45) not null,
    id_aluno int not null,
    
    constraint fk_aluno_telefone
    foreign key (id_aluno)
    references tbl_aluno (id),
    unique index (id)
);

CREATE TABLE tbl_endereco (
    id int not null primary key auto_increment,
    logadouro varchar(45) not null,
    bairro varchar(45) not null,
    cep varchar(45) not null,
    estado varchar(45) not null,
    cidade varchar(45) not null,
    complemento varchar(45) not null,
    id_aluno int not null,
       
    constraint fk_aluno_endereco
    foreign key (id_aluno)
    references tbl_aluno (id),
    unique index (id)
);

create table tbl_professor (
id int not null primary key auto_increment,
email varchar(45) not null,
telefone varchar(45) not null,
nome varchar(45) not null,

unique index(id)
);

create table tbl_curso (
id int not null primary key auto_increment,
carga_horaria decimal(45) not null,
descricao varchar(45) not null,
nome varchar(45) not null,

unique index(id)
);

create table tbl_materia (
id int not null primary key auto_increment,
professor varchar(45) not null,
curso varchar(45) not null,
nome varchar(45) not null,

unique index(id)
);

create table tbl_curso_materia_ (
id int not null primary key auto_increment,
id_curso int not null,
id_materia int not null,

unique index(id)
);

create table tbl_turma (
id int not null primary key auto_increment,
professor varchar(45) not null,
curso varchar(45) not null,
materia varchar(45) not null,
id_curso int not null,
id_materia int not null,
id_professor int not null,

constraint fk_curso_turma
foreign key (id_curso)
references tbl_curso (id),

constraint fk_materia_turma
foreign key (id_materia)
references tbl_materia (id),

constraint fk_professor_turma
foreign key (id_professor)
references tbl_professor (id),

unique index (id)
);

create table tbl_nota (
id int not null primary key auto_increment,
nota float(45) not null,
turma varchar(45) not null,
materia varchar(45) not null,
aluno varchar(45) not null,
id_aluno int not null,
id_materia int not null,
id_turma int not null,

constraint fk_aluno_nota
foreign key (id_aluno)
references tbl_aluno (id),

constraint fk_materia_nota
foreign key (id_materia)
references tbl_materia (id),

constraint fk_turma_nota
foreign key (id_turma)
references tbl_turma (id),

unique index (id)
);




