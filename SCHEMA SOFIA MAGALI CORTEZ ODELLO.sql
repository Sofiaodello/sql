CREATE SCHEMA hospital; -- Realicé un nuevo schema ya que mi idea es realizar una base del ingreso de un paciente, planeo generar mas tablas teniendo 
						  -- en cuenta si el paciente es internado, salas, camas etc, es por eso que realicé nuevas tablas.
                          -- El schema posee 8 tablas hasta el momento 
USE hospital;

-- Tabala Pacientes con 10 columnas entre ellas 1 PK (id_DNI)  y dos FK (id_Localidades, id_Plan)
CREATE TABLE IF NOT EXISTS Pacientes(
id_DNI INT NOT NULL,
Nombre VARCHAR(25),
Apellido VARCHAR(25),
Domicilio VARCHAR(50),
Telefono VARCHAR(50),
Mail VARCHAR(50),
Sexo VARCHAR(25),
id_Localidades INT not null,
id_plan INT not null,
CONSTRAINT PK_id_DNI PRIMARY KEY (id_DNI)
);


-- Tabla Doctores posee 9 columnas entre ellas 1 PK (id_Matricula) y 2 FK(id_Localidades,id_Especialidad )
CREATE TABLE IF NOT EXISTS Doctores(
id_Matricula INT  AUTO_INCREMENT,
Nombre VARCHAR(25),
Apellido VARCHAR(25),
Domicilio VARCHAR(50),
Mail VARCHAR(50),
Telefono VARCHAR(50),
id_Especialidad INT not null,
id_Localidades INT not null,
CONSTRAINT PK_id_Matricula PRIMARY KEY (id_Matricula)
);
 
 -- Tabla Especialidades posee 2 columnas entre ellas 1 PK (id_Especialidad)
 CREATE TABLE IF NOT EXISTS Especialidades(
 id_Especialidad INT  AUTO_INCREMENT,
 Nombre VARCHAR(25),
 CONSTRAINT PK_id_Especialidad PRIMARY KEY (id_Especialidad)
 );

 -- Tabla Consultas posee 6 columnas entre ellas 1 PK ( id_Consulta) y 2 FK (id_Matricula, id_DNI)
 CREATE TABLE IF NOT EXISTS Consultas(
 id_Consulta INT  AUTO_INCREMENT,
 Razon VARCHAR(50),
 Fecha DATE,
 Hora Time,
 id_DNI INT NOT NULL,
 id_Matricula INT NOT NULL,
  CONSTRAINT PK_id_Consulta PRIMARY KEY (id_Consulta)
 );
 
  -- Tabla Provincias posee 2 columnas entre ellas 1 PK ( id_Provincias)
 CREATE TABLE IF NOT EXISTS Provincias(
 id_Provincias INT  AUTO_INCREMENT,
 Nombre VARCHAR(25),
   CONSTRAINT PK_id_Provincias PRIMARY KEY (id_Provincias)
 );
 
 --  Tabla Localidades posee 3 columnas entre ellas 1 PK ( id_Localidades) y 1 FK (id_Provincias)
 CREATE TABLE IF NOT EXISTS  Localidades(
 id_Localidades INT  AUTO_INCREMENT,
 Nombre VARCHAR(25),
 id_Provincias INT NOT NULL,
CONSTRAINT PK_id_Localidades PRIMARY KEY (id_Localidades)
 );
 
  --  Tabla Planes posee 3 columnas entre ellas 1 PK ( id_plan) y 1 FK (id_Obra_social)
 CREATE TABLE IF NOT EXISTS Planes(
 id_plan INT AUTO_INCREMENT,
 Nombre VARCHAR(25),
 id_Obra_social INT not null,
 CONSTRAINT PK_id_plan PRIMARY KEY (id_plan)
 );
 
-- Tabla Obras_Sociales posee 2 columnas entre ellas 1 PK ( id_Obra_social)
 CREATE TABLE IF NOT EXISTS Obras_Sociales(
 id_Obra_social INT AUTO_INCREMENT,
 Nombre VARCHAR(25),
  CONSTRAINT PK_id_Obra_social PRIMARY KEY (id_Obra_social)
 );
 
 
 -- foreign keys
 ALTER TABLE Planes ADD CONSTRAINT FK_Planes_Obra FOREIGN KEY FK_Planes_Obra(id_Obra_social)
REFERENCES Obras_Sociales (id_Obra_social);

 ALTER TABLE Pacientes ADD CONSTRAINT FK_P_local FOREIGN KEY FK_P_local(id_Localidades)
REFERENCES Localidades (id_Localidades);

 ALTER TABLE Pacientes ADD CONSTRAINT FK_P_plan FOREIGN KEY FK_P_plan(id_Plan)
REFERENCES Planes (id_Plan);

 ALTER TABLE Doctores ADD CONSTRAINT FK_D_esp FOREIGN KEY FK_D_esp(id_Especialidad)
REFERENCES Especialidades (id_Especialidad );

 ALTER TABLE Doctores ADD CONSTRAINT FK_D_local FOREIGN KEY FK_D_local(id_Localidades)
REFERENCES Localidades (id_Localidades);

 ALTER TABLE Consultas ADD CONSTRAINT FK_C_DNI FOREIGN KEY FK_C_DNI(id_DNI)
REFERENCES Pacientes (id_DNI);

 ALTER TABLE Consultas ADD CONSTRAINT FK_C_mat FOREIGN KEY FK_C_mat(id_Matricula)
REFERENCES Doctores (id_Matricula);

 ALTER TABLE Localidades ADD CONSTRAINT FK_L_prov FOREIGN KEY FK_L_prov(id_Provincias)
REFERENCES Provincias (id_Provincias);


