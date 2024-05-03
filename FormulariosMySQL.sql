DROP DATABASE if exists Almazara;
Create DATABASE Almazara;
Use Almazara;

CREATE TABLE Socio (
  NIF varchar(9),
  Nombre varchar(20) NOT NULL,
  Apellido1 varchar(20) NOT NULL,
  Apellido2 varchar(20),
  Dirección varchar(60) NOT NULL,
  Cod_Postal char(5) NOT NULL,
  Provincia varchar(40) NOT NULL,
  Municipio varchar(40) NOT NULL,
  Telefono char(9) NOT NULL,
  Correo varchar(40) NOT NULL,
  CONSTRAINT tel_ck CHECK(Telefono REGEXP '^[0-9]{9}'),
  CONSTRAINT NIF_ck CHECK(NIF REGEXP '^[0-9]{8}[TRWAGMYFPDXBNJZSQVHLCKE]'),
  CONSTRAINT Socio_pk PRIMARY KEY(NIF)
);

INSERT INTO Socio VALUES ('84769578H', 'Antonio', 'López','Cruz','Av de Andalucía, 36','23006', 'Alcalá la Real','Jaén','735583926','mariacastro123@hotmail.com');
INSERT INTO Socio VALUES ('53526236J', 'Alfonso', 'Sánchez','Gómez','Av Salobreja, 12','23007', 'Bailén','Jaén','643723746','Yeipa46@hotmail.com');
INSERT INTO Socio VALUES ('64378496R', 'Juan Francisco', 'Hernández','Gómez','Av Granada, 76','23005', 'Jaén','Jaén','436774189','elpaco@hotmail.com');
SELECT * FROM Socio;

CREATE TABLE Entregas (
  N_Entrega int AUTO_INCREMENT NOT NULL,                        
  Fecha_hora timestamp NOT NULL,
  Cantidad integer NOT NULL,
  Tipo ENUM("Árbol","Suelo") NOT NULL,
  Parcela_SIGPAC varchar(10) NOT NULL,
  Recinto_SIGPAC varchar(10) NOT NULL,
  NIF_socio varchar(9),
  CONSTRAINT Cantidad_ck CHECK (Cantidad > 0),
  CONSTRAINT Entregas_pk PRIMARY KEY(N_Entrega),
  CONSTRAINT Entregas_NIF_pk FOREIGN KEY(NIF_socio)
                          REFERENCES Socio(NIF)
                          ON UPDATE CASCADE
                          ON DELETE NO ACTION
);
INSERT INTO Entregas VALUES (null, "2023-12-12 13:36:49", 759, "Suelo", "65748", "28183","84769578H");
INSERT INTO Entregas VALUES (null, "2023-12-14 09:27:57", 1298, "Árbol", "48574", "74957","64378496R");
INSERT INTO Entregas VALUES (null, "2023-12-21 14:01:09", 10398, "Árbol", "98675", "16428","53526236J");

SELECT * FROM Entregas;
CREATE TABLE Ventas(
  N_Factura integer AUTO_INCREMENT NOT NULL,
  NIF_ventas varchar(9) NOT NULL,
  Fecha_hora timestamp NOT NULL,
  CONSTRAINT Ventas_pk PRIMARY KEY(N_Factura),
  CONSTRAINT Ventas_NIF_pk FOREIGN KEY(NIF_ventas)
                          REFERENCES Socio(NIF)
                          ON UPDATE CASCADE
                          ON DELETE NO ACTION
);

INSERT INTO Ventas VALUES (null, "84769578H", "2024-02-12 11:59:12");
INSERT INTO Ventas VALUES (null, "53526236J", "2024-03-01 14:17:09");
INSERT INTO Ventas VALUES (null, "84769578H", "2024-03-02 09:08:07");
SELECT * FROM Ventas;

CREATE TABLE Producto(
Cod_Producto integer AUTO_INCREMENT,
Denominación ENUM("Virgen Extra","Virgen","Cosecha temprana","Ecológico") NOT NULL,
Precio float,
CONSTRAINT Precio_ck CHECK (Precio > 0),                        
CONSTRAINT Producto_pk PRIMARY KEY(Cod_Producto)
);

INSERT INTO Producto VALUES(null, "Virgen Extra", 24.5);
INSERT INTO Producto VALUES(null, "Cosecha temprana", 18.5);
INSERT INTO Producto VALUES(null, "Ecológico", 12.5);
SELECT Precio FROM Producto WHERE Cod_Producto="2";

CREATE TABLE Venta_Producto(
Venta_Producto integer AUTO_INCREMENT,
N_Factura integer,
Cod_Producto integer,
Cantidad integer,
CONSTRAINT Ventas_Producto_pk PRIMARY KEY(Venta_Producto),
CONSTRAINT Venta_Producto_N_Factura_pk FOREIGN KEY(N_Factura)
                                REFERENCES Ventas(N_Factura)
                                ON UPDATE CASCADE
                                ON DELETE NO ACTION,
CONSTRAINT Venta_Producto_Cod_Producto_pk FOREIGN KEY(Cod_Producto)
                                REFERENCES Producto(Cod_Producto)
                                ON UPDATE CASCADE
                                ON DELETE NO ACTION
);
