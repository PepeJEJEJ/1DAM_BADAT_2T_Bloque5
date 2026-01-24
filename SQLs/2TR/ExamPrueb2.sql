USE `universidad`;

select * from persona ;
select * from asignatura ;
select * from profesor ;
select * from departamento ;
select * from grado ;
select * from curso_escolar;
select * from alumno_se_matricula_asignatura;

-- 1. Obtén el nombre y apellidos de la alumna más joven registrada en la tabla persona. (REPETIR)

-- 2. Muestra el nombre y apellidos de los profesores que no tienen asignaturas asignadas.
select p.nombre, p.apellido1, p.apellido2, a.id_profesor from persona p left join asignatura a on p.id=a.id_profesor where a.id_profesor is null;
-- 3. Lista el nombre de cada asignatura junto con el número de alumnos matriculados en ella.
select a.nombre,count(m.id_alumno) as alumnos_matriculados from asignatura a join alumno_se_matricula_asignatura m on m.id_asignatura=a.id group by a.nombre;
-- 4. Muestra el nombre de las asignaturas y el nombre del grado al que pertenecen, pero solo aquellas que tengan más de 6 créditos.
select a.nombre, g.nombre from asignatura a join grado g on g.id=a.id_grado where a.creditos>6;
-- 5. Obtén el nombre completo del profesor y el nombre del departamento al que pertenece.
select p.nombre, p.apellido1, p.apellido2, d.nombre from persona p
join profesor pr on p.id = pr.id_profesor
join departamento d on pr.id_departamento=d.id;
-- 6. Muestra los grados que noid_profesor tienen ninguna asignatura asociada.
select g.* from grado g left join asignatura a on g.id=a.id_grado where a.id is null;
-- 7. Obtén el nombre y apellidos de cada alumno junto con el nombre de las asignaturas en las que está matriculado.
select p.nombre, p.apellido1, p.apellido2, a.nombre from persona p, asignatura a
join alumno_se_matricula_asignatura m on a.id=m.id_asignatura
join asignatura a1 on a1.id_alumno = p.id
where p.tipo='alumno'; -- akafklfskla
-- 8. Muestra el nombre completo de los profesores y el número de asignaturas que imparten.
select p.nombre, p.apellido1, p.apellido2,count(a.id_profesor) as n_asignaturas from persona p join asignatura a on p.id=a.id_profesor group by a.id_profesor;
-- 9. Lista el nombre de la asignatura, el nombre del grado y el nombre completo del profesor responsable.
select a.nombre as asignatura, g.nombre as grado, concat(p.nombre,'-',p.apellido1,'-',p.apellido2) as responsable from persona p 
join profesor pr on pr.id_profesor=p.id
join asignatura a on a.id=pr.id_profesor
join grado g on g.id=a.id_grado;
-- 10. Obtén los nombres y apellidos de los alumnos que se matricularon en el curso escolar 2018/2019.
select p.nombre, p.apellido1, p.apellido2,c.* from persona p,curso_escolar c 
join alumno_se_matricula_asignatura m1 on m1.id_alumno=p.id
join alumno_se_matricula_asignatura m on m.id_curso_escolar=c.id
where anyo_inicio='2018' and anyo_fin='2019'; -- akafklfskla
-- 11. Muestra todas las asignaturas que no tienen profesor asignado.
select * from asignatura a where a.id_profesor is null;
-- 12. Obtén el nombre de los departamentos y el número de profesores que pertenecen a cada uno.
select d.nombre from departamento d
join persona p on p.id=pr.id_profesor -- fallo
join profesor pr on d.id=pr.id_profesor;
-- 13. Lista los alumnos junto con el curso escolar en el que se matricularon y las asignaturas correspondientes.
select * from persona p
join alumno_se_matricula_asignatura m on m.id_alumno=p.id
join curso_escolar c on m.id_alumno
join asignatura a on m.id_curso_escolar=c.id;
-- 14. Muestra el nombre de los grados y el número total de asignaturas que tienen asociadas.

-- 15. Obtén el nombre y apellidos de los profesores que pertenecen al departamento de “Informática”.

-- 16. Muestra el nombre de los alumnos y el número de asignaturas en las que están matriculados.

-- 17. Obtén el nombre de las asignaturas optativas y el grado al que pertenecen.

-- 18. Lista los profesores junto con el nombre de las asignaturas que imparten y el curso en el que se dan.

-- 19. Muestra los alumnos matriculados en asignaturas del segundo cuatrimestre.

-- 20. Obtén el nombre de los grados y el número de alumnos matriculados en sus asignaturas.
