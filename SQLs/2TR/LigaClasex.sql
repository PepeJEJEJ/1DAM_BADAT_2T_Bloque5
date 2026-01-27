use liga;

-- 1. datos del jugador más alto de la liga
select *
from jugador
where altura = (
    select max(altura)
    from jugador
);

-- 2. datos de todos los jugadores que pertenecen al caja laboral
select j.*
from jugador j
inner join equipo e on j.equipo = e.id_equipo
where e.nombre = 'caja laboral';

-- 3. suma de las alturas de los jugadores del cai zaragoza o del real madrid
select sum(j.altura) as suma_alturas
from jugador j
inner join equipo e on j.equipo = e.id_equipo
where e.nombre in ('cai zaragoza', 'real madrid');

-- 4. jugadores que miden más que todos los jugadores del caja laboral
select *
from jugador j
where j.altura > all (
    select j2.altura
    from jugador j2
    inner join equipo e2 on j2.equipo = e2.id_equipo
    where e2.nombre = 'caja laboral'
);

-- 5. jugadores mejor pagado y peor pagado
select *
from jugador
where salario in (
    select max(salario) from jugador
    union
    select min(salario) from jugador
);

-- 6. jugador más antiguo (fecha_alta más antigua)
select *
from jugador
where fecha_alta = (
    select min(fecha_alta)
    from jugador
    where fecha_alta is not null
);

-- 7. equipos con más de tres jugadores
select e.*
from equipo e
inner join jugador j on j.equipo = e.id_equipo
group by e.id_equipo, e.nombre, e.ciudad, e.web, e.puntos
having count(j.id_jugador) > 3;

-- 8. nombre del jugador, nombre del equipo y posición
select j.nombre as nombre_jugador,
       e.nombre as nombre_equipo,
       j.posicion
from jugador j
inner join equipo e on j.equipo = e.id_equipo;

-- 9. nombre de cada equipo y nombre de su capitán
select e.nombre as nombre_equipo,
       j.nombre as nombre_capitan,
       j.apellido as apellido_capitan
from equipo e
inner join jugador j
    on j.equipo = e.id_equipo
   and j.id_jugador = j.id_capitan;

-- 10. equipos y número de partidos jugados como locales
select e.*,
       count(p.id_partido) as partidos_local
from equipo e
left join partido p on p.local = e.id_equipo
group by e.id_equipo, e.nombre, e.ciudad, e.web, e.puntos;

-- 11. jugadores cuyos equipos hayan jugado al menos tres partidos como visitantes
select j.*
from jugador j
where j.equipo in (
    select e.id_equipo
    from equipo e
    inner join partido p on p.visitante = e.id_equipo
    group by e.id_equipo
    having count(p.id_partido) >= 3
);

-- 12. equipos y salario máximo de sus jugadores
select e.nombre as nombre_equipo,
       e.id_equipo,
       max(j.salario) as salario_maximo
from equipo e
left join jugador j on j.equipo = e.id_equipo
group by e.id_equipo, e.nombre;

-- 13. equipos que hayan jugado algún partido contra el valencia en casa
select distinct e.*
from equipo e
inner join partido p on p.local = e.id_equipo
inner join equipo ev on p.visitante = ev.id_equipo
where ev.nombre = 'p.e. valencia';

-- 14. jugadores de equipos que hayan jugado algún partido contra el valencia en casa
select distinct j.*
from jugador j
inner join equipo e on j.equipo = e.id_equipo
where e.id_equipo in (
    select p.local
    from partido p
    inner join equipo ev on p.visitante = ev.id_equipo
    where ev.nombre = 'p.e. valencia'
);

-- 15. equipos que no tienen ningún jugador registrado
select e.*
from equipo e
left join jugador j on j.equipo = e.id_equipo
where j.id_jugador is null;

-- 16. salario medio de los jugadores de cada equipo
select e.nombre as nombre_equipo,
       e.id_equipo,
       avg(j.salario) as salario_medio
from equipo e
left join jugador j on j.equipo = e.id_equipo
group by e.id_equipo, e.nombre;

-- 17. jugadores que cobran más que la media salarial de su equipo
select j.*
from jugador j
where j.salario > (
    select avg(j2.salario)
    from jugador j2
    where j2.equipo = j.equipo
);
 -- un IN saca TODO LO DE UNA SUBCONSULTA