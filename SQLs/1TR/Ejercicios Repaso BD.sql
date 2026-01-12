USE TiendaTecnologia;

select distinct estado from Pedidos;

-- 1. Muestra todos los productos ordenados alfabéticamente por descripción.
select * from productos order by Descripcion;

-- 2. Obtén los pedidos cuyo método de pago sea 'Tarjeta'.
select * from pedidos where Metodo_pago like '%Tarjeta%';

-- 3. Lista los clientes que viven en la ciudad 'Madrid'.
select * from clientes where Ciudad like '%Madrid%';

-- 4. Muestra los productos con existencias menores a 15.
select * from productos where Existencias < 15;

-- 5. Obtén los fabricantes cuyo país sea 'España'.
select * from Fabricantes where Pais like '%España%';

-- 6. Muestra los pedidos realizados en el año 2023.
select Fecha_pedido from Pedidos where date(year(2023));

-- 7. Devuelve el precio máximo, mínimo y promedio de los productos.
select Precio, max(Precio), min(Precio), avg(Precio) from productos;

-- 8. Muestra los clientes cuyo nombre empiece por la letra 'A'.
select * from Clientes where Nombre like '%A%';

-- 9. Obtén los productos cuyo precio sea múltiplo de 50.
select *, precio%50=0 as Resto from Productos;

-- 10. Muestra los pedidos cuyo total sea mayor a 1000.
select *, sum(Cant) as Total from Detalles_Pedido where Cant>1000;

-- 11. Lista los productos junto con el precio incrementado en un 10%.
select *, precio*10.1 as Precio_incrementado from productos;

-- 12. Devuelve los clientes ordenados por ciudad y dentro de cada ciudad por nombre.
select * from clientes order by(ciudad);

-- 13. Muestra los productos cuyo fabricante tenga Id_fab = 3.
select * from productos where Id_fab=3;

-- 14. Obtén los pedidos cuyo estado NO sea 'Completado'.
select * from Pedidos where Estado!='Completado';

-- 15. Muestra cuántos clientes hay por cada ciudad.
select Ciudad, count(Ciudad) as Clientes_X_Ciudad from Clientes group by Ciudad;

-- 16. Devuelve los productos cuyo precio sea igual al precio máximo de la tabla.
select *, max(precio) as Precio_Maximo from productos group by precio;

-- 17. Muestra los pedidos realizados entre el 1 de marzo y el 31 de marzo.
select * from Pedidos where Fecha_pedido;

-- 18. Obtén los clientes cuyo correo electrónico termine en '@gmail.com'.
select * from Clientes where Email like '%@gmail.com';

-- 19. Muestra los productos cuyo precio redondeado sea mayor a 300.
select *, round(precio) as precio_redondeado from Productos where precio>300;

-- 20. Agrupa los pedidos por estado y muestra el total de pedidos por cada estado.
select *, count(estado) as Total_X_Estados from Pedidos group by estado;
