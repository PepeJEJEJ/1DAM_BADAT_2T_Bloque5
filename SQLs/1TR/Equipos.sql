Drop Database if exists Equipos;
Create Database Equipos;
use Equipos;

create table Componente(
	Codigo int Primary Key,
    nombre varchar (20),
    tipo int,
    precio int,
	categoria varchar(22)
);

create table Proveedor(
	Codigo int Primary Key,
    direccion varchar (44),
    ciudad varchar (44),
	provincia varchar(22)
);

create table Equipo(
	ID int Primary Key,
    nombre varchar (44),
    descripción varchar (44),
	precio_total int
);

create table Suministro (
    Codigo_Proveedor int,
    Codigo_Componente int,
    fecha date,
    cantidad int,
    primary key (Codigo_Proveedor, Codigo_Componente, fecha),
    foreign key (Codigo_Proveedor) references Proveedor(Codigo),
    foreign key (Codigo_Componente) references Componente(Codigo)
);

create table Componente_Equipo (
    ID_Equipo int,
    Codigo_Componente int,
    cantidad int,
    primary key (ID_Equipo, Codigo_Componente),
    foreign key(ID_Equipo) references Equipo(ID),
    foreign key (Codigo_Componente) references Componente(Codigo)
);