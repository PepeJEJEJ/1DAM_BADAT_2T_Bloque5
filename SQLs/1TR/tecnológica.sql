drop database if exists tecnológica;
create database tecnológica;
use tecnológica;

create table Proyectos (
codigo int primary key auto_increment,
nombre varchar (50) NOT NULL,
presupuesto decimal(10,2) check (horas >= 0 & horas <= 300) NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_fin DATE,
foreign key (id_cliente) references trabajador(id_cliente)
);

Create table Tecnico_Proyecto (
dni enum ("dni_técnico", "codigo_proyecto"),
fecha_asignacion date not null, 
fecha_cese date,
telefono varchar(15)
);