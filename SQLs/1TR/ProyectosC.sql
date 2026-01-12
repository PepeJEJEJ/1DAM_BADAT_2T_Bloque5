Drop Database if exists ProyectosC;
Create Database ProyectosC;
use ProyectosC;

create table Proyectos (
	Codigo int primary key,
    nombre varchar(33),
	F_inicio date,
	F_fin date,
    presupuesto int,
    ciudad varchar(33) 
);

create table Materiales (
	Codigo int primary key,
    nombre varchar(33),
	tipo varchar(33),
    precio int,
	foreign key (Codigo) references Proyectos (Codigo)
);

create table Proveedor (
    ID int primary key,
	Nombre varchar(33)
);

create table Proveedor_Suministra_Materiales (  
    ID int,
    Codigo int,
    F_Compra date not null,
    cantidad int not null,
    foreign key (ID) references Proveedor (ID),
    foreign key (Codigo) references Materiales (Codigo)
);

/*Un proveedor puede suministrar varios materiales, y un material puede ser suministrado por varios proveedores en distintas fechas y cantidades.
Cada proyecto utiliza varios materiales, y se debe registrar la cantidad de cada material usado en cada proyecto, junto con la fecha de entrega.*/