USE `liga`;
select * from jugador;
select * from equipo;
select * from partido;

-- 1. Datos del jugador con el salario más cercano al salario medio de la liga.
select j.* from jugador j where j.salario < (select avg(j.salario) from jugador j);
-- 2. Datos de los equipos que hayan jugado algún partido en 2012 como visitantes.
select e.* from equipo e join partido p on p.visitante=e.id_equipo
where p.fecha between '2012-01-01' and '2012-12-31';
-- 3. Datos de los jugadores que pertenecen al Real Madrid y cuya altura sea mayor de 2 metros.
select * from jugador j join equipo e on j.equipo=e.id_equipo and e.nombre='Real Madrid' and altura>2.00;
-- 4. Datos de los equipos que hayan jugado partidos contra el Regal Barcelona, ya sea como local o visitante.
select * from equipo e where exists (select 1 from partido p where p.local = e.id_equipo or p.visitante = e.id_equipo and e.nombre='Regal Barcelona');
-- 5. Datos de los jugadores que fueron dados de alta después del 1 de enero de 2011.
select * from jugador where fecha_alta > '2011-01-01';
-- 6. Datos de los equipos que tengan al menos un jugador con salario superior a 100000.
select e.* from jugador j join equipo e on j.equipo=e.id_equipo and j.salario>100000;
-- 7. Datos de los jugadores que tengan la misma altura que algún otro jugador de su mismo equipo.
select j.nombre,j.apellido,j.altura,a.nombre,a.apellido,j.altura from jugador j join jugador a on j.id_capitan = a.id_jugador
where j.altura = a.altura;
-- 8. Datos de los equipos y el número de partidos que han jugado como visitantes.
select *,count(p.visitante) from equipo e join partido p on p.visitante=e.id_equipo group by p.visitante;
-- 9. Datos de los jugadores cuyo equipo tenga más puntos que el CAI Zaragoza.
select * from jugador j join equipo e on j.equipo=e.id_equipo and e.puntos>'CAI Zaragoza';
-- 10. Datos de los equipos que hayan jugado partidos en los que el resultado fue empate.
