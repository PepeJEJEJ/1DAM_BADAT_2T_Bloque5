# 📘 Tema 11 — Consultas multitabla y subconsultas

---

# 1. Introducción: del Modelo Lógico al Modelo Físico

El **modelo físico** es la representación REAL de la base de datos en un SGBD (MySQL, MariaDB, Oracle…).

Es la fase donde el diseño conceptual (E/R) y el diseño lógico (relacional) se convierten en **código SQL implementable** mediante instrucciones DDL.

### 🔁 Proceso habitual de diseño:

| Fase | ¿Qué representa? |
|------|------------------|
| **Modelo conceptual (E/R)** | Entidades, atributos, relaciones |
| **Modelo lógico (Relacional)** | Tablas, claves primarias, claves foráneas, normalización |
| **Modelo físico (DDL)** | CREATE TABLE, tipos de datos, restricciones, índices |

---

# 2. El Lenguaje SQL y sus sublenguajes

SQL se divide en diferentes bloques que cumplen funciones específicas:

```
             SQL (Structured Query Language)
 ┌──────────┬────────────┬───────────┬─────────────┐
 |   DDL    |    DML     |    DCL    |     TCL     |
 |Definir   |Manipular   |Controlar  |Transacciones|
 └──────────┴────────────┴───────────┴─────────────┘
```

| Sublenguaje | Función | Instrucciones |
|-------------|---------|----------------|
| **DDL** | Define estructuras | CREATE, DROP, ALTER, TRUNCATE |
| **DML** | Manipula datos | SELECT, INSERT, UPDATE, DELETE |
| **DCL** | Gestiona permisos | GRANT, REVOKE |
| **TCL** | Controla transacciones | COMMIT, ROLLBACK, SAVEPOINT |

📌 **En este tema trabajamos solo con DDL → Modelo Físico.**

---

# 3. Gestión de Bases de Datos (DDL)

```sql
DROP DATABASE IF EXISTS mi_bd;
CREATE DATABASE mi_bd;
USE mi_bd;
```

---

# 4. Tipos de Datos (ampliados según Tema 6)

## 4.1. Numéricos

| Tipo | Descripción | Ejemplo |
|------|-------------|---------|
| INT | Entero | 25 |
| DECIMAL(p,s) | Valor exacto | DECIMAL(5,2) |
| FLOAT / DOUBLE | Valor aproximado | 3.141592 |

---

## 4.2. Texto

| Tipo | Descripción |
|------|-------------|
| CHAR(n) | Longitud fija |
| VARCHAR(n) | Longitud variable |
| TEXT | Texto largo |
| ENUM | Lista cerrada de valores |

---

## 4.3. Booleanos

| Tipo | Nota |
|------|------|
| BOOLEAN | Equivalente a TINYINT(1) |
| TINYINT(1) | 0 = falso, 1 = verdadero |

---

## 4.4. Fechas y tiempos

| Tipo | Descripción |
|------|-------------|
| DATE | Fecha |
| TIME | Hora |
| DATETIME | Fecha + hora |
| TIMESTAMP | Marca de tiempo |

---

# 5. Crear Tablas (DDL)

```sql
CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
```

---

# 6. Restricciones (Modelo Físico)

## 6.1. PRIMARY KEY

```sql
id INT PRIMARY KEY
```

---

## 6.2. FOREIGN KEY + acciones referenciales

```sql
FOREIGN KEY (id_autor)
  REFERENCES autores(id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
```

---

# 🟦 Acciones Referenciales

| Acción | Efecto al borrar el padre |
|--------|----------------------------|
| **CASCADE** | Se eliminan también los hijos |
| **SET NULL** | La FK pasa a NULL |
| **SET DEFAULT** | La FK toma el valor DEFAULT |
| **RESTRICT** | Prohíbe el borrado si hay hijos |
| **NO ACTION** | Igual que RESTRICT |

### Explicación clara:

**CASCADE** → Elimina hijos automáticamente  
**SET NULL** → Mantiene hijos sin padre (FK = NULL)  
**SET DEFAULT** → Asigna un valor por defecto  
**RESTRICT** → Impide borrar si hay hijos  
**NO ACTION** → Igual que RESTRICT, comprobación final

---

## 6.3. NOT NULL

```sql
nombre VARCHAR(50) NOT NULL;
```

---

## 6.4. UNIQUE

```sql
email VARCHAR(100) UNIQUE;
```

---

## 6.5. CHECK

```sql
edad INT CHECK (edad >= 0);
```

---

## 6.6. DEFAULT

```sql
estado VARCHAR(20) DEFAULT 'activo';
```

---

# 7. Modificar Tablas (ALTER TABLE)

### Añadir columna
```sql
ALTER TABLE empleados ADD telefono VARCHAR(20);
```

### Eliminar columna
```sql
ALTER TABLE empleados DROP COLUMN telefono;
```

### Modificar columna
```sql
ALTER TABLE empleados MODIFY salario DECIMAL(10,2) NOT NULL;
```

### Añadir clave foránea
```sql
ALTER TABLE libros
ADD CONSTRAINT fk_autor
FOREIGN KEY (id_autor)
REFERENCES autores(id)
ON DELETE SET NULL;
```

---

# 9. Ejemplo completo de tabla física

```sql
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    telefono VARCHAR(20),
    provincia VARCHAR(50),
    cp INT CHECK (cp BETWEEN 1000 AND 52999),
    fecha_registro DATE DEFAULT (CURRENT_DATE)
);
```

---
