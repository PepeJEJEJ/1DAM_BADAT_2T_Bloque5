USE `liga`;
select * from jugador;
select * from equipo;
select * from partido;

-- 1. Datos del jugador con el salario más cercano al salario medio de la liga.
select j.* from jugador j order by j.salario-(select avg(salario) from jugador);
-- 2. Datos de los equipos que hayan jugado algún partido en 2012 como visitantes.
select e.* from equipo e join partido p on p.visitante=e.id_equipo
where p.fecha between '2012-01-01' and '2012-12-31';
-- 3. Datos de los jugadores que pertenecen al Real Madrid y cuya altura sea mayor de 2 metros.
select * from jugador j join equipo e on j.equipo=e.id_equipo where e.nombre='Real Madrid' and altura>2.00;
-- 4. Datos de los equipos que hayan jugado partidos contra el Regal Barcelona, ya sea como local o visitante.
select * from equipo e where e.id_equipo in (select p.visitante from partido p where p.local = (select id_equipo from equipo where nombre = 'regal barcelona')
union select p.local from partido p where p.visitante = (select id_equipo from equipo where nombre = 'regal barcelona'));
-- 5. Datos de los jugadores que fueron dados de alta después del 1 de enero de 2011.
select * from jugador j where j.fecha_alta>'2011-01-01 00:00:00';
-- 6. Datos de los equipos que tengan al menos un jugador con salario superior a 100000.
select * from equipo e join jugador j on j.equipo=e.id_equipo where j.salario>100000 group by j.salario;
-- 7. Datos de los jugadores que tengan la misma altura que algún otro jugador de su mismo equipo.
select j.* from jugador j join jugador c on j.id_jugador=c.id_jugador where j.altura=c.altura group by j.equipo;
-- 8. Datos de los equipos y el número de partidos que han jugado como visitantes.
select e.*,count(p.visitante) as n_partidos_v from equipo e join partido p on e.id_equipo=p.visitante group by(p.visitante);
-- 9. Datos de los jugadores cuyo equipo tenga más puntos que el CAI Zaragoza.
select j.* from jugador j join equipo e on j.equipo=e.id_equipo where e.puntos>'CAI Zaragoza';
-- 10. Datos de los equipos que hayan jugado partidos en los que el resultado fue empate.