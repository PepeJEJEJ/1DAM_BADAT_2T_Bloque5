USE `universidad`;

select * from persona ;
select * from asignatura ;
select * from profesor ;
select * from departamento ;
select * from grado ;
select * from curso_escolar;
select * from alumno_se_matricula_asignatura;

-- Jose A.

-- 1.
select id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo from persona where fecha_nacimiento>1977-08-21;

-- Jose A.

-- 2.
select d.nombre, count(pr.id_profesor) as Nº_Profesores from profesor pr
join persona p on p.id=pr.id_profesor
join departamento d on pr.id_departamento=d.id group by pr.id_profesor;

-- Jose A.

-- 3
select a.nombre from asignatura a where curso=4;

-- Jose A.

-- 4
select c.id, c.anyo_inicio, c.anyo_fin,count(m.id_alumno) as N_Matriculas from persona p
right join alumno_se_matricula_asignatura m on p.id=m.id_alumno
right join curso_escolar c on m.id_curso_escolar=c.id group by c.id;

-- Jose A.

-- 5
select a.nombre, p.nombre, p.apellido1, p.apellido2 from persona p
join alumno_se_matricula_asignatura m on p.id=m.id_alumno
join asignatura a on m.id_asignatura=a.id group by a.id;

-- Jose A.

-- 6
select g.nombre, sum(a.creditos) from asignatura a
join grado g on a.id_grado=g.id group by a.creditos;