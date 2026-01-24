USE `universidad`;

select * from persona ;
select * from asignatura ;
select * from profesor ;
select * from departamento ;
select * from grado ;
select * from curso_escolar;
select * from alumno_se_matricula_asignatura;

-- 1. Obtén el nombre y apellidos de la alumna más joven registrada en la tabla persona.
select id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, min(fecha_nacimiento), sexo, tipo from persona where sexo='M' and tipo='alumno';
-- 2. Muestra el nombre y apellidos de los profesores que no tienen asignaturas asignadas.
select p.nombre, p.apellido1, p.apellido2, a.id_profesor from persona p left join asignatura a on p.id=a.id_profesor where a.id_profesor is null;
-- 3. Lista el nombre de cada asignatura junto con el número de alumnos matriculados en ella.
select a.nombre,count(m.id_alumno) as alumnos_matriculados from asignatura a join alumno_se_matricula_asignatura m on m.id_asignatura=a.id group by a.nombre;
-- 4. Muestra el nombre de las asignaturas y el nombre del grado al que pertenecen, pero solo aquellas que tengan más de 6 créditos.
select a.nombre, a.id_grado from asignatura a join grado g on g.id=a.id_grado where a.creditos>6;
-- 5. Obtén el nombre completo del profesor y el nombre del departamento al que pertenece.
select p.nombre, p.apellido1, p.apellido2, d.nombre from persona p, profesor pr
right join departamento d on pr.id_profesor=d.id; -- ESCRIBIR BIEN RIGHT (EN TERMINOS DE ORTOGRAFIA)
-- 6. Muestra los grados que no tienen ninguna asignatura asociada.
select g.* from grado g left join asignatura a on g.id=a.id_grado where a.id is null;
-- 7. Obtén el nombre y apellidos de cada alumno junto con el nombre de las asignaturas en las que está matriculado.
select p.nombre, p.apellido1, p.apellido2, a.nombre from persona p, asignatura a join alumno_se_matricula_asignatura m on m.id_alumno=m.id_asignatura where p.tipo='alumno';
-- 8. Muestra el nombre completo de los profesores y el número de asignaturas que imparten.
select p.nombre, p.apellido1, p.apellido2,count(a.id_profesor) as n_asignaturas from persona p join asignatura a on p.id=a.id_profesor group by a.id_profesor;
-- 9. Lista el nombre de la asignatura, el nombre del grado y el nombre completo del profesor responsable.

-- 10. Obtén los nombres y apellidos de los alumnos que se matricularon en el curso escolar 2018/2019.

-- 11. Muestra todas las asignaturas que no tienen profesor asignado.

-- 12. Obtén el nombre de los departamentos y el número de profesores que pertenecen a cada uno.

-- 13. Lista los alumnos junto con el curso escolar en el que se matricularon y las asignaturas correspondientes.

-- 14. Muestra el nombre de los grados y el número total de asignaturas que tienen asociadas.

-- 15. Obtén el nombre y apellidos de los profesores que pertenecen al departamento de “Informática”.

-- 16. Muestra el nombre de los alumnos y el número de asignaturas en las que están matriculados.

-- 17. Obtén el nombre de las asignaturas optativas y el grado al que pertenecen.

-- 18. Lista los profesores junto con el nombre de las asignaturas que imparten y el curso en el que se dan.

-- 19. Muestra los alumnos matriculados en asignaturas del segundo cuatrimestre.

-- 20. Obtén el nombre de los grados y el número de alumnos matriculados en sus asignaturas.
