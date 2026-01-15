use `liga`;

-- 1. Datos del jugador más alto de la liga.
select * from jugador where altura = (select max(altura) from jugador);

-- 2. Datos de todos los jugadores que pertenecen al Caja Laboral.
select j.* from jugador j join equipo e on j.equipo = e.id_equipo where e.nombre = 'Caja Laboral';

-- 3. Suma de las alturas de los jugadores que sean del CAI Zaragoza o del Real Madrid.
select sum(j.altura) from jugador j join equipo e on j.equipo = e.id_equipo where e.nombre in ('CAI Zaragoza','Real Madrid');

-- 4. Datos de los jugadores que miden más que todos los jugadores del Caja Laboral.
select * from jugador j where j.altura > (select max(j2.altura) from jugador j2 join equipo e2 on j2.equipo = e2.id_equipo where e2.nombre = 'Caja Laboral');

-- 5. Datos de los jugadores mejor pagado y peor pagado de la liga.
select * from jugador where salario in ((select max(salario) from jugador),(select min(salario) from jugador where salario is not null));

-- 6. Datos del jugador más antiguo.
select * from jugador where fecha_alta = (select min(fecha_alta) from jugador where fecha_alta is not null);

-- 7. Datos de los equipos que tienen más de tres jugadores registrados.
select e.* from equipo e join jugador j on j.equipo = e.id_equipo group by e.id_equipo having count(j.id_jugador) > 3;

-- 8. Nombre del jugador, nombre del equipo y su posición.
select j.nombre, e.nombre, j.posicion from jugador j join equipo e on j.equipo = e.id_equipo;

-- 9. Nombre de cada equipo y el nombre de su capitán o capitanes.
select e.nombre, c.nombre from equipo e join jugador c on c.equipo = e.id_equipo and c.id_jugador = c.id_capitan;

-- 10. Datos de los equipos y el número de partidos que han jugado como locales.
select e.*, count(p.id_partido) from equipo e left join partido p on e.id_equipo = p.local group by e.id_equipo;

-- 11. Datos de los jugadores cuyos equipos hayan jugado al menos tres partidos como visitantes.
select j.* from jugador j where j.equipo in (select p.visitante from partido p group by p.visitante having count(*) >= 3);

-- 12. Datos de los equipos y el salario máximo de sus jugadores.
select e.*, max(j.salario) from equipo e left join jugador j on j.equipo = e.id_equipo group by e.id_equipo;

-- 13. Datos de los equipos que hayan jugado algún partido contra el Valencia en casa.
select distinct e.* from equipo e join partido p on e.id_equipo = p.local where p.visitante = (select id_equipo from equipo where nombre = 'P.E. Valencia');

-- 14. Datos de los jugadores de equipos que hayan jugado algún partido contra el Valencia en casa.
select j.* from jugador j where j.equipo in (select p.local from partido p where p.visitante = (select id_equipo from equipo where nombre = 'P.E. Valencia'));

-- 15. Datos de los equipos que no tienen ningún jugador registrado.
select e.* from equipo e left join jugador j on j.equipo = e.id_equipo where j.equipo is null;

-- 16. Salario medio de los jugadores de cada equipo.
select e.nombre, avg(j.salario) from equipo e left join jugador j on j.equipo = e.id_equipo group by e.id_equipo, e.nombre;

-- 17. Datos de los jugadores que cobran más que la media salarial de su equipo.
select j.* from jugador j where j.salario > (select avg(j2.salario) from jugador j2 where j2.equipo = j.equipo);
