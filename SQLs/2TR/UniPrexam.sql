USE universidad;

-- 1. Obtén el nombre y apellidos de todos los profesores junto con el nombre de su departamento.
select p.nombre,p.apellido1,p.apellido2,d.nombre from persona p 
left join profesor pr on pr.id_profesor=p.id
left join departamento d on pr.id_profesor=d.id;
-- 2. Muestra todas las asignaturas y, si tienen profesor asignado, el nombre del profesor.
select a.*,p.nombre from asignatura a
join profesor pr on a.id_profesor=pr.id_profesor
join persona p on p.id=pr.id_profesor;
-- 3. Obtén los datos del alumno más joven de toda la base de datos.
select id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, max(fecha_nacimiento), sexo, tipo from persona p;
-- 4. Muestra los nombres de los alumnos matriculados en asignaturas del grado "Grado en Ingeniería Informática (Plan 2015)".
select p.nombre, p.apellido1, p.apellido2,g.nombre as grado from persona p
join alumno_se_matricula_asignatura m on m.id_alumno=p.id
join asignatura a on m.id_asignatura=a.id
join grado g on a.id_grado=g.id where g.nombre='Grado en Ingeniería Informática (Plan 2015)';
-- 5. Muestra los profesores que imparten al menos una asignatura.
select p.* from persona p 
join profesor pr on p.id=pr.id_profesor
join asignatura a on pr.id_profesor=a.id_profesor;
-- 6. Obtén los grados que tengan más de 10 asignaturas asociadas.

-- 7. Muestra el nombre del alumno, el nombre de la asignatura y el año académico en el que está matriculado.

-- 8. Obtén los alumnos cuya fecha de nacimiento sea anterior a todas las fechas de nacimiento de los profesores.

-- 9. Devuelve una lista con todos los nombres de personas que sean alumnos o profesores, sin duplicados.

-- 10. Muestra los alumnos que estén matriculados en más asignaturas que el alumno con id = 1.
