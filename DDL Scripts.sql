CREATE DATABASE Biblioteca_db2
USE Biblioteca_db2

CREATE TABLE Libro (
	Libro_id	  int				NOT NULL,
	Titulo		  varchar(50)		NOT NULL,
	Autor_id2	  int				NOT NULL,	--Foreign
	Genero_id2	  int				NOT NULL,	--Foreign
	Edicion		  varchar(5)		NOT NULL,
	Pasta_id2	  int				NOT NULL,	--Foreign
	Editorial_id2 int				NOT NULL,	--Foreign
	CONSTRAINT	  pk_lib	PRIMARY KEY(Libro_id),
	CONSTRAINT	  fk_aut	FOREIGN KEY(Autor_id2)		REFERENCES Autores(Autor_id),
	CONSTRAINT	  fk_gen	FOREIGN KEY(Genero_id2)		REFERENCES Generos(Genero_id),
	CONSTRAINT	  fk_pst	FOREIGN KEY(Pasta_id2)		REFERENCES TipoPastas(Pasta_id),
	CONSTRAINT	  fk_edt	FOREIGN KEY(Editorial_id2)	REFERENCES Editoriales(Editorial_id)
);

CREATE TABLE Autores(
	Autor_id	int					NOT NULL,
	Nombres_a	varchar(20)			NOT NULL,
	Apellido1_a	varchar(15)			NOT NULL,
	Apellido2_a	varchar(15)			NOT NULL,
	Iniciales	varchar(5)			NOT NULL,
	CONSTRAINT  pk_aut	PRIMARY KEY(Autor_id)
);

CREATE TABLE Generos(
	Genero_id	int					NOT NULL,
	Nombre_g	varchar(20)			NOT NULL,
	CONSTRAINT	pk_gen	PRIMARY KEY(Genero_id)
);

CREATE TABLE TipoPastas(
	Pasta_id	int					NOT NULL,
	Nombre_p	varchar(20)			NOT NULL,
	CONSTRAINT	pk_pst	PRIMARY KEY(Pasta_id)
);

CREATE TABLE Editoriales(
	Editorial_id	int				NOT NULL,
	Nombre_ed		varchar(30)		NOT NULL,
	CONSTRAINT		pk_edt  PRIMARY KEY(Editorial_id)
);


CREATE TABLE Inventario(
	Inventario_id	int				NOT NULL,
	Estatus			varchar(15)		NOT NULL,
	Libro_id2		int				NOT NULL,	--Foreign
	Sucursal_id2	int				NOT NULL,	--Foreign
	CONSTRAINT		pk_inv	PRIMARY KEY(Inventario_id),
	CONSTRAINT		fk_lib	FOREIGN KEY(Libro_id2)		REFERENCES Libro(Libro_id),
	CONSTRAINT		fk_suc	FOREIGN KEY(Sucursal_id2)	REFERENCES Sucursales(Sucursal_id)
);

CREATE TABLE Sucursales(
	Sucursal_id		int				NOT NULL,
	Nombre_su		varchar(30)		NOT NULL,
	CONSTRAINT		pk_suc	PRIMARY KEY(Sucursal_id)
);

CREATE TABLE Empleados(
	Empleado_id		int				NOT NULL,
	Nombres_em		varchar(20)		NOT NULL,
	Apellido1_em	varchar(15)		NOT NULL,
	Apellido2_em	varchar(15)		NOT NULL,
	FechaNac		date			NOT NULL,
	Sucursal_id3	int				NOT NULL,	--Foreign
	CONSTRAINT		pk_emp	PRIMARY KEY(Empleado_id),
	CONSTRAINT		fk_suc2	FOREIGN KEY(Sucursal_id3)	REFERENCES Sucursales(Sucursal_id)
);

CREATE TABLE Estudiantes(
	Estudiante_id	int				NOT NULL,
	Matricula_es	varchar(8)		NOT NULL,
	Nombres_es		varchar(20)		NOT NULL,
	Apellido1_es	varchar(15)		NOT NULL,
	Apellido2_es	varchar(15)		NOT NULL,
	Facultad_id2	int				NOT NULL,	--Foreign
	NumTel_es		varchar(10)		NOT NULL,
	Correo_es		varchar(50)		NOT NULL,
	TipoLector		varchar(10)		NOT NULL,
	CONSTRAINT		pk_est	PRIMARY KEY(Matricula_es),
	CONSTRAINT		fk_fac3 FOREIGN KEY(Facultad_id2)	REFERENCES Facultades(Facultad_id)
);

