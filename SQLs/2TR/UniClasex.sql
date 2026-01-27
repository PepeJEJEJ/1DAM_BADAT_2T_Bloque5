USE universidad;

-- 1. obtener la alumna con mayor edad
select *
from persona
where tipo = 'alumno'
order by fecha_nacimiento
limit 1;

-- 2. datos de la asignatura cuyo id sea el mayor
select *
from asignatura
where id = (select max(id) from asignatura);

-- 3. nombre de la asignatura y nombre de su grado asociado
select a.nombre as asignatura, g.nombre as grado
from asignatura a
inner join grado g on a.id_grado = g.id;

-- 4. nombre de todas las asignaturas, su grado, y nombre y apellidos del profesor
select a.nombre as asignatura,
       g.nombre as grado,
       p.nombre as profesor_nombre,
       p.apellido1,
       p.apellido2
from asignatura a
inner join grado g on a.id_grado = g.id
left join profesor pr on a.id_profesor = pr.id_profesor
left join persona p on pr.id_profesor = p.id;

-- 5. nombre y apellidos de los profesores con su departamento
select pe.nombre, pe.apellido1, pe.apellido2, d.nombre as departamento
from profesor pr
inner join persona pe on pr.id_profesor = pe.id
inner join departamento d on pr.id_departamento = d.id;

-- 6. número de asignaturas que imparte cada profesor
select pe.nombre, pe.apellido1, pe.apellido2, count(a.id) as num_asignaturas
from profesor pr
inner join persona pe on pr.id_profesor = pe.id
left join asignatura a on a.id_profesor = pr.id_profesor
group by pe.id, pe.nombre, pe.apellido1, pe.apellido2;

-- 7. datos de todos los grados, tengan o no asignaturas
select g.*
from grado g
left join asignatura a on a.id_grado = g.id
group by g.id;

-- 8. datos de todas las asignaturas, tengan o no profesor
select a.*
from asignatura a
left join profesor pr on a.id_profesor = pr.id_profesor;

-- 9. datos de los profesores que imparten alguna asignatura
select distinct pe.*
from profesor pr
inner join persona pe on pr.id_profesor = pe.id
inner join asignatura a on a.id_profesor = pr.id_profesor;

-- 10. cantidad de créditos que imparte cada profesor según su nif
select pe.nif, pe.nombre, pe.apellido1, pe.apellido2, sum(a.creditos) as creditos_totales
from profesor pr
inner join persona pe on pr.id_profesor = pe.id
inner join asignatura a on a.id_profesor = pr.id_profesor
group by pe.nif, pe.nombre, pe.apellido1, pe.apellido2;

-- 11. asignaturas que tienen más créditos que todas las demás
select *
from asignatura
where creditos = (select max(creditos) from asignatura);

-- 12. asignaturas con menos créditos
select *
from asignatura
where creditos = (select min(creditos) from asignatura);

-- 13. suma de créditos por cada grado
select g.id, g.nombre, sum(a.creditos) as creditos_totales
from grado g
left join asignatura a on a.id_grado = g.id
group by g.id, g.nombre;

-- 14. asignaturas que pertenecen al mismo grado que "bases de datos"
select *
from asignatura
where id_grado = (
    select id_grado
    from asignatura
    where nombre = 'bases de datos'
);

-- nombre de las asignaturas que no son las que menos créditos tienen
select nombre
from asignatura
where creditos > (
    select min(creditos)
    from asignatura
);

-- nombre de las asignaturas que no son las que más créditos tienen
select nombre
from asignatura
where creditos < (
    select max(creditos)
    from asignatura
);
