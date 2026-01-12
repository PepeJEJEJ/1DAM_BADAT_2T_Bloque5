Drop Database if exists Clases;
Create Database Clases;
use Clases;

create table Estudiante(
	N_Matricula int Primary Key auto_increment,
	Nombre varchar(30),
    F_Nac date,
    Email varchar(30)
);

create table Profesor(
	Codigo_Profe int Primary Key auto_increment,
	Nombre varchar(30),
    Especialidad varchar(30),
    Dpto varchar(30)
);

create table Dpto(
	Codigo_Dpto int Primary Key auto_increment,
	Nombre varchar(30),
    Ubicacion varchar(30)
);

create table Asignaturas(
	Codigo_Asignatura int Primary Key auto_increment,
	Nombre varchar(30),
    Creditos varchar(30)
);

create table Profe_Imparte_Asignaturas(
	Codigo_Profe int,
    Codigo_Asignatura int,
	foreign key (Codigo_Profe) references Profesor(Codigo_Profe),
	foreign key (Codigo_Asignatura) references Asignaturas(Codigo_Asignatura)
);

create table Matricula(
	N_Matricula int,
    Codigo_Asignatura int,
	foreign key (N_Matricula) references Estudiante(N_Matricula),
	foreign key (Codigo_Asignatura) references Asignaturas(Codigo_Asignatura),
	Semestre varchar(30),
    Nota_Obtenida int
);