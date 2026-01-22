USE `universidad`;

-- 1 Obtener la alumna con mayor edad.
select * from persona where fecha_nacimiento = (select min(fecha_nacimiento) where sexo='M' and tipo='alumno');
-- 2 Mostrar los datos de la asignatura cuyo id sea el mayor.
select * from asignatura where id = (select max(id) from asignatura);
-- 3 Mostrar el nombre de la asignatura y el nombre de su grado asociado.

-- 4 Mostrar el nombre de todas las asignaturas, el nombre de su grado, y el nombre y apellidos del profesor asociado (incluyendo asignaturas sin profesor si las hubiera).

-- 5 Mostrar el nombre y apellidos de los profesores y el nombre de su departamento.

