USE `liga`;
select * from jugador;
select * from equipo;
select * from partido;

-- 1. Muestra el nombre y apellido de los jugadores cuyo salario sea superior al salario medio de toda la liga.
SELECT j.nombre, j.apellido
FROM jugador j
WHERE j.salario > (SELECT AVG(salario) FROM jugador);
-- 2. Obtén los datos de los equipos que hayan jugado al menos un partido como locales y hayan ganado ese partido
--    (usa el campo resultado para determinar el ganador).
SELECT DISTINCT e.nombre
FROM partido p
JOIN equipo e ON p.local = e.id_equipo
WHERE CAST(SUBSTRING_INDEX(p.resultado,'-',1) AS UNSIGNED) >
      CAST(SUBSTRING_INDEX(p.resultado,'-',-1) AS UNSIGNED);
-- 3. Lista el nombre del jugador, su equipo y su salario, ordenados de mayor a menor salario.
select j.*,e.nombre from jugador j join equipo e on j.equipo=e.id_equipo order by salario desc;
-- 4. Muestra los datos de los jugadores que fueron dados de alta en el año 2011.
SELECT * 
FROM jugador j
WHERE j.fecha_alta BETWEEN '2011-01-01' AND '2011-12-31';
-- 5. Obtén el nombre de los equipos que hayan jugado partidos tanto como locales como visitantes.
SELECT e.nombre
FROM equipo e
WHERE EXISTS (SELECT 1 FROM partido p WHERE p.local = e.id_equipo)
  AND EXISTS (SELECT 1 FROM partido p WHERE p.visitante = e.id_equipo);
-- 6. Muestra el nombre del equipo y el número total de partidos que ha disputado (sumando local + visitante).
SELECT e.nombre, COUNT(p.id_partido) AS partidos_disputados
FROM equipo e
JOIN partido p ON e.id_equipo IN (p.local, p.visitante)
GROUP BY e.id_equipo, e.nombre;
-- 7. Lista los jugadores que tienen la misma altura que el capitán de su propio equipo.
SELECT j.nombre, j.apellido
FROM jugador j
JOIN jugador cap ON j.id_capitan = cap.id_jugador
WHERE j.altura = cap.altura;
-- 8. Muestra los datos de los partidos en los que el equipo local y el visitante pertenecen a la misma ciudad.

-- 9. Obtén el nombre de los jugadores cuyo apellido empiece por la letra 'S' y cuyo salario sea mayor de 60.000.

-- 10. Muestra el nombre del equipo y la suma total de los salarios de todos sus jugadores.