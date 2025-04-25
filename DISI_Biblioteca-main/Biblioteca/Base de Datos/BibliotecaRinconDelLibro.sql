Create database BibliotecaRinconDelLibro

use BibliotecaRinconDelLibro
-- Tabla: Autores
CREATE TABLE Autores (
id_Autores INT PRIMARY KEY,
Nombres VARCHAR(255),
Apellido_P VARCHAR(255),
Apellido_M VARCHAR(255)
);

-- Tabla: ImagenesLibro
CREATE TABLE ImagenesLibro (
id_ImgLibro INT PRIMARY KEY,
Imagenes VARCHAR(255)
)

-- Tabla: Generos
CREATE TABLE Generos (
id_Generos INT PRIMARY KEY,
Generos VARCHAR(255)
)

-- Tabla: Categorias
CREATE TABLE Categorias (
id_Categorias INT PRIMARY KEY,
Categoria VARCHAR(255)
)


-- Tabla: Libros
CREATE TABLE Libros (
id_Libro INT PRIMARY KEY,
id_Autores INT CONSTRAINT FK_Libros_Autores FOREIGN KEY (id_Autores) REFERENCES Autores(id_Autores),
id_Generos INT CONSTRAINT FK_Libros_Generos FOREIGN KEY (id_Generos) REFERENCES Generos(id_Generos),
id_Categorias INT CONSTRAINT FK_Libros_Categorias FOREIGN KEY (id_Categorias) REFERENCES Categorias(id_Categorias),
id_imgLibro INT CONSTRAINT FK_Libros_Imagenes FOREIGN KEY (id_imgLibro) REFERENCES ImagenesLibro(id_ImgLibro),
Titulo VARCHAR(255),
copias_disponibles INT,
copias_ocupadas INT,
Editorial VARCHAR(255),
Fecha_de_impresion DATE
)

-- Tabla: Ubicaciones
CREATE TABLE Ubicaciones (
id_ubicacion INT PRIMARY KEY,
id_libro INT CONSTRAINT FK_Ubicaciones_Libro FOREIGN KEY (id_libro) REFERENCES Libros(id_Libro),
pasillo VARCHAR(255),
estante VARCHAR(255)
)

-- Tabla: Autores_Libros
CREATE TABLE Autores_Libros (
id_Autores INT CONSTRAINT FK_AutoresLibros_Autores FOREIGN KEY (id_Autores) REFERENCES Autores(id_Autores),
id_Libro INT CONSTRAINT FK_AutoresLibros_Libros FOREIGN KEY (id_Libro) REFERENCES Libros(id_Libro)
)

-- Tabla: Direccion
CREATE TABLE Direccion (
id_direccion INT PRIMARY KEY,
calle VARCHAR(255),
colonia VARCHAR(255),
codigo_postal VARCHAR(10),
ciudad VARCHAR(255),
estado VARCHAR(255)
)

-- Tabla: Clientes
CREATE TABLE Clientes (
id_clientes INT PRIMARY KEY,
id_direccion INT CONSTRAINT FK_Clientes_Direccion FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion),
nombre VARCHAR(255),
apellidoP VARCHAR(255),
apellidoM VARCHAR(255),
correo VARCHAR(255)
)

-- Tabla: Rol
CREATE TABLE Rol (
id_rol INT PRIMARY KEY,
tipo VARCHAR(255)
)

-- Tabla: Usuarios
CREATE TABLE Usuarios (
id_usuario INT IDENTITY(1,1) PRIMARY KEY,
id_rol INT CONSTRAINT FK_Usuarios_Rol FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
nombre VARCHAR(255),
apellidoP VARCHAR(255),
apellidoM VARCHAR(255),
correo VARCHAR(255),
contraseña VARCHAR(255)
)

-- Tabla: EstadoPrestamo
CREATE TABLE EstadoPrestamo (
id_Estado_Prestamo INT PRIMARY KEY,
DescripcionEstado VARCHAR(255)
)

-- Tabla: EstadoLibro
CREATE TABLE EstadoLibro (
id_Estado_Libro INT PRIMARY KEY,
DescripcionEstado VARCHAR(255)
)