CREATE TABLE Maestros(
	Maestro_id		int				NOT NULL,
	Matricula_ma	varchar(8)		NOT NULL,
	Nombres_ma		varchar(20)		NOT NULL,
	Apellido1_ma	varchar(15)		NOT NULL,
	Apellido2_ma	varchar(15)		NOT NULL,
	Facultad_id3	int				NOT NULL,	--Foreign
	NumTel_ma		varchar(10)		NOT NULL,
	Correo_ma		varchar(50)		NOT NULL,
	TipoLector		varchar(10)		NOT NULL,
	CONSTRAINT		pk_mtro	PRIMARY KEY(Matricula_ma),
	CONSTRAINT		fk_fac2 FOREIGN KEY(Facultad_id3)	REFERENCES Facultades(Facultad_id)
);

CREATE TABLE Facultades(
	Facultad_id		int				NOT NULL,
	Nombre_fac		varchar(30)		NOT NULL,
	CONSTRAINT		pk_fac PRIMARY KEY(Facultad_id)
);


CREATE TABLE Rentas(
	Prestamo_id		int				NOT NULL,
	fechaRenta		date			NOT NULL,
	fechaEntrega	date			NOT NULL,
	Inventario_id2	int				NOT NULL,	--Foreign
	Matricula		varchar(8)		NOT NULL,
	Externo			varchar(30)				,
	Sucursal_id3	int				NOT NULL,	--Foreign
	Empleado_id2	int				NOT NULL,	--Foreign
	DiasRetraso		smallInt				,
	CONSTRAINT		pk_prst	PRIMARY KEY(Prestamo_id),
	CONSTRAINT		fk_inv	FOREIGN KEY(Inventario_id2) REFERENCES Inventario(Inventario_id),
	CONSTRAINT		fk_suc3	FOREIGN KEY(Sucursal_id3)	REFERENCES Sucursales(Sucursal_id),
	CONSTRAINT		fk_emp	FOREIGN KEY(Empleado_id2)	REFERENCES Empleados(Empleado_id)
);


CREATE TABLE Multas(
	Multa_id		int				NOT NULL,
	Matricula		varchar(8)		NOT NULL,
	fechaRenta		date			NOT NULL,
	fechaEntrega	date			NOT NULL,
	DiasRetraso		smallInt		NOT NULL,
	PrecioMulta		int				NOT NULL,
	CONSTRAINT		pk_mlt	PRIMARY KEY(Multa_id)
);



/* Seguridad de la base de datos */

CREATE TABLE TUsuario(
	nUsuario_id		int				NOT NULL,
	sNombre_usr		varchar(15)		NOT NULL,
	sPassw			varchar(20)		NOT NULL,
	nPersonal_id	int				NOT NULL,
	CONSTRAINT		pk_usr	PRIMARY KEY(nPersonal_id)
);

CREATE	TABLE TPermiso(
	nPermiso_id		int				NOT NULL,
	sNombre_prm		varchar(30)		NOT NULL,
	sDesc_prm		varchar(60)		NOT NULL,
	sUrl			varchar(100)	NOT NULL,
	CONSTRAINT		pk_prm	PRIMARY KEY(nPermiso_id)
);

CREATE TABLE TPerfil(
	nPerfil_id		int				NOT NULL,
	sNombre_prf		varchar(30)		NOT NULL,
	nPersonal_id2	int		NOT NULL,	--Foreign
	CONSTRAINT		pk_prf	PRIMARY KEY(nPerfil_id),
	CONSTRAINT		fk_usr	FOREIGN KEY(nPersonal_id2) REFERENCES TUsuario(nPersonal_id)
);

CREATE TABLE TPrivilegios(
	nPerfil_id2		int				NOT NULL,	--Foreign
	sPermiso_id		int				NOT NULL,
	sNombre_prv		varchar(30)		NOT NULL,
	CONSTRAINT		fk_prf	FOREIGN KEY(nPerfil_id2) REFERENCES	TPerfil(nPerfil_id)
);

