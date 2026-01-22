USE `universidad`;

-- 1 Obtener la alumna con mayor edad.
select * from persona where fecha_nacimiento = (select min(fecha_nacimiento) where sexo='M' and tipo='alumno');

-- 2 Mostrar los datos de la asignatura cuyo id sea el mayor.
select * from asignatura where id = (select max(id) from asignatura);

-- 3 Mostrar el nombre de la asignatura y el nombre de su grado asociado.
select a.nombre, g.nombre from asignatura a join grado g on a.id_grado = g.id;

-- 4 Mostrar el nombre de todas las asignaturas, el nombre de su grado, y el nombre y apellidos del profesor asociado (incluyendo asignaturas sin profesor si las hubiera).
select a.nombre,g.nombre,p.nombre,p.apellido1,p.apellido2
from asignatura a
left join grado g on a.id_grado = g.id
left join profesor pr on a.id_profesor = pr.id_profesor
left join persona p on pr.id_profesor = p.id;

-- 5 Mostrar el nombre y apellidos de los profesores y el nombre de su departamento.
select pe.nombre, pe.apellido1,pe.apellido2,d.nombre from profesor pr
join persona pe on pr.id_profesor = pe.id
join departamento d on pr.id_departamento = d.id;

-- 6 Número de asignaturas que imparte cada profesor
select *,count()