drop database if exists ETienda;
create database ETienda;
use ETienda;

create table producto(
codigo int Primary Key auto_increment,
nombre varchar (100),
tipo varchar (100),
precio int,
stock int
);

create table clientes(
NIF int Primary Key auto_increment,
nombre varchar (100),
dirección varchar (100),
email varchar (100)
);

create table compra(
id_compra int primary key auto_increment,
NIF int,
fecha date,
foreign key (NIF) references clientes(NIF)
);

create table detalle_compra(
id_compra int,
codigo int,
cantidad int,
foreign key (id_compra) references compra(id_compra),
foreign key (codigo) references producto(codigo)
);