CREATE TABLE Socio (
  NIF varchar(9),
  Nombre varchar(20) NOT NULL,
  Apellido1 varchar(20) NOT NULL,
  Apellido2 varchar(20),
  Dirección varchar(40) NOT NULL,
  Cod_Postal char(5) NOT NULL,
  Municipio varchar(40) NOT NULL,
  Provincia varchar(40) NOT NULL,
  Telefono char(9) NOT NULL,
  Correo varchar(40) NOT NULL,
  CONSTRAINT Socio_pk PRIMARY KEY(NIF)
);

CREATE TABLE Entregas (
  N_Entrega integer AUTO_INCREMENT,                        
  Fecha_hora timestamp NOT NULL,
  Cantidad integer NOT NULL,
  Tipo text NOT NULL,
  Parcela_SIGPAC char(10) NOT NULL,
  Recinto_SIGPAC char(10) NOT NULL,
  NIF_socio varchar(9),
  CONSTRAINT Entregas_pk PRIMARY KEY(N_Entrega),
  CONSTRAINT Entregas_NIF_pk FOREIGN KEY(NIF_socio)
                          REFERENCES Socio(NIF)
                          ON UPDATE CASCADE
                          ON DELETE NO ACTION
);

CREATE TABLE Ventas(
  NIF_ventas varchar(9) NOT NULL,
  N_Factura integer AUTO_INCREMENT NOT NULL,
  Fecha_hora timestamp NOT NULL,
  CONSTRAINT Ventas_pk PRIMARY KEY(N_Factura),
  CONSTRAINT Ventas_NIF_pk FOREIGN KEY(NIF_ventas)
                          REFERENCES Socio(NIF)
                          ON UPDATE CASCADE
                          ON DELETE NO ACTION
);

CREATE TABLE Producto(
Cod_Producto integer AUTO_INCREMENT,
Denominación varchar(20) NOT NULL,
Precio float,                             
CONSTRAINT Producto_pk PRIMARY KEY(Cod_Producto)
);

CREATE TABLE Venta_Producto(
Venta_Producto integer AUTO_INCREMENT,
N_Factura integer,
Cod_Producto integer,
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
