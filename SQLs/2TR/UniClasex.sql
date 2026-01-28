USE universidad;

-- 1. obtener la alumna con mayor edad
select * from persona where tipo = 'alumno' order by fecha_nacimiento limit 1;

-- 2. datos de la asignatura cuyo id sea el mayor
select * from asignatura where id = (select max(id) from asignatura);

-- 3. nombre de la asignatura y nombre de su grado asociado
select a.nombre as asignatura, g.nombre as grado from asignatura a inner join grado g on a.id_grado = g.id;

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
select pe.nombre, pe.apellido1, pe.apellido2, d.nombre as departamento from profesor pr
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
select distinct pe.* from profesor pr
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
select g.id, g.nombre, sum(a.creditos) as creditos_totales from grado g
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
select nombre, creditos
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


-- "In omnes mortuos in arbore genealogica tua caco, et si me impelles, in vivos quoque, tu, stercus amorphe, maledictus. Te in via deprehendam et pectus tuum malleo conteram, aeger fili canis. Si liberos habes, spero eos aliqua infirmitate corporis vel mentis affici, vel, si id non facit, a curru percuti, sed ne eos mori sinas, totam vitam pati sinas. Et si numquam liberos habebis, quod probabiliter fiet, Deus te benedicat cum femina crassa, tu, stercus fili canis. Si me iterum cum tali ratione addideris comperio et quis sis comperio, te inventurum iuro. Cum te invenero, partes corporis tui ridiculi abscindere et edere incipiam, et dum eas edo, eas cacabo et te cogam edere faeces meas cum frustulis cutis tuae panis micis obductis. Et cum te penitus exenteravero et te cogero edere omnia faeces quae e pretioso, nitente culo meo emitto, te persequar." "Sororem tuam, et si sororem non habes, eam persequar." Sudorem matris tuae persequar, et si inspiratus ero, ambas persequar. Eas rapiam, in autocinetum imponam, in cubiculum ducam, et mentulam meam in omnia foramina corporum eorum (ita, nasis et auribus inclusis) intrudam. Intra eas ejaculabor et novem menses exspectabo dum filiae nascantur. Cum tredecim annos natae erunt, eas quoque futuam. Et si adhuc consobrini aut amitae tibi supersunt, idem eis faciam. Cum totam familiam tuam pediculorum nothorum futuere taedet, catenas capiam, eas in curru meo imponam, et trecentos chiliometra cum tota familia tua eis coniuncta peram. Si quis post hoc adhuc vivit, alcohol in eos effundam ut magis furant. Post haec omnia, ad valetudinarium ibo. Cum a vulneribus quos tibi inflixi convalueris, te inde extraham et in eandem cameram reducam ubi omnes mulieres in familia tua praesenti et eas quae ante te in arbore genealogica tua venerunt concubui. Dum autem tibi videos mei matrem tuam concumbentis ostendam, tibi parvas plagas in fronte dabo donec signum glandi mei magni et vastantis per totam vitam habeas, et ita quotiescumque in speculum inspicis, illas imagines et quae familiae tuae fecerim memineris. Post haec, te dimittam et post tres menses pro te revertar. Te in cameram retraham, sed hac vice non leniter erit. Hac vice manus tuas capiam et acus sub unguibus tuis inseram donec dolor te deficere faciat, et te defibrillatore revivificabo. Bracas et subligacula tua detraham et parvas plagas in testiculos tuos dare incipiam donec paulatim dissolvantur et scrotum tuum omnino vacuum sit. Iterum post haec deficies, opinor, itaque iterum defibrillatore utar ad te revivificandam et pedes tuos in situla aquae ponam. Fibulas vestium papillis, pene, et linguae imponam, et... tibi ictus electricos dabo donec iterum deficias. Cum deficies, scis quid faciam... Revertar et forcipes petam et ungues tuos singillatim evellam, sordes. Deinde te deponam, pannum super faciem tuam ponam, et aquam lente in os tuum infundam, ne suffoceris. Tum discedam et revertar quotidie ut te aliter cruciem, ut quotiescumque vestigia mea ad ianuam appropinquantia variis temporibus quotidie audiveris, timor quem numquam expertus es per corpus tuum currat. Ad ianuam stabo, simulans me eam aperire donec te madefacias. Tum introibo et incipiam... Cum videro te amplius tormenta ferre non posse, te in nosocomio sanare sinam et pro te revertar cum convalueris. Te capiam, et dum oculos tuos face uro, in pomo Adami te malleo confodam donec moriaris, fili canis. Sed ne putes omnia ibi finiri. "Si reincarnatio exstat, in alio reincarnatus revertar et tibi et toti novae familiae tuae omnia quae tibi in hac vita feci faciam, sed lentius et sine te necando, ut quoties umbram noctu videris, me esse putes, te penitus insaniturum, in statum vegetativum casurum solo timore quem praesentia mea tibi affert. Si te sanaverint, non iterum te persequar. Morieris senex, solus, sine testiculis, sine cute, et exspecta dum tibi crura abscidam, stercus."