USE `liga`;
select * from jugador;
select * from equipo;
select * from partido;

-- 1. Datos del jugador con el salario más cercano al salario medio de la liga.
select j.* from jugador j where j.salario < (select avg(j.salario) from jugador j);
-- 2. Datos de los equipos que hayan jugado algún partido en 2012 como visitantes.
select e.* from equipo e where 
-- 3. Datos de los jugadores que pertenecen al Real Madrid y cuya altura sea mayor de 2 metros.

-- 4. Datos de los equipos que hayan jugado partidos contra el Regal Barcelona, ya sea como local o visitante.

-- 5. Datos de los jugadores que fueron dados de alta después del 1 de enero de 2011.

-- 6. Datos de los equipos que tengan al menos un jugador con salario superior a 100000.

-- 7. Datos de los jugadores que tengan la misma altura que algún otro jugador de su mismo equipo.

-- 8. Datos de los equipos y el número de partidos que han jugado como visitantes.

-- 9. Datos de los jugadores cuyo equipo tenga más puntos que el CAI Zaragoza.

-- 10. Datos de los equipos que hayan jugado partidos en los que el resultado fue empate.
