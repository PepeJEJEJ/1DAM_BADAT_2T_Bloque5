drop database if exists Hospitales;
create database Hospitales;
use Hospitales;

create table hospital(
codigo int primary key,
nombre varchar(20),
ciudad varchar(20),
num_camas int
);

create table médicos(
codigo int,
dni int primary key,
nombre varchar(20),
especialidad varchar(20),
telefono int,
foreign key (codigo) references hospital(codigo)
);

create table pacientes(
nif int primary key,
nombre varchar(20),
direccion varchar(20),
sociedad_medica varchar(11)
);

create table tratamientos(
codigo int primary key,
nombre varchar(20),
coste int
);

create table consultas(
nif int,
codigo int,
dni int,
fecha date,
hora varchar(20),
diagnostico varchar(20),
foreign key (codigo) references hospital(codigo),
foreign key (dni) references médicos(dni),
foreign key (nif) references pacientes(nif)
);