Drop Database if exists laboratorio;
Create Database laboratorio;
use laboratorio;

create table Compuesto (
	Codigo_C int primary key,
    nombre varchar(33),
	formula varchar(33),
    categoria enum('orgánico','inorgánico'),
    nivel_toxicidad varchar(33) 
);

create table Reactivos (
	Codigo_R int primary key,
    nombre varchar(33),
	estado_fisico varchar(33),
    proveedor varchar(33) 
);

create table Investigador (
	ID int primary key,
    nombre varchar(33),
	especialidad varchar(33)
);

create table Compuesto_Usa_Reactivos (
	Codigo_C int,
    Codigo_R int,
    ID int,
    cantidad_usada int,
    fecha_sintesis date,
    foreign key (ID) references Investigador (ID),
	foreign key (Codigo_C) references Compuesto (Codigo_C),
    foreign key (Codigo_R) references Reactivos (Codigo_R)
);