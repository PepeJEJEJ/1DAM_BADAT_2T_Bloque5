USE `liga`;
select * from jugador;
select * from equipo;
select * from partido;

-- 1. Muestra el nombre y apellido de los jugadores cuyo salario sea superior al salario medio de toda la liga.
select j.nombre, j.apellido, avg(j.salario) from jugador j;-- Este nunca lo logro
-- 2. Obtén los datos de los equipos que hayan jugado al menos un partido como locales y hayan ganado ese partido
--    (usa el campo resultado para determinar el ganador).
select e.*,p.resultado from partido p join equipo e on p.local = e.id_equipo where resultado>11-11;-- la parte del resultado no se como hacerlo
-- 3. Lista el nombre del jugador, su equipo y su salario, ordenados de mayor a menor salario.
select j.*,e.nombre from jugador j join equipo e on j.equipo=e.id_equipo order by salario desc;
-- 4. Muestra los datos de los jugadores que fueron dados de alta en el año 2011.
select * from jugador j where j.fecha_alta between date('2010-01-01') and ('2010-31-12');
-- 5. Obtén el nombre de los equipos que hayan jugado partidos tanto como locales como visitantes.
select e.nombre,p.* from equipo e left join partido p on p.visitante = e.id_equipo and p.local = e.id_equipo;
-- 6. Muestra el nombre del equipo y el número total de partidos que ha disputado (sumando local + visitante).
select e.id_equipo, e.nombre as p_Disputados, sum(p.local+p.visitante) from equipo e, partido p group by id_equipo;
-- 7. Lista los jugadores que tienen la misma altura que el capitán de su propio equipo.
select * from jugador j where j.id_capitan=j.id_jugador and j.altura=;
-- 8. Muestra los datos de los partidos en los que el equipo local y el visitante pertenecen a la misma ciudad.

-- 9. Obtén el nombre de los jugadores cuyo apellido empiece por la letra 'S' y cuyo salario sea mayor de 60.000.

-- 10. Muestra el nombre del equipo y la suma total de los salarios de todos sus jugadores.
