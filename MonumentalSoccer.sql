CREATE DATABASE MonumentalSoccer;
GO
USE MonumentalSoccer;


CREATE TABLE DISPONIBLIDAD
 (COD_DISPO  INT PRIMARY KEY,
  N_CANCHAS_OCUPADAS INT NOT NULL,
  N_CANCHAS_DISPONIBLES INT NOT NULL );

CREATE TABLE RECINTO
( ID_RECINTO INT PRIMARY KEY,
  NOMBRE VARCHAR(30),
  COD_DISPONIBLILIDAD INT FOREIGN KEY REFERENCES DISPONIBLIDAD (COD_DISPO));

CREATE TABLE ADMINISTRADOR
( ID_ADMIN INT PRIMARY KEY,
  NOMBRE VARCHAR(25),
  ID_RECINTO INT FOREIGN KEY REFERENCES RECINTO(ID_RECINTO));

CREATE TABLE RECEPCIONISTA
( ID_RECEP INT PRIMARY KEY,
  NOMBRE VARCHAR(25),
  ID_RECINTO INT FOREIGN KEY REFERENCES RECINTO(ID_RECINTO));

CREATE TABLE INSCRIPCION
( COD_INSC INT PRIMARY KEY,
  ID_ADMIN INT FOREIGN KEY REFERENCES ADMINISTRADOR(ID_ADMIN),
  ID_RECEP INT FOREIGN KEY REFERENCES RECEPCIONISTA(ID_RECEP));


CREATE TABLE CANCHA
( N_CANCHA INT PRIMARY KEY,
  ESTADO_ACTUAL VARCHAR(20),
  COD_INSC INT FOREIGN KEY REFERENCES INSCRIPCION (COD_INSC));


 CREATE TABLE CONTACTO
( COD_CONTACTO INT PRIMARY KEY,
  ID_ADMIN INT FOREIGN KEY REFERENCES ADMINISTRADOR(ID_ADMIN),
  ID_RECEP INT FOREIGN KEY REFERENCES RECEPCIONISTA(ID_RECEP));


CREATE TABLE CLIENTE
 (ID_CLIENTE   INT PRIMARY KEY,
  NOMBRE VARCHAR (20),
  ESTADO_RES VARCHAR(20),
  COD_CONTACTO INT FOREIGN KEY REFERENCES CONTACTO (COD_CONTACTO));

CREATE TABLE ARRIENDA 
 ( ID_ARRIENDA INT PRIMARY KEY,
   ID_CLIENTE INT FOREIGN KEY REFERENCES CLIENTE (ID_CLIENTE),
   N_DE_CANCHA INT FOREIGN KEY REFERENCES CANCHA (N_CANCHA),
   VALOR INT NOT NULL,
   HORARIO VARCHAR(20));

CREATE TABLE TELEFONO
( ID_TELEFONO INT PRIMARY KEY,
  ID_CLIENTE INT FOREIGN KEY REFERENCES CLIENTE(ID_CLIENTE),
  ID_ADMIN INT FOREIGN KEY REFERENCES ADMINISTRADOR(ID_ADMIN),
  ID_RECEP INT FOREIGN KEY REFERENCES RECEPCIONISTA(ID_RECEP),
  TIPOTELEFONO VARCHAR(10),
  NUMERO INT NOT NULL);

CREATE LOGIN Ams
    WITH PASSWORD = '1234';  
GO  

CREATE USER AdminMS FOR LOGIN Ams; 
GO  

CREATE LOGIN Rms
    WITH PASSWORD = '1234';  
GO  
CREATE USER RecepMS FOR LOGIN Rms;  
GO  

CREATE LOGIN Dms
    WITH PASSWORD = '1234';  
GO  
CREATE USER DueMS FOR LOGIN Dms ;  
GO  