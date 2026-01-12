drop database if exists universidad;
create database universidad;
use universidad;

create table facultad(
codigo int primary key not null,
nombre varchar(33),
direccion varchar(11)
);

create table carreras(
codigo int primary key not null,
nombre varchar(33),
años_duracion int
);

create table alumnos(
dni int primary key not null,
nombre varchar(33),
apellidos varchar(33),
notas int,
fecha_ingreso date
);

create table asignaturas(
codigo int,
nombre varchar(100),
creditos int,
foreign key (codigo) references carreras(codigo)
);

create table profesores(
codigo int,
NIF int primary key not null,
nombre varchar(33),
categoria varchar(33),
foreign key (codigo) references asignaturas(codigo)
);