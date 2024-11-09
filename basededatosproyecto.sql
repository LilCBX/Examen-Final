CREATE DATABASE Final_09092021504;
USE Final_09092021504;


CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);


INSERT INTO roles (nombre) VALUES ('Administrador'), ('Usuario'), ('Invitado');


CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    rol_id INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rol_id) REFERENCES roles(id) ON DELETE SET NULL
);


INSERT INTO usuarios (nombre, correo, contrasena, rol_id) VALUES
    ('Juan Perez', 'juan@example.com', 'contraseña_segura', 1),
    ('Maria Lopez', 'maria@example.com', 'contrasena_fuerte', 2),
    ('Carlos Ramirez', 'carlos@example.com', 'contrasena_segura', 3);


CREATE TABLE permisos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
);


INSERT INTO permisos (nombre, descripcion) VALUES
    ('acceso_reportes', 'Permite el acceso a los reportes del sistema'),
    ('editar_contenido', 'Permite editar contenido del sistema'),
    ('ver_usuarios', 'Permite ver la lista de usuarios');


CREATE TABLE roles_permisos (
    rol_id INT,
    permiso_id INT,
    PRIMARY KEY (rol_id, permiso_id),
    FOREIGN KEY (rol_id) REFERENCES roles(id) ON DELETE CASCADE,
    FOREIGN KEY (permiso_id) REFERENCES permisos(id) ON DELETE CASCADE
);


INSERT INTO roles_permisos (rol_id, permiso_id) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 3);


CREATE TABLE configuracion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    clave VARCHAR(100) NOT NULL UNIQUE,
    valor TEXT NOT NULL
);


INSERT INTO configuracion (clave, valor) VALUES
    ('tema', 'oscuro'),
    ('idioma', 'español'),
    ('notificaciones', 'activadas');


CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO clientes (nombre, correo, telefono) VALUES
    ('Cliente 1', 'cliente1@example.com', '1234567890'),
    ('Cliente 2', 'cliente2@example.com', '0987654321');


CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0
);


INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
    ('Producto A', 'Descripción del Producto A', 100.00, 50),
    ('Producto B', 'Descripción del Producto B', 50.00, 30);


CREATE TABLE observaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comentario TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO observaciones (comentario) VALUES
    ('Primera observación sobre el sistema.'),
    ('Segunda observación relevante para el sistema.');
