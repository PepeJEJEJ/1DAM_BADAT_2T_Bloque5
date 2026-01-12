drop database if exists Cursos;
create database Cursos;
use Cursos;

create table cursos(
codigo int primary key,
titulo varchar(20),
duracion varchar(20),
precio decimal
);

create table usuarios(
id int primary key,
nombre varchar(20),
correo varchar(20),
tipo_cuenta enum('Gratis','Premium')
);

create table usuarios_reciben_cursos(
codigo int,
id int,
foreign key (codigo) references cursos(codigo),
foreign key (id) references usuarios(id)
);

create table modulos(
codigo int,
foreign key (codigo) references cursos(codigo),
id int primary key, 
título varchar(33), 
horas int
);

create table profesores(
NIF int primary key, 
nombre varchar(20),
especialidad varchar(20)
);

create table evaluaciones(
NIF int primary key,
id int,
curso varchar(20),
nota int(10),
fecha date,
foreign key (id) references usuarios(id)
);