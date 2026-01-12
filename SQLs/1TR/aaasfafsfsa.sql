DROP DATABASE IF EXISTS TiendaTecnologia;
CREATE DATABASE TiendaTecnologia;
USE TiendaTecnologia;

-- =========================
-- TABLA CLIENTES
-- =========================
CREATE TABLE Clientes (
    Id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Ciudad VARCHAR(100),
    Telefono VARCHAR(20),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- TABLA FABRICANTES
-- =========================
CREATE TABLE Fabricantes (
    Id_fab INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Pais VARCHAR(50) NOT NULL
);

-- =========================
-- TABLA CATEGORIAS
-- =========================
CREATE TABLE Categorias (
    Id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL
);

-- =========================
-- TABLA PRODUCTOS
-- =========================
CREATE TABLE Productos (
    Id_producto INT PRIMARY KEY AUTO_INCREMENT,
    Id_fab INT NOT NULL,
    Id_categoria INT,
    Descripcion VARCHAR(255) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Existencias INT NOT NULL,
    Fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Id_fab) REFERENCES Fabricantes(Id_fab)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Id_categoria) REFERENCES Categorias(Id_categoria)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- =========================
-- TABLA PEDIDOS
-- =========================
CREATE TABLE Pedidos (
    N_pedido INT PRIMARY KEY AUTO_INCREMENT,
    Fecha_pedido DATE NOT NULL,
    Id_cliente INT NOT NULL,
    Estado ENUM('Pendiente', 'En proceso', 'Completado', 'Cancelado') NOT NULL,
    Metodo_pago VARCHAR(30),
    Fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Id_cliente) REFERENCES Clientes(Id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- TABLA DETALLES_PEDIDO
-- =========================
CREATE TABLE Detalles_Pedido (
    N_pedido INT,
    Id_producto INT,
    Cant INT NOT NULL,
    PRIMARY KEY (N_pedido, Id_producto),
    FOREIGN KEY (N_pedido) REFERENCES Pedidos(N_pedido)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Id_producto) REFERENCES Productos(Id_producto)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- INSERCIÓN DE DATOS
-- =========================

-- CLIENTES
INSERT INTO Clientes (Nombre, Direccion, Ciudad, Telefono, Email)
VALUES
('Juan Pérez', 'Calle Falsa 123', 'Madrid', '600123456', 'juan.perez@gmail.com'),
('Ana López', 'Avenida Real 45', 'Barcelona', '650987654', 'ana.lopez@gmail.com'),
('Carlos García', 'Plaza Mayor 2', 'Valencia', '610555444', 'carlos.garcia@gmail.com'),
('Laura Martínez', 'Calle Sol 33', 'Sevilla', '620334556', 'laura.martinez@gmail.com'),
('Miguel Fernández', 'Avenida Luna 89', 'Bilbao', '630445667', 'miguel.fernandez@gmail.com');

-- FABRICANTES
INSERT INTO Fabricantes (Nombre, Pais)
VALUES
('HP', 'Estados Unidos'),
('Dell', 'Estados Unidos'),
('Lenovo', 'China'),
('Asus', 'Taiwán'),
('Acer', 'Taiwán'),
('Samsung', 'Corea del Sur'),
('Sony', 'Japón'),
('Toshiba', 'Japón'),
('MSI', 'Taiwán'),
('Apple', 'Estados Unidos');

-- CATEGORIAS
INSERT INTO Categorias (Nombre)
VALUES
('Portátiles'),
('Monitores'),
('Periféricos'),
('Componentes'),
('Almacenamiento'),
('Smartphones');

-- PRODUCTOS
INSERT INTO Productos (Id_fab, Id_categoria, Descripcion, Precio, Existencias)
VALUES
(1, 1, 'Portátil HP Envy 13', 999.99, 10),
(2, 2, 'Monitor Dell UltraSharp 27', 499.99, 5),
(3, 3, 'Teclado mecánico Lenovo Legion', 89.99, 20),
(4, 4, 'Placa base Asus ROG', 299.99, 8),
(5, 1, 'Ordenador Acer Aspire 5', 599.99, 15),
(6, 5, 'Disco duro Samsung EVO 1TB', 120.00, 50),
(7, 3, 'Auriculares Sony WH-1000XM4', 350.00, 30),
(8, 1, 'Portátil Toshiba Satellite', 700.00, 12),
(9, 4, 'Tarjeta gráfica MSI RTX 3080', 899.99, 6),
(10, 6, 'iPhone 14 Pro', 1199.99, 25);

-- PEDIDOS
INSERT INTO Pedidos (Fecha_pedido, Id_cliente, Estado, Metodo_pago)
VALUES
('2024-01-01', 1, 'En proceso', 'Tarjeta'),
('2023-01-01', 1, 'Completado', 'Bizum'),
('2024-02-03', 2, 'Completado', 'Efectivo'),
('2023-02-03', 2, 'Cancelado', 'Tarjeta'),
('2024-02-05', 3, 'Pendiente', 'Tarjeta'),
('2023-02-05', 3, 'Pendiente', 'Transferencia');

-- DETALLES PEDIDO
INSERT INTO Detalles_Pedido (N_pedido, Id_producto, Cant)
VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 4, 1),
(4, 5, 2),
(5, 1, 1),
(5, 6, 1),
(6, 2, 2);

-- 1. Productos ordenados por precio
Select precio from Productos order by Precio;
-- 2. Pedidos con estado 'Pendiente'
Select * from Pedidos where Estado='Pendiente';
-- 3. Productos con precio mayor a 500
Select * from Productos where Precio>500;
-- 4. Clientes cuyo teléfono contiene '56'
Select * from Clientes where Telefono like '%56%';
-- 5. Estados de todos los pedidos
Select distinct Estado from Pedidos;
-- 6. Pedidos realizados en enero (mes 1)
Select * from Pedidos where Fecha_pedido between '2023-01-01'and'2023-01-31';
-- 7. Clientes con ubicación concatenada (Dirección-Ciudad)
Select Id_cliente, Nombre, concat(Direccion,'-',Ciudad) as Ubicacion, Telefono, Email, Fecha_creacion from Clientes;
-- 8. Pedido más antiguo
Select min(Fecha_pedido) as Pedido_Antiguo from Pedidos;
-- 9. Fabricantes agrupados por país
Select Pais, Count(*) as Cantidad from Fabricantes group by Pais;
-- 10. Productos con precio entre 200 y 800
Select * from Productos where precio between '200'and'800';
-- 11. Producto más caro
Select * from Productos order by precio desc limit 1;
-- 12. Productos con precio redondeado
Select *, round(Precio) as Precio_Redondeado from Productos;
-- 14. Clasificación de productos por existencias
Select * from Productos order by Existencias;
-- 15. Categorías con existencias totales >= 50
Select Id_categoria, sum(Existencias) as total_existencias from Productos group by Id_categoria having sum(Existencias) >= 50;
-- 16. Métodos de pago agrupados
select distinct Metodo_pago from Pedidos;