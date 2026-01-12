Drop Database if exists streaming;
Create Database streaming;
use streaming;

create table Usuario(
id int Primary Key auto_increment,
nombre varchar(20),
apellidos varchar(20),
e_mail varchar(30) not null,
contraseña int,
tipo_usuario ENUM('Free', 'Premium'),
telefono varchar(20),
fecha_renovacion date
);

create table Video(
id int Primary Key auto_increment,
titulo varchar(20),
trama varchar(150),
duracion int,
enlace varchar(150),
archivo varchar(150),
tipo_usuario ENUM('Peli', 'Episodio')
);

create table Pelicula(
puntuacion int,
director varchar(150)
);

create table Episodio(
n_episodio int,
temporada varchar(150),
foreign key (Video) references Video (tipo_usuario)
);

create table Serie(
id int Primary Key auto_increment,
nombre varchar(150)
);

create table Genero(
id int Primary Key auto_increment,
nombre varchar(150)
);

create table visualizaciones (
    id_usuario int,
    id_video int,
    fecha_visualizacion date,
    hora_visualizacion time,
    primary key (id_usuario, id_video, fecha_visualizacion, hora_visualizacion),
    foreign key (id_usuario) references usuario(id),
    foreign key (id_video) references video(id)
);