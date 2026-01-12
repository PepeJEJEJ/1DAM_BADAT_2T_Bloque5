Drop Database if exists biblioteca;
Create Database biblioteca;
use biblioteca;

create table Libro(
	Codigo int Primary Key auto_increment,
	Titulo varchar(30),
    Año_Publicacion date,
    Genero varchar(30)
);

create table Autor(
	ID int Primary Key auto_increment,
	Nombre varchar(30),
    Nacionalidad varchar(30)
);

create table Autor_Escribe_Libro(
    ID int,
    Codigo int,
    foreign key (ID) references Autor(ID),
    foreign key (Codigo) references Libro(Codigo)
);

create table Genero(
	Codigo int Primary Key auto_increment,
	Descripcion varchar(33),
	foreign key (Codigo) references Libro(Codigo)
);

create table Prestamo(
    Codigo int,
    foreign key (Codigo) references Libro(Codigo),
    Fecha_Toma date,
    Fecha_Prestamo date,
    Fecha_Devolucion date
);