-- Tabla: EncabezadoTicket
CREATE TABLE EncabezadoTicket (
id_Encabezado_Ticket INT PRIMARY KEY,
id_direccion INT CONSTRAINT FK_Encabezado_Direccion FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion),
id_Usuario INT CONSTRAINT FK_Encabezado_Usuario FOREIGN KEY (id_Usuario) REFERENCES Usuarios(id_usuario),
Nombre_Biblioteca VARCHAR(255),
Numero_Telefono INT,
Fecha DATE
)

-- Tabla: ImagenesTicket
CREATE TABLE ImagenesTicket (
id_Imagenes INT PRIMARY KEY,
Imagenes VARCHAR(255)
)

-- Tabla: Prestamos
CREATE TABLE Prestamos (
id_prestamo INT PRIMARY KEY,
id_clientes INT CONSTRAINT FK_Prestamos_Clientes FOREIGN KEY (id_clientes) REFERENCES Clientes(id_clientes),
id_libro INT CONSTRAINT FK_Prestamos_Libro FOREIGN KEY (id_libro) REFERENCES Libros(id_Libro),
id_EstadoPrestamo INT CONSTRAINT FK_Prestamos_EstadoPrestamo FOREIGN KEY (id_EstadoPrestamo) REFERENCES EstadoPrestamo(id_Estado_Prestamo),
id_Estado_Libro INT CONSTRAINT FK_Prestamos_EstadoLibro FOREIGN KEY (id_Estado_Libro) REFERENCES EstadoLibro(id_Estado_Libro),
id_usuario INT CONSTRAINT FK_Prestamos_Usuario FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
fecha_prestamo DATE,
fecha_devolucion DATE
)

-- Tabla: TicketPrestamo
CREATE TABLE TicketPrestamo (
id_Ticket_Prestamo INT PRIMARY KEY,
id_Encabezado_Ticket INT CONSTRAINT FK_TicketPrestamo_Encabezado FOREIGN KEY (id_Encabezado_Ticket) REFERENCES EncabezadoTicket(id_Encabezado_Ticket),
id_Prestamo INT  CONSTRAINT FK_TicketPrestamo_Prestamo FOREIGN KEY (id_Prestamo) REFERENCES Prestamos(id_prestamo),
id_Imagenes INT CONSTRAINT FK_TicketPrestamo_Imagenes FOREIGN KEY (id_Imagenes) REFERENCES ImagenesTicket(id_Imagenes),
Subtotal FLOAT,
Total FLOAT
)

-- Tabla: TipoMulta
CREATE TABLE TipoMulta (
idTipoMulta INT PRIMARY KEY,
Descripcion_Multa VARCHAR(255),
Precio_Multa FLOAT
)

-- Tabla: Multas
CREATE TABLE Multas (
id_multa INT PRIMARY KEY,
id_prestamo INT CONSTRAINT FK_Multas_Prestamo FOREIGN KEY (id_prestamo) REFERENCES Prestamos(id_prestamo),
id_TipoMulta INT CONSTRAINT FK_Multas_TipoMulta FOREIGN KEY (id_TipoMulta) REFERENCES TipoMulta(idTipoMulta),
monto FLOAT,
descripcion VARCHAR(255),
Pagado  VARCHAR(50)
)


-- Tabla: TicketMulta
CREATE TABLE TicketMulta (
id_Ticket_Multa INT PRIMARY KEY,
id_Encabezado_Ticket INT CONSTRAINT FK_TicketMulta_Encabezado FOREIGN KEY (id_Encabezado_Ticket) REFERENCES EncabezadoTicket(id_Encabezado_Ticket),
id_TipoMulta INT CONSTRAINT FK_TicketMulta_TipoMulta FOREIGN KEY (id_TipoMulta) REFERENCES TipoMulta(idTipoMulta),
subtotal FLOAT,
Total FLOAT
)

-- Tabla: Devoluciones
CREATE TABLE Devoluciones (
id_devoluciones INT PRIMARY KEY,
id_prestamo INT CONSTRAINT FK_Devoluciones_Prestamo FOREIGN KEY (id_prestamo) REFERENCES Prestamos(id_prestamo),
motivo VARCHAR(255)
)

