drop database if exists Transporte;
create database Transporte;
use Transporte;

create table vehículos(
matricula int primary key,
modelo varchar(20),
capacidad int,
año_compra int
);

create table conductores(
DNI int primary key,
nombre varchar(33),
licencia int,
fecha_contratacion date
);

create table clientes(
CIF int primary key,
nombre varchar(33),
direccion varchar(33),
telefono int
);

create table envios(
codigo int primary key,
DNI int,
matricula int,
fecha date,
origen varchar(33),
destino varchar(33),
foreign key (DNI) references conductores(DNI),
foreign key (matricula) references vehículos(matricula),
coste int
);

create table incidencias(
codigo int,
id int primary key,
descripción varchar(33),
foreign key (codigo) references envios(codigo),
fecha date
);