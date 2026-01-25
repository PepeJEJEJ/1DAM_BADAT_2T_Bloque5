USE `liga`;
select * from jugador;
select * from equipo;
select * from partido;
-- Estos ejercicios (salvo el 3) estan mal y he de estudiarlos:
-- 1. Muestra el nombre y apellido de los jugadores cuyo salario sea superior al salario medio de toda la liga.
SELECT j.nombre, j.apellido
FROM jugador j
WHERE j.salario > (SELECT AVG(salario) FROM jugador); -- SUBCONSULTA
-- 2. Obtén los datos de los equipos que hayan jugado al menos un partido como locales y hayan ganado ese partido
--    (usa el campo resultado para determinar el ganador).
SELECT DISTINCT e.nombre
FROM partido p
JOIN equipo e ON p.local = e.id_equipo
WHERE LEFT(p.resultado, LOCATE('-', p.resultado) - 1) > -- BUSCA COSAS DENTRO DE UN TEXTO
      RIGHT(p.resultado, LENGTH(p.resultado) - LOCATE('-', p.resultado)); -- LENGTH es PA LA LONGITUD DEL TEXTO 
-- 3. Lista el nombre del jugador, su equipo y su salario, ordenados de mayor a menor salario.
select j.*,e.nombre from jugador j join equipo e on j.equipo=e.id_equipo order by salario desc; -- Ta Bien
-- 4. Muestra los datos de los jugadores que fueron dados de alta en el año 2011.
SELECT * 
FROM jugador j
WHERE j.fecha_alta BETWEEN '2011-01-01' AND '2011-12-31'; -- BETWEEN ES COMPARAR VALORES DENTRO DE UN RANGO (A y B)
-- 5. Obtén el nombre de los equipos que hayan jugado partidos tanto como locales como visitantes.
SELECT e.nombre
FROM equipo e
WHERE EXISTS (SELECT 1 FROM partido p WHERE p.local = e.id_equipo) -- EXISTS DEVUELVE UN BOOLEANO (V. O F.)
  AND EXISTS (SELECT 1 FROM partido p WHERE p.visitante = e.id_equipo);
-- 6. Muestra el nombre del equipo y el número total de partidos que ha disputado (sumando local + visitante).
SELECT e.nombre, COUNT(p.id_partido) AS partidos_disputados -- Contamos los IDs de los partidos
FROM equipo e
JOIN partido p ON e.id_equipo IN (p.local, p.visitante)
GROUP BY e.id_equipo, e.nombre;
-- 7. Lista los jugadores que tienen la misma altura que el capitán de su propio equipo.
SELECT j.nombre, j.apellido
FROM jugador j
JOIN jugador cap ON j.id_capitan = cap.id_jugador
WHERE j.altura = cap.altura; -- Si HAY QUE UNIR CAMPOS DE UNA MISMA TABLA, HAY QUE USAR LA MISMA TABLA PERO CON DISTINTO "MOTE"
-- 8. Muestra los datos de los partidos en los que el equipo local y el visitante pertenecen a la misma ciudad.
SELECT p.*
FROM partido p
JOIN equipo e1 ON p.local = e1.id_equipo
JOIN equipo e2 ON p.visitante = e2.id_equipo
WHERE e1.ciudad = e2.ciudad; -- Aqui, tras seleccionar locales y visitantes, los elegimos si son de la misma ciudad (en equipos)
-- 9. Obtén el nombre de los jugadores cuyo apellido empiece por la letra 'S' y cuyo salario sea mayor de 60.000.
SELECT nombre, apellido
FROM jugador
WHERE apellido LIKE 'S%' -- ESTO ES PARA BUSCAR ALGO SI EMPIEZA POR UNA LETRA (Aqui, es la "S")
  AND salario > 60000;
-- 10. Muestra el nombre del equipo y la suma total de los salarios de todos sus jugadores.
SELECT e.nombre AS equipo, SUM(j.salario) AS total_salarios -- AQUI SUMAMOS TODOS LOS SALARIOS DE LOS JUGADORES
FROM equipo e
LEFT JOIN jugador j ON e.id_equipo = j.equipo
GROUP BY e.id_equipo, e.nombre;

-- fallos:
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
select * from jugador j where j.id_capitan=j.id_jugador;
-- 8. Muestra los datos de los partidos en los que el equipo local y el visitante pertenecen a la misma ciudad.
select e.* from equipo e where e.ciudad=e.ciudad;
-- 9. Obtén el nombre de los jugadores cuyo apellido empiece por la letra 'S' y cuyo salario sea mayor de 60.000.

-- 10. Muestra el nombre del equipo y la suma total de los salarios de todos sus jugadores.