INSERT INTO Autores VALUES (1, 'Gabriel', 'García', 'Márquez');
INSERT INTO Autores VALUES (2, 'Isabel', 'Allende', 'Llona');

INSERT INTO ImagenesLibro VALUES (1, 'imagen1.jpg');
INSERT INTO ImagenesLibro VALUES (2, 'imagen2.jpg');

INSERT INTO Generos VALUES (1, 'Novela');
INSERT INTO Generos VALUES (2, 'Fantasía');

INSERT INTO Categorias VALUES (1, 'Ficción');
INSERT INTO Categorias VALUES (2, 'No Ficción');

INSERT INTO Libros VALUES (1, 1, 1, 1, 1, 'Cien años de soledad', 5, 2, 'Sudamericana', '1967-05-30');
INSERT INTO Libros VALUES (2, 2, 2, 2, 2, 'La casa de los espíritus', 3, 1, 'Plaza & Janés', '1982-01-01');

INSERT INTO Ubicaciones VALUES (1, 1, 'A', '1');
INSERT INTO Ubicaciones VALUES (2, 2, 'B', '2');

INSERT INTO Autores_Libros VALUES (1, 1);
INSERT INTO Autores_Libros VALUES (2, 2);

INSERT INTO Direccion VALUES (1, 'Av. Reforma', 'Centro', '06000', 'CDMX', 'CDMX');
INSERT INTO Direccion VALUES (2, 'Calle Falsa 123', 'Springfield', '12345', 'Springfield', 'Illinois');

INSERT INTO Clientes VALUES (1, 1, 'Juan', 'Pérez', 'López', 'juan.perez@example.com');
INSERT INTO Clientes VALUES (2, 2, 'Ana', 'Martínez', 'Gómez', 'ana.martinez@example.com');

INSERT INTO Rol VALUES (1, 'Administrador');
INSERT INTO Rol VALUES (2, 'Empleado');

INSERT INTO Usuarios VALUES ( 1, 'Carlos', 'Ruiz', 'Zafón', 'carlos.ruiz@example.com', 'password123');
INSERT INTO Usuarios VALUES ( 2, 'Laura', 'Gallego', 'García', 'laura.gallego@example.com', 'password456');

INSERT INTO EstadoPrestamo VALUES (1, 'Prestado');
INSERT INTO EstadoPrestamo VALUES (2, 'Devuelto');

INSERT INTO EstadoLibro VALUES (1, 'Nuevo');
INSERT INTO EstadoLibro VALUES (2, 'Usado');

INSERT INTO EncabezadoTicket VALUES (1, 1, 1, 'Biblioteca Central', 5551234, '2025-04-01');
INSERT INTO EncabezadoTicket VALUES (2, 2, 2, 'Biblioteca Norte', 5555678, '2025-04-02');

INSERT INTO ImagenesTicket VALUES (1, 'ticket1.jpg');
INSERT INTO ImagenesTicket VALUES (2, 'ticket2.jpg');

INSERT INTO Prestamos VALUES (1, 1, 1, 1, 1, 1, '2025-04-01', '2025-04-15');
INSERT INTO Prestamos VALUES (2, 2, 2, 2, 2, 2, '2025-04-03', '2025-04-17');

INSERT INTO TicketPrestamo VALUES (1, 1, 1, 1, 100.0, 120.0);
INSERT INTO TicketPrestamo VALUES (2, 2, 2, 2, 80.0, 96.0);

INSERT INTO TipoMulta VALUES (1, 'Retraso', 50.0);
INSERT INTO TipoMulta VALUES (2, 'Daño', 100.0);

INSERT INTO Multas VALUES (1, 1, 1, 50.0, 'Devolución tardía', 'Si');
INSERT INTO Multas VALUES (2, 2, 2, 100.0, 'Libro dañado', 'No');

INSERT INTO TicketMulta VALUES (1, 1, 1, 50.0, 50.0);
INSERT INTO TicketMulta VALUES (2, 2, 2, 100.0, 100.0);

INSERT INTO Devoluciones VALUES (1, 1, 'Leído completo');
INSERT INTO Devoluciones VALUES (2, 2, 'Error en el libro');

