USE TiendaTecnologia;

-- Pepe
-- 1. Productos ordenados por precio ✅
SELECT * FROM Productos ORDER BY Precio;

-- Pepe
-- 2. Pedidos con estado 'Pendiente' ✅
SELECT * FROM Pedidos WHERE Estado = 'Pendiente';

-- Pepe
-- 3. Productos con precio mayor a 500 ✅
SELECT Id_fab, Id_categoria, Descripcion, Precio, Existencias FROM Productos WHERE Precio > 500;

-- Pepe
-- 4. Clientes cuyo teléfono contiene '56' ✅
SELECT Nombre FROM Clientes WHERE Telefono LIKE '%56%';

-- Pepe
-- 5. Estados de todos los pedidos ✅
SELECT distinct Estado FROM Pedidos;

-- Pepe
-- 6. Pedidos realizados en enero (mes 1) ✅
SELECT * FROM Pedidos WHERE MONTH(Fecha_pedido) = 1;

-- Pepe
-- 7. Clientes con ubicación concatenada (Dirección-Ciudad) ✅
SELECT Id_cliente, Nombre, UPPER(CONCAT(Direccion, '-', Ciudad)) AS Ubicacion FROM Clientes;

-- Pepe
-- 8. Pedido más antiguo ✅
SELECT MIN(Fecha_pedido) AS pedido_antiguo FROM Pedidos;

-- Pepe
-- 9. Fabricantes agrupados por país ✅
SELECT Pais, COUNT(*) AS cantidad FROM Fabricantes GROUP BY Pais;

-- Pepe
-- 10. Productos con precio entre 200 y 800 ✅
SELECT * FROM Productos WHERE Precio BETWEEN 200 AND 800;

-- Pepe
-- 11. Producto más caro ✅
SELECT * FROM Productos ORDER BY Precio DESC LIMIT 1;

-- Pepe
-- 12. Productos con precio redondeado ✅
SELECT *, ROUND(Precio,0) AS precio_redondeado FROM Productos;

-- Pepe
-- 14. Clasificación de productos por existencias ✅
SELECT *, 
       CASE 
         WHEN Existencias >= 30 THEN 'muchas' 
         WHEN Existencias < 10 THEN 'pocas' 
         ELSE 'suficientes' 
       END AS rango 
FROM Productos;

-- Pepe
-- 15. Categorías con existencias totales >= 50 ✅
SELECT Id_categoria, SUM(Existencias) AS total_existencias FROM Productos GROUP BY Id_categoria HAVING SUM(Existencias) >= 50;

-- Pepe
-- 16. Métodos de pago agrupados ✅ (error corregido: "metodo_paco" → "metodo_pago")
SELECT Metodo_pago, COUNT(*) AS cantidad FROM Pedidos GROUP BY Metodo_pago;