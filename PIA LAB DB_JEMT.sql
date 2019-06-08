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

INSERT INTO dbo.Rentas([Prestamo_id],[fechaRenta],[fechaEntrega],[Inventario_id2],[Matricula],[Externo],[Sucursal_id3],[Empleado_id2],[DiasRetraso]) VALUES(1,'2018-01-06 10:37:05','2020-05-19 13:00:44',12,'24166','No',2,23,1),(2,'2018-01-05 23:35:29','2018-02-05 09:14:53',98,'27011','Si',3,26,4),(3,'2018-01-04 22:32:54','2019-06-07 15:11:30',88,'18070','Si',1,5,3),(4,'2018-01-04 01:04:08','2019-03-03 07:20:38',59,'73726','Si',1,29,3),(5,'2018-01-01 11:46:43','2018-02-19 10:58:19',20,'21981','Si',2,26,4),(6,'2018-01-02 13:17:47','2019-04-02 16:07:32',25,'33149','Si',1,27,3),(7,'2018-01-03 10:40:10','2018-12-10 18:34:06',98,'90732','Si',2,28,0),(8,'2018-01-09 02:53:01','2018-06-16 21:05:21',35,'37764','Si',1,23,0),(9,'2018-01-06 12:49:09','2018-05-19 17:49:32',69,'17681','No',2,3,3),(10,'2018-01-07 20:40:42','2018-02-19 13:20:05',13,'53575','No',3,22,0);
INSERT INTO dbo.Rentas([Prestamo_id],[fechaRenta],[fechaEntrega],[Inventario_id2],[Matricula],[Externo],[Sucursal_id3],[Empleado_id2],[DiasRetraso]) VALUES(11,'2018-01-08 18:43:51','2020-04-21 18:20:06',51,'20798','Si',2,25,1),(12,'2018-01-03 05:50:38','2018-06-24 05:26:07',43,'72954','No',2,17,4),(13,'2018-01-10 19:27:21','2019-12-27 16:45:17',72,'83751','Si',2,18,1),(14,'2018-01-01 20:22:51','2018-06-11 07:22:01',76,'87210','Si',3,6,2),(15,'2018-01-10 22:54:17','2019-09-10 03:08:09',86,'38175','No',1,8,0),(16,'2018-01-02 00:41:32','2018-04-11 11:17:05',100,'7322','No',1,5,4),(17,'2018-01-01 18:41:38','2019-08-22 16:13:02',60,'71246','Si',1,21,2),(18,'2018-01-03 00:37:37','2020-04-21 01:59:08',51,'60062','No',1,3,0),(19,'2018-01-02 18:49:31','2020-01-15 02:48:59',61,'35443','No',1,4,2),(20,'2018-01-06 11:49:30','2018-10-19 20:08:41',59,'77385','Si',1,16,1);
INSERT INTO dbo.Rentas([Prestamo_id],[fechaRenta],[fechaEntrega],[Inventario_id2],[Matricula],[Externo],[Sucursal_id3],[Empleado_id2],[DiasRetraso]) VALUES(21,'2018-01-04 23:21:56','2018-11-06 20:02:48',69,'19370','No',2,16,1),(22,'2018-01-03 17:53:32','2019-08-06 22:09:49',65,'53874','Si',3,17,0),(23,'2018-01-04 03:52:01','2018-08-25 12:30:07',97,'90979','No',3,25,2),(24,'2018-01-09 11:09:47','2018-08-22 22:41:52',55,'99010','No',1,24,0),(25,'2018-01-05 21:47:26','2019-08-14 15:45:23',93,'26756','Si',3,14,1),(26,'2018-01-10 22:56:46','2018-06-12 14:12:53',29,'55642','Si',2,14,3),(27,'2018-01-02 05:21:54','2019-09-09 12:21:13',26,'19900','No',3,7,2),(28,'2018-01-02 06:29:58','2018-07-29 12:46:48',4,'12205','Si',2,10,3),(29,'2018-01-06 09:25:12','2018-11-21 07:29:57',11,'49014','No',3,3,4),(30,'2018-01-02 00:55:47','2018-04-23 07:51:05',33,'72281','No',3,27,2);
INSERT INTO dbo.Rentas([Prestamo_id],[fechaRenta],[fechaEntrega],[Inventario_id2],[Matricula],[Externo],[Sucursal_id3],[Empleado_id2],[DiasRetraso]) VALUES(31,'2018-01-09 05:28:53','2019-11-10 16:21:49',99,'56388','No',2,26,2),(32,'2018-01-04 22:39:30','2018-09-12 08:26:03',19,'95920','Si',1,7,4),(33,'2018-01-10 23:11:53','2019-02-24 23:26:43',30,'93873','Si',3,16,2),(34,'2018-01-09 20:03:07','2018-03-28 18:18:37',85,'73821','No',1,5,3),(35,'2018-01-06 01:35:41','2019-01-11 01:51:48',85,'65557','No',2,10,2),(36,'2018-01-08 12:15:45','2018-07-19 02:37:55',8,'66514','No',2,24,3),(37,'2018-01-09 18:44:32','2019-07-07 22:38:33',9,'10057','Si',1,1,1),(38,'2018-01-04 04:22:39','2018-02-25 07:22:28',58,'71489','No',2,16,0),(39,'2018-01-04 11:59:02','2019-02-26 06:56:25',96,'78724','No',3,18,0),(40,'2018-01-08 02:50:03','2019-02-01 11:44:45',43,'84716','No',1,5,0);
INSERT INTO dbo.Rentas([Prestamo_id],[fechaRenta],[fechaEntrega],[Inventario_id2],[Matricula],[Externo],[Sucursal_id3],[Empleado_id2],[DiasRetraso]) VALUES(41,'2018-01-06 03:41:00','2018-01-18 14:54:09',12,'98222','Si',2,23,1),(42,'2018-01-08 07:34:57','2019-07-06 04:37:56',68,'5354','No',3,18,3),(43,'2018-01-06 14:25:06','2018-02-06 17:13:27',15,'45659','No',1,1,1),(44,'2018-01-07 16:18:30','2020-03-03 20:23:06',79,'31407','No',1,2,2),(45,'2018-01-03 01:41:29','2019-04-12 11:06:30',59,'47964','Si',1,27,4),(46,'2018-01-06 00:25:58','2018-01-25 20:10:35',8,'82659','Si',2,11,3),(47,'2018-01-04 12:49:58','2019-12-29 19:52:50',51,'7740','Si',3,17,1),(48,'2018-01-05 01:59:54','2019-05-21 11:28:46',23,'8799','Si',3,4,1),(49,'2018-01-08 12:56:55','2018-10-05 10:58:32',6,'47217','Si',1,11,1),(50,'2018-01-02 08:46:28','2019-08-25 09:55:10',28,'4973','Si',2,19,0);
INSERT INTO dbo.Rentas([Prestamo_id],[fechaRenta],[fechaEntrega],[Inventario_id2],[Matricula],[Externo],[Sucursal_id3],[Empleado_id2],[DiasRetraso]) VALUES(51,'2018-01-08 04:49:40','2019-11-09 07:15:22',70,'63921','No',1,7,3),(52,'2018-01-10 09:05:56','2019-11-21 05:15:27',38,'42844','Si',3,8,1),(53,'2018-01-02 13:22:18','2019-06-19 11:36:37',57,'51373','Si',3,15,2),(54,'2018-01-09 18:07:36','2018-09-24 04:54:55',24,'7239','No',3,15,1),(55,'2018-01-06 16:50:09','2019-02-08 17:00:59',69,'80186','No',3,20,2),(56,'2018-01-10 21:57:38','2019-01-06 19:04:17',100,'59810','Si',1,17,0),(57,'2018-01-05 19:33:53','2019-01-26 13:19:17',63,'62271','Si',2,12,1),(58,'2018-01-05 20:00:56','2019-12-29 19:44:35',46,'78486','No',2,28,0),(59,'2018-01-05 21:22:49','2019-01-31 00:02:39',37,'69010','No',3,29,0),(60,'2018-01-06 05:14:59','2018-12-24 20:12:51',51,'86799','No',3,5,3);
INSERT INTO dbo.Rentas([Prestamo_id],[fechaRenta],[fechaEntrega],[Inventario_id2],[Matricula],[Externo],[Sucursal_id3],[Empleado_id2],[DiasRetraso]) VALUES(61,'2018-01-04 16:40:59','2019-06-29 08:56:52',58,'24776','No',1,1,4),(62,'2018-01-03 12:35:03','2019-02-23 02:43:28',77,'10992','Si',2,25,0),(63,'2018-01-04 17:41:31','2019-02-15 01:15:08',65,'99337','No',1,16,1),(64,'2018-01-02 05:14:15','2019-10-11 05:39:17',93,'84652','Si',1,21,1),(65,'2018-01-08 06:59:45','2018-02-06 01:10:37',48,'28048','Si',3,25,2),(66,'2018-01-06 23:32:28','2018-08-25 12:29:00',12,'73779','No',3,26,4),(67,'2018-01-08 18:04:01','2019-03-30 13:48:03',63,'90647','No',2,11,3),(68,'2018-01-10 12:15:55','2018-04-24 00:42:22',61,'21677','No',1,10,0),(69,'2018-01-08 13:43:11','2019-12-22 02:19:25',2,'14646','Si',2,11,2),(70,'2018-01-02 17:42:44','2020-01-05 16:50:18',4,'46907','Si',1,6,3);
INSERT INTO dbo.Rentas([Prestamo_id],[fechaRenta],[fechaEntrega],[Inventario_id2],[Matricula],[Externo],[Sucursal_id3],[Empleado_id2],[DiasRetraso]) VALUES(71,'2018-01-05 19:08:58','2019-04-28 20:45:47',70,'13851','Si',3,14,0),(72,'2018-01-10 15:43:47','2019-06-14 17:45:50',77,'31153','No',3,9,3),(73,'2018-01-04 16:31:25','2019-05-12 08:50:11',9,'36482','Si',1,13,4),(74,'2018-01-09 21:11:00','2019-08-08 08:27:13',33,'66078','Si',2,3,3),(75,'2018-01-08 03:18:39','2018-03-10 07:54:55',66,'9373','Si',1,4,4),(76,'2018-01-05 22:48:55','2020-04-05 23:35:18',45,'1265','Si',2,28,1),(77,'2018-01-10 10:23:19','2019-05-02 05:39:40',75,'55039','Si',2,11,4),(78,'2018-01-06 18:58:05','2018-10-26 23:36:34',5,'40347','No',1,24,4),(79,'2018-01-07 00:44:15','2018-05-03 01:08:02',94,'98771','No',3,10,4),(80,'2018-01-02 19:17:54','2020-03-28 12:52:38',20,'89124','No',1,20,3);
INSERT INTO dbo.Rentas([Prestamo_id],[fechaRenta],[fechaEntrega],[Inventario_id2],[Matricula],[Externo],[Sucursal_id3],[Empleado_id2],[DiasRetraso]) VALUES(81,'2018-01-02 12:19:31','2019-02-14 13:57:46',44,'95553','No',1,4,2),(82,'2018-01-07 16:45:11','2020-04-28 05:25:03',10,'32649','No',3,21,1),(83,'2018-01-05 04:34:11','2018-01-14 19:06:36',57,'86948','No',3,29,1),(84,'2018-01-10 14:59:37','2019-04-21 09:27:45',22,'12513','Si',2,22,2),(85,'2018-01-06 10:55:57','2018-04-26 02:22:04',52,'36305','Si',1,16,3),(86,'2018-01-04 11:47:02','2019-07-31 04:16:01',86,'51900','No',1,8,2),(87,'2018-01-09 10:42:15','2020-05-04 23:41:12',29,'73960','No',1,9,0),(88,'2018-01-02 03:19:04','2018-11-10 21:29:55',78,'78119','No',2,16,3),(89,'2018-01-06 02:53:21','2018-02-26 00:30:38',40,'81779','Si',1,25,2),(90,'2018-01-09 11:07:50','2019-08-23 15:29:23',34,'68476','No',2,21,1);
INSERT INTO dbo.Rentas([Prestamo_id],[fechaRenta],[fechaEntrega],[Inventario_id2],[Matricula],[Externo],[Sucursal_id3],[Empleado_id2],[DiasRetraso]) VALUES(91,'2018-01-06 16:03:08','2020-05-15 08:41:17',38,'76302','Si',2,15,1),(92,'2018-01-04 13:47:47','2018-03-20 08:25:10',15,'42512','No',3,10,4),(93,'2018-01-02 17:02:28','2018-12-13 14:51:06',63,'57337','Si',3,22,3),(94,'2018-01-09 06:22:32','2019-06-17 13:59:58',41,'68194','Si',3,23,4),(95,'2018-01-02 06:00:19','2019-09-09 01:22:39',93,'41769','Si',1,29,1),(96,'2018-01-05 07:33:23','2019-05-07 20:05:35',5,'53132','Si',1,28,3),(97,'2018-01-09 13:01:11','2019-05-05 16:50:06',15,'77331','No',2,2,4),(98,'2018-01-09 15:43:37','2018-03-08 17:24:42',93,'63645','No',2,29,2),(99,'2018-01-09 12:34:04','2019-06-01 01:00:06',90,'25439','No',2,10,1),(100,'2018-01-01 09:25:17','2019-06-16 07:14:33',64,'22756','Si',2,5,4);


INSERT INTO dbo.Maestros([Maestro_id],[Matricula_ma],[Nombres_ma],[Apellido1_ma],[Apellido2_ma],[Facultad_id3],[NumTel_ma],[Correo_ma],[TipoLector]) VALUES(1,'82592484','Samantha','Guthrie','Stuart',10,'8164733632','neque.Nullam.ut@dictum.co.uk','Maestro'),(2,'84611941','Mohammad','Tillman','Cline',2,'8121271545','nec.mollis@hendrerit.net','Maestro'),(3,'87061922','Randall','Russo','Butler',6,'8138993999','dictum.placerat.augue@enimCurabitur.co.uk','Maestro'),(4,'83103255','Uriel','Carrillo','Case',2,'8155559362','ornare.In@maurisipsum.ca','Maestro'),(5,'85963830','Daryl','Decker','Gilliam',1,'8144932274','ante@ornarelibero.net','Maestro'),(6,'87168868','Pamela','Mclaughlin','Orr',8,'8155174454','et.rutrum.non@etmalesuadafames.edu','Maestro'),(7,'80429251','Ella','Stark','Blankenship',7,'8125656915','velit@feugiat.org','Maestro'),(8,'80020602','Katell','Gates','Jensen',4,'8141487341','lectus.rutrum@Aliquamgravida.edu','Maestro'),(9,'82007225','Odysseus','Malone','Manning',6,'8126438334','tellus.Phasellus.elit@leoinlobortis.net','Maestro'),(10,'83659224','John','Donaldson','Bell',8,'8172527319','neque@nec.org','Maestro');
INSERT INTO dbo.Maestros([Maestro_id],[Matricula_ma],[Nombres_ma],[Apellido1_ma],[Apellido2_ma],[Facultad_id3],[NumTel_ma],[Correo_ma],[TipoLector]) VALUES(11,'84098141','Brent','Ward','Kerr',5,'8126186435','auctor@turpis.org','Maestro'),(12,'84808553','Ulla','Harding','Wheeler',10,'8137624585','enim.Etiam@nullaDonec.ca','Maestro'),(13,'85741704','Tara','Beasley','Valenzuela',6,'8121456912','faucibus.orci.luctus@Curabitursedtortor.net','Maestro'),(14,'85164968','Wallace','Jenkins','Reed',5,'8128724741','amet.consectetuer@odio.com','Maestro'),(15,'84138955','Tanek','Solis','Prince',3,'8124386487','Donec.fringilla.Donec@ultrices.co.uk','Maestro'),(16,'83767206','Amethyst','Fitzpatrick','Frederick',1,'8128887765','orci.Ut.semper@convalliserat.edu','Maestro'),(17,'84654051','Demetria','Bishop','Mccray',3,'8136249611','placerat.Cras.dictum@tellussem.net','Maestro'),(18,'81012822','Maile','Goff','Vargas',9,'8134292151','tincidunt@Maecenasliberoest.co.uk','Maestro'),(19,'85360358','Phillip','Trujillo','Joseph',5,'8126782415','dui@variusultrices.co.uk','Maestro'),(20,'85668601','Shana','Knight','Boone',8,'8133934158','porttitor.eros@felis.ca','Maestro');
INSERT INTO dbo.Maestros([Maestro_id],[Matricula_ma],[Nombres_ma],[Apellido1_ma],[Apellido2_ma],[Facultad_id3],[NumTel_ma],[Correo_ma],[TipoLector]) VALUES(21,'88022432','Baker','Sexton','Ayala',4,'8113233412','lorem.semper@viverraMaecenas.org','Maestro'),(22,'83143167','Graiden','Dennis','Short',6,'8161474579','non.bibendum@Donecnonjusto.ca','Maestro'),(23,'81245078','David','Dudley','Perkins',3,'8162578251','sed@Pellentesqueut.ca','Maestro'),(24,'87792590','Wayne','Valentine','Monroe',2,'8187749451','tempus.eu@egestasascelerisque.net','Maestro'),(25,'81106775','Rafael','Cabrera','Pierce',7,'8128816876','tincidunt.Donec@felisorciadipiscing.org','Maestro'),(26,'86122246','Danielle','Porter','Jimenez',3,'8169979667','per.conubia.nostra@fermentumrisus.com','Maestro'),(27,'81080449','Odysseus','Cross','Benson',4,'8164168237','porta.elit.a@egestas.edu','Maestro'),(28,'87773495','Nash','Robles','Bullock',7,'8113925857','ipsum.porta@Quisque.org','Maestro'),(29,'85505856','Charde','Haynes','Knight',8,'8117357769','id@auctorveliteget.com','Maestro'),(30,'82513861','Melissa','Avila','Garrett',5,'8124764915','dui.quis.accumsan@et.co.uk','Maestro');
INSERT INTO dbo.Maestros([Maestro_id],[Matricula_ma],[Nombres_ma],[Apellido1_ma],[Apellido2_ma],[Facultad_id3],[NumTel_ma],[Correo_ma],[TipoLector]) VALUES(31,'87582731','Baxter','Dejesus','Alford',4,'8195635361','eu@lorem.com','Maestro'),(32,'84317081','Malachi','Tucker','Juarez',9,'8112264882','massa.Suspendisse@est.net','Maestro'),(33,'83312947','Ainsley','Norris','Hale',5,'8116569462','molestie@etnetuset.ca','Maestro'),(34,'84485554','Calista','Porter','Garner',8,'8119774516','Phasellus.libero.mauris@ornarelectusjusto.com','Maestro'),(35,'84390905','Garrett','Huff','Whitaker',9,'8134123965','at.fringilla@molestie.com','Maestro'),(36,'85109058','Cheryl','Mills','Sparks',8,'8178417552','enim@semelitpharetra.com','Maestro'),(37,'85539788','Wing','Yates','Mckay',2,'8153153449','tristique.aliquet@magnanec.org','Maestro'),(38,'85500692','Tyrone','Rosa','Parrish',7,'8182514835','Phasellus.in.felis@nostraper.com','Maestro'),(39,'80609472','Irene','Hayden','Nieves',3,'8187787894','id@Nullatinciduntneque.edu','Maestro'),(40,'85318025','Gil','Colon','Kennedy',5,'8162183838','magna@ridiculus.ca','Maestro');
INSERT INTO dbo.Maestros([Maestro_id],[Matricula_ma],[Nombres_ma],[Apellido1_ma],[Apellido2_ma],[Facultad_id3],[NumTel_ma],[Correo_ma],[TipoLector]) VALUES(41,'85598918','Ashton','Gibbs','Mcmahon',6,'8168491583','amet.metus@eratvitae.org','Maestro'),(42,'87638454','Alden','Schmidt','Watts',1,'8178457899','elementum@sit.co.uk','Maestro'),(43,'85015997','Hermione','Gross','Crosby',1,'8151541726','egestas@at.edu','Maestro'),(44,'86394214','Ferris','Hunt','Caldwell',3,'8158622531','non@eratVivamus.edu','Maestro'),(45,'86327021','Noble','Guy','Walton',3,'8137758544','massa@Etiam.org','Maestro'),(46,'85954648','Josephine','Cleveland','Rodriquez',6,'8125625236','nibh@mifelisadipiscing.org','Maestro'),(47,'82517286','Yardley','May','Gamble',8,'8124512636','lectus@nulla.com','Maestro'),(48,'81254876','Hammett','Hawkins','Weber',10,'8128377321','eu.ultrices@etmagnisdis.org','Maestro'),(49,'88767861','Dylan','Fields','Buckley',5,'8135695194','et@eu.com','Maestro'),(50,'81784211','MacKensie','Albert','Mcknight',5,'8138626637','scelerisque.sed.sapien@atsemmolestie.edu','Maestro');


INSERT INTO dbo.Inventario([Inventario_id],[Estatus],[Libro_id2],[Sucursal_id2]) VALUES(1,'Prestado',33,1),(2,'Prestado',80,1),(3,'Prestado',57,1),(4,'Prestado',68,1),(5,'Prestado',94,1),(6,'Prestado',95,3),(7,'Prestado',47,3),(8,'Disponible',26,2),(9,'Prestado',41,3),(10,'Prestado',44,3);
INSERT INTO dbo.Inventario([Inventario_id],[Estatus],[Libro_id2],[Sucursal_id2]) VALUES(11,'Disponible',51,2),(12,'Prestado',38,3),(13,'Disponible',32,3),(14,'Disponible',32,2),(15,'Disponible',88,2),(16,'Disponible',37,1),(17,'Disponible',24,1),(18,'Disponible',81,1),(19,'Prestado',46,1),(20,'Prestado',91,1);
INSERT INTO dbo.Inventario([Inventario_id],[Estatus],[Libro_id2],[Sucursal_id2]) VALUES(21,'Prestado',98,1),(22,'Prestado',16,2),(23,'Prestado',87,2),(24,'Disponible',48,2),(25,'Prestado',28,3),(26,'Disponible',19,3),(27,'Disponible',100,1),(28,'Prestado',33,2),(29,'Prestado',42,1),(30,'Prestado',28,1);
INSERT INTO dbo.Inventario([Inventario_id],[Estatus],[Libro_id2],[Sucursal_id2]) VALUES(31,'Prestado',69,3),(32,'Prestado',95,2),(33,'Prestado',64,3),(34,'Disponible',78,3),(35,'Prestado',15,3),(36,'Disponible',17,3),(37,'Disponible',30,1),(38,'Disponible',34,3),(39,'Disponible',41,2),(40,'Prestado',33,1);
INSERT INTO dbo.Inventario([Inventario_id],[Estatus],[Libro_id2],[Sucursal_id2]) VALUES(41,'Disponible',72,2),(42,'Disponible',65,1),(43,'Prestado',27,2),(44,'Disponible',14,3),(45,'Prestado',5,1),(46,'Prestado',6,2),(47,'Disponible',98,1),(48,'Prestado',64,2),(49,'Prestado',70,3),(50,'Disponible',4,1);
INSERT INTO dbo.Inventario([Inventario_id],[Estatus],[Libro_id2],[Sucursal_id2]) VALUES(51,'Prestado',16,2),(52,'Disponible',100,2),(53,'Disponible',54,3),(54,'Prestado',42,3),(55,'Prestado',18,2),(56,'Prestado',61,3),(57,'Prestado',13,2),(58,'Prestado',81,2),(59,'Disponible',25,2),(60,'Prestado',7,2);
INSERT INTO dbo.Inventario([Inventario_id],[Estatus],[Libro_id2],[Sucursal_id2]) VALUES(61,'Prestado',75,2),(62,'Prestado',35,3),(63,'Disponible',72,2),(64,'Disponible',66,3),(65,'Disponible',95,3),(66,'Prestado',77,1),(67,'Prestado',71,2),(68,'Disponible',26,3),(69,'Disponible',7,3),(70,'Prestado',41,1);
INSERT INTO dbo.Inventario([Inventario_id],[Estatus],[Libro_id2],[Sucursal_id2]) VALUES(71,'Disponible',92,2),(72,'Disponible',69,1),(73,'Disponible',51,3),(74,'Disponible',96,2),(75,'Prestado',15,2),(76,'Prestado',16,1),(77,'Disponible',78,1),(78,'Disponible',58,3),(79,'Prestado',73,2),(80,'Disponible',20,3);
INSERT INTO dbo.Inventario([Inventario_id],[Estatus],[Libro_id2],[Sucursal_id2]) VALUES(81,'Disponible',91,1),(82,'Prestado',63,1),(83,'Prestado',64,3),(84,'Disponible',40,3),(85,'Disponible',3,2),(86,'Disponible',97,2),(87,'Disponible',74,2),(88,'Prestado',42,3),(89,'Disponible',12,2),(90,'Disponible',52,2);
INSERT INTO dbo.Inventario([Inventario_id],[Estatus],[Libro_id2],[Sucursal_id2]) VALUES(91,'Prestado',85,2),(92,'Prestado',82,2),(93,'Disponible',24,2),(94,'Prestado',23,1),(95,'Disponible',51,3),(96,'Disponible',77,2),(97,'Prestado',92,3),(98,'Prestado',53,3),(99,'Prestado',75,1),(100,'Disponible',96,1);


INSERT INTO [dbo].[TipoPastas]
           ([Pasta_id]
           ,[Nombre_p])
     VALUES
           (1,'Cuero'),(2,'Dura'),(3,'Est�ndar'),(4,'Encartonada'),(5,'Tapa suelta'),(6,'Carton�');

INSERT INTO dbo.Libro([Libro_id],[Titulo],[Autor_id2],[Genero_id2],[Edicion],[Pasta_id2],[Editorial_id2]) VALUES(1,'En busca del tiempo perdido',9,4,4,1,3),(2,'Cuentos',17,6,1,2,4),(3,'Poeta en Nueva York',11,2,1,2,3),(4,'El viejo y el mar',15,4,4,1,2),(5,'Grandes esperanzas',9,9,1,2,5),(6,'Las metamorfosis',10,3,2,1,3),(7,'Casa de mu�ecas',2,5,1,1,2),(8,'Confesiones de una m�scara',7,9,3,2,2),(9,'Al faro',11,10,4,2,3),(10,'Matar a un ruise�or',12,9,4,1,2);
INSERT INTO dbo.Libro([Libro_id],[Titulo],[Autor_id2],[Genero_id2],[Edicion],[Pasta_id2],[Editorial_id2]) VALUES(11,'La guerra del fin del mundo',11,3,3,2,4),(12,'Los miserables',15,9,2,1,3),(13,'Fausto',10,5,1,1,2),(14,'Libro del desasosiego',16,9,2,2,4),(15,'La muerte de Artemio CruzFahrenheit 451',2,3,3,1,3),(16,'1984',19,4,3,2,4),(17,'Si esto es un hombre',17,6,3,2,2),(18,'El tambor de hojalata',16,9,2,1,2),(19,'Si esto es un hombre',3,3,3,2,5),(20,'Poes�as',16,1,3,1,1);
INSERT INTO dbo.Libro([Libro_id],[Titulo],[Autor_id2],[Genero_id2],[Edicion],[Pasta_id2],[Editorial_id2]) VALUES(21,'Historia y decadencia del Imperio',2,10,2,2,4),(22,'Madame Bovary',1,1,4,1,5),(23,'Historia y decadencia del Imperio',15,8,2,2,3),(24,'La isla del tesoro',5,7,4,2,4),(25,'El Tartufo',14,5,2,1,3),(26,'Moby Dick',9,9,4,2,6),(27,'Canto general',11,8,3,2,1),(28,'El se�or de las moscas',8,8,3,2,1),(29,'Rojo y negro',6,5,2,2,4),(30,'Ensayo sobre la ceguera',10,3,4,2,6);
INSERT INTO dbo.Libro([Libro_id],[Titulo],[Autor_id2],[Genero_id2],[Edicion],[Pasta_id2],[Editorial_id2]) VALUES(31,'Orgullo y prejuicio',19,9,2,2,2),(32,'El t�nel',20,2,1,2,3),(33,'El viejo y el mar',17,1,2,1,6),(34,'Cuentos',16,7,3,2,3),(35,'Crimen y castigo',5,9,3,1,1),(36,'La muerte de Artemio CruzFahrenheit 451',11,4,4,1,6),(37,'Poeta en Nueva York',17,4,4,1,5),(38,'Dr�cula',9,4,1,1,4),(39,'Dr�cula',1,4,3,1,2),(40,'El guardi�n entre el centeno',4,5,1,1,6);
INSERT INTO dbo.Libro([Libro_id],[Titulo],[Autor_id2],[Genero_id2],[Edicion],[Pasta_id2],[Editorial_id2]) VALUES(41,'Cuentos',3,3,1,2,1),(42,'El nombre de la rosa',5,9,3,2,5),(43,'Las aventuras de Huckelberry Finn',8,10,3,1,4),(44,'Las mil y una noches',9,6,1,1,6),(45,'El viejo y el mar',16,9,2,1,2),(46,'El lazarillo de Tormes',12,2,1,1,5),(47,'En el camino',9,3,3,2,6),(48,'La Eneida',19,8,1,2,4),(49,'La divina comedia',13,9,2,1,3),(50,'Libro del desasosiego',11,3,3,2,4);
INSERT INTO dbo.Libro([Libro_id],[Titulo],[Autor_id2],[Genero_id2],[Edicion],[Pasta_id2],[Editorial_id2]) VALUES(51,'Al faro',5,4,2,1,5),(52,'La isla del tesoro',17,10,2,2,1),(53,'Dr�cula',9,3,1,1,1),(54,'La odisea',8,5,4,2,1),(55,'Confesiones de una m�scara',3,9,3,1,1),(56,'Historia y decadencia del Imperio',8,7,4,2,5),(57,'Dr�cula',17,7,4,2,6),(58,'Orgullo y prejuicio',7,2,1,2,4),(59,'Matar a un ruise�or',4,10,1,1,4),(60,'Un mundo feliz',13,5,2,1,5);
INSERT INTO dbo.Libro([Libro_id],[Titulo],[Autor_id2],[Genero_id2],[Edicion],[Pasta_id2],[Editorial_id2]) VALUES(61,'El extranjero',7,1,1,2,5),(62,'Matar a un ruise�or',18,10,1,1,6),(63,'Hamlet',17,7,3,1,6),(64,'Las mil y una noches',2,1,2,1,1),(65,'Lo que el viento se llev�',11,7,3,2,5),(66,'El guardi�n entre el centeno',13,10,3,2,3),(67,'Kim',9,8,2,1,3),(68,'Kim',17,5,4,1,4),(69,'Estudio en escarlata',4,9,2,2,5),(70,'La insoportable levedad del ser',5,2,2,1,3);
INSERT INTO dbo.Libro([Libro_id],[Titulo],[Autor_id2],[Genero_id2],[Edicion],[Pasta_id2],[Editorial_id2]) VALUES(71,'El extranjero',2,2,3,1,1),(72,'Casa de mu�ecas',13,4,2,2,2),(73,'Si esto es un hombre',20,3,3,2,6),(74,'La insoportable levedad del ser',17,2,1,2,5),(75,'Ensayo sobre la ceguera',20,5,3,2,1),(76,'Rayuela',6,3,4,2,1),(77,'Las aventuras de Huckelberry Finn',1,4,2,2,6),(78,'La comedia humana',18,1,2,2,5),(79,'Olvidado rey Gud�',12,10,1,1,3),(80,'Luces de bohemia',19,9,1,2,4);
INSERT INTO dbo.Libro([Libro_id],[Titulo],[Autor_id2],[Genero_id2],[Edicion],[Pasta_id2],[Editorial_id2]) VALUES(81,'Los viajes de Gulliver',4,7,4,1,3),(82,'Las uvas de la ira',2,8,3,2,4),(83,'El conde de Montecristo',16,9,1,1,6),(84,'El tambor de hojalata',4,7,3,2,6),(85,'Dr�cula',20,6,4,1,3),(86,'La odisea',13,8,1,2,6),(87,'La insoportable levedad del ser',18,3,3,1,4),(88,'Las metamorfosis',5,5,2,1,6),(89,'Las metamorfosis',15,6,4,1,2),(90,'Las aventuras de Huckelberry Finn',8,3,2,2,3);
INSERT INTO dbo.Libro([Libro_id],[Titulo],[Autor_id2],[Genero_id2],[Edicion],[Pasta_id2],[Editorial_id2]) VALUES(91,'Don Quijote de la mancha',10,5,1,2,4),(92,'Los miserables',3,5,3,2,3),(93,'Los miserables',6,2,3,1,5),(94,'Si esto es un hombre',10,2,1,1,6),(95,'100 a�os de Soledad',4,8,2,1,6),(96,'Orgullo y prejuicio',2,5,1,2,5),(97,'Pr�ncipes de Maine',13,7,2,2,2),(98,'Ddo�a Perfecta',9,6,2,2,4),(99,'La metamorfosis',3,6,4,2,3),(100,'Poes�as completas',18,10,4,1,6);


INSERT INTO [dbo].[Empleados]
           ([Empleado_id]
           ,[Nombres_em]
           ,[Apellido1_em]
           ,[Apellido2_em]
           ,[FechaNac]
           ,[Sucursal_id3])
     VALUES
(1,'Justin','Contreras','Kirby','1984-08-28',1),(2,'Kibo','Beach','Jackson','1995-03-09',1),(3,'Carlos','Vinson','Carrillo','1992-01-20',2),(4,'Fallon','Saunders','Watkins','1983-07-25',3),(5,'Duncan','Nelson','Shields','1991-08-24',2),(6,'Jamalia','Mcfarland','Mitchell','1982-02-11',2),(7,'Cameron','Mueller','Stevens','1990-05-09',2),(8,'Hamilton','Rojas','Black','1988-09-30',1),(9,'Vincent','Soto','Finley','1995-01-23',1),(10,'Edan','French','Bowers','1989-01-02',3),
(11,'Curran','Santana','Finley','1986-09-14',2),(12,'James','Richardson','Mccarthy','1990-10-25',3),(13,'Ayanna','Joseph','Ortiz','1992-12-25',3),(14,'Kitra','Wong','Pollard','1993-11-30',2),(15,'Kareem','Torres','Petty','1983-06-12',3),(16,'Lucas','Scott','Jefferson','1987-07-10',2),(17,'Gloria','Holcomb','Alford','1988-07-27',2),(18,'Heather','Whitley','Eaton','1984-10-03',3),(19,'Candice','Barnett','Pickett','1993-12-16',1),(20,'Graham','Neal','Gill','1988-08-19',1),
(21,'Whilemina','Palmer','Walls','1982-05-19',2),(22,'Dillon','Harrington','Norton','1989-05-10',2),(23,'Isabella','Carver','Gonzales','1991-03-19',1),(24,'Alexa','Houston','Stuart','1984-11-14',3),(25,'Joy','Heath','Underwood','1989-12-29',2),(26,'Lyle','Sullivan','Reese','1982-05-03',3),(27,'Owen','Weber','Love','1992-09-16',2),(28,'Kieran','Beck','Mueller','1988-06-15',2),(29,'Reed','Ward','Sweeney','1986-06-09',3),(30,'Clare','Guerra','Lara','1993-10-17',3);


INSERT INTO [dbo].[Multas] ([Multa_id] ,[Matricula] ,[fechaRenta] ,[fechaEntrega] ,[DiasRetraso] ,[PrecioMulta])VALUES
(11,'97929424','2018-01-10 00:57:10','2018-01-11 11:31:08',1,10),(12,'87711374','2018-01-01 05:19:16','2018-01-16 12:10:27',15,150),(13,'82309363','2018-01-03 21:17:45','2018-01-17 22:55:47',14,140),(14,'92623422','2018-01-10 21:51:21','2018-01-19 01:21:42',9,90),(15,'87411546','2018-01-07 21:57:53','2018-01-11 13:51:48',4,40),(16,'84986404','2018-01-08 19:40:58','2018-01-17 14:47:46',9,90),(17,'80369596','2018-01-08 23:26:26','2018-01-15 07:51:38',7,70),(18,'91399155','2018-01-07 12:26:42','2018-01-20 06:20:03',13,130),(19,'92107113','2018-01-05 01:29:30','2018-01-15 06:23:57',10,100),(20,'99232172','2018-01-02 15:49:45','2018-01-20 09:54:57',18,180),
(21,'82610961','2018-01-09 16:23:47','2018-01-17 17:46:01',8,80),(22,'99728619','2018-01-02 07:39:15','2018-01-17 06:25:58',15,150),(23,'80616272','2018-01-10 22:28:11','2018-01-11 18:31:40',1,10),(24,'83143051','2018-01-02 13:45:03','2018-01-19 15:28:21',17,170),(25,'82687945','2018-01-06 18:56:41','2018-01-12 21:38:28',6,60),(26,'82746707','2018-01-09 11:34:53','2018-01-16 00:58:53',7,70),(27,'94496678','2018-01-02 02:27:08','2018-01-16 02:37:35',14,140),(28,'92274735','2018-01-06 12:24:43','2018-01-16 09:36:54',10,10),(29,'91867010','2018-01-05 00:37:27','2018-01-19 00:38:20',14,140),(30,'94734807','2018-01-04 02:36:01','2018-01-17 01:28:11',13,130),
(31,'83729155','2018-01-02 02:08:32','2018-01-19 07:49:07',17,170),(32,'91133805','2018-01-09 16:11:50','2018-01-12 07:17:24',3,30),(33,'86725805','2018-01-09 18:03:29','2018-01-13 01:39:21',4,40),(34,'82788923','2018-01-09 17:11:24','2018-01-20 11:21:27',11,110),(35,'97215086','2018-01-07 11:05:28','2018-01-14 22:18:52',7,70),(36,'80972116','2018-01-09 14:39:33','2018-01-16 07:24:49',7,70),(37,'97404042','2018-01-05 20:54:57','2018-01-13 14:35:22',8,80),(38,'98558723','2018-01-04 03:38:46','2018-01-16 20:37:37',12,120),(39,'86419965','2018-01-10 05:06:29','2018-01-18 07:44:07',8,80),(40,'99513138','2018-01-07 18:52:50','2018-01-18 16:59:40',11,110),
 (41,'95993488','2018-01-03 04:44:04','2018-01-14 08:05:17',11,110),(42,'98169357','2018-01-02 10:05:01','2018-01-13 15:20:01',11,110),(43,'89433611','2018-01-01 11:26:22','2018-01-12 08:21:38',11,110),(44,'88208435','2018-01-01 23:57:04','2018-01-14 13:18:33',13,130),(45,'80154865','2018-01-08 03:05:32','2018-01-11 05:40:40',3,30),(46,'83466080','2018-01-10 09:43:11','2018-01-18 10:07:37',8,80),(47,'86185230','2018-01-09 05:56:41','2018-01-12 00:05:14',3,30),(48,'90686536','2018-01-03 16:02:24','2018-01-13 01:47:49',10,100),(49,'89436292','2018-01-07 07:52:23','2018-01-13 23:25:45',6,60),(50,'97677343','2018-01-05 18:14:25','2018-01-13 03:17:03',8,80),
 (51,'93573588','2018-01-06 13:20:12','2018-01-17 05:08:52',11,110),(52,'86300956','2018-01-10 19:27:25','2018-01-18 09:50:41',8,80),(53,'97336945','2018-01-04 06:36:06','2018-01-12 19:39:52',8,80),(54,'98672122','2018-01-06 19:33:01','2018-01-15 11:34:38',9,90),(55,'85913139','2018-01-01 02:29:52','2018-01-14 07:04:42',13,130),(56,'88400023','2018-01-07 21:01:21','2018-01-15 18:23:10',8,80),(57,'82896356','2018-01-05 17:25:49','2018-01-20 00:16:34',15,150),(58,'99089276','2018-01-01 21:34:32','2018-01-13 10:01:45',12,120),(59,'89546307','2018-01-08 11:07:41','2018-01-11 04:04:40',3,30),(60,'86493079','2018-01-04 23:49:59','2018-01-20 03:56:52',16,160),
 (61,'87523572','2018-01-05 11:19:26','2018-01-16 02:21:59',11,110),(62,'88849676','2018-01-08 09:58:30','2018-01-19 22:57:43',11,110),(63,'99643349','2018-01-10 02:44:22','2018-01-17 06:45:12',7,70),(64,'99538364','2018-01-05 02:28:29','2018-01-16 06:06:23',11,110),(65,'90890492','2018-01-09 14:13:12','2018-01-16 08:22:24',7,70),(66,'96405809','2018-01-03 08:58:16','2018-01-11 13:05:42',5,50),(67,'83117574','2018-01-06 18:15:46','2018-01-19 19:32:43',13,130),(68,'92908188','2018-01-04 14:10:50','2018-01-17 03:56:40',13,130),(69,'86611710','2018-01-10 18:22:36','2018-01-19 22:18:12',9,90),(70,'89891367','2018-01-03 14:29:56','2018-01-15 17:24:50',12,120),
 (71,'83899278','2018-01-07 02:01:55','2018-01-17 09:32:01',10,100),(72,'91018672','2018-01-02 22:07:34','2018-01-14 21:31:51',12,120),(73,'94254889','2018-01-09 22:37:21','2018-01-18 14:55:15',9,90),(74,'90720146','2018-01-08 12:18:58','2018-01-20 15:00:39',12,120),(75,'93554989','2018-01-02 03:58:00','2018-01-19 19:31:00',17,170),(76,'83166324','2018-01-05 21:57:25','2018-01-17 18:37:37',12,120),(77,'97619481','2018-01-02 10:14:53','2018-01-13 07:04:19',11,110),(78,'89669478','2018-01-02 13:05:02','2018-01-11 16:09:39',9,90),(79,'85623626','2018-01-04 01:50:37','2018-01-15 02:15:09',11,110),(80,'99842744','2018-01-02 06:34:52','2018-01-11 01:04:43',9,90),
 (81,'95466155','2018-01-03 01:06:30','2018-01-11 23:58:05',8,80),(82,'86257190','2018-01-10 14:43:31','2018-01-17 10:41:43',7,70),(83,'87729694','2018-01-06 04:17:54','2018-01-16 13:10:23',10,100),(84,'94888399','2018-01-01 08:07:34','2018-01-14 05:33:56',13,130),(85,'82163834','2018-01-08 04:49:24','2018-01-11 20:46:50',3,30),(86,'80375528','2018-01-03 18:14:21','2018-01-18 08:48:01',15,150),(87,'83462390','2018-01-08 08:13:33','2018-01-15 19:16:52',7,70),(88,'87023086','2018-01-07 16:50:10','2018-01-11 09:58:08',4,40),(89,'88536515','2018-01-10 22:50:41','2018-01-20 01:22:49',10,100),(90,'95136795','2018-01-06 13:25:01','2018-01-20 09:05:15',14,140),
 (91,'98574417','2018-01-04 02:25:14','2018-01-11 16:00:05',7,70),(92,'87176746','2018-01-03 19:57:08','2018-01-16 08:38:05',13,130),(93,'98285509','2018-01-01 13:12:13','2018-01-11 19:53:23',10,100),(94,'90974645','2018-01-10 12:00:30','2018-01-17 06:58:54',7,70),(95,'98380499','2018-01-01 11:21:39','2018-01-12 13:22:23',11,110),(96,'88677125','2018-01-10 15:06:48','2018-01-12 22:49:41',2,20),(97,'86622063','2018-01-01 15:29:26','2018-01-12 17:18:07',11,110),(98,'82929532','2018-01-08 04:14:09','2018-01-16 11:04:45',8,80),(99,'90690220','2018-01-07 09:55:23','2018-01-16 08:01:23',11,110),(100,'80496284','2018-01-05 06:34:16','2018-01-17 21:19:42',12,120);


 INSERT INTO [dbo].[Sucursales]
           ([Sucursal_id]
           ,[Nombre_su])
     VALUES
          (1,'Biblioteca Sextina'),(2,'Biblioteca General'),(3,'Biblioteca Marco');


INSERT INTO [dbo].[Facultades]
           (Facultad_id
           ,Nombre_fac)
     VALUES
           (1,'Facultad de Ingenieria'), (2,'Facultad de Artes'), (3,'Facultad de Psicologia'), (4,'Facultad de Medicina'), (5,'Facultad de Ciencias Politicas'), (6,'Facultad de Biologia'), (7,'Facultad de Quimica'), (8,'Facultad de Ciencias exactas'), (9,'Facultad de Arquitectura'), (10,'Facultad de Administracion');



INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (24, N'80172492', N'Shad', N'Hanson', N'Valencia', 7, N'8174178841', N'mauris@Phasellus.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (85, N'80924778', N'Akeem', N'Russo', N'Bolton', 5, N'8198134177', N'et@ligulaelit.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (68, N'80941006', N'Ivor', N'Clay', N'Le', 10, N'8121272853', N'fermentum@liberoProinmi.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (56, N'81098213', N'Nero', N'Hayden', N'Shannon', 2, N'8188151935', N'nunc@aliquamenim.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (21, N'81147200', N'Demetria', N'Luna', N'Mays', 10, N'8132935467', N'Integer.in@lectusCum.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (43, N'81398996', N'Benjamin', N'Mcneil', N'Snider', 6, N'8117465273', N'lacus.Cras@ullamcorper.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (25, N'81503978', N'Brenna', N'Gilbert', N'Alvarez', 8, N'8138725388', N'Vivamus.non@atnisi.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (30, N'81661269', N'Rose', N'Mosley', N'Graham', 8, N'8179639598', N'et.risus@cursuset.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (75, N'81882418', N'Kamal', N'Coffey', N'Pacheco', 8, N'8137752254', N'Integer.id.magna@lacinia.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (87, N'81943217', N'Nayda', N'Slater', N'Underwood', 9, N'8136496423', N'in.felis@odiosempercursus.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (7, N'82141890', N'Curran', N'Giles', N'Richmond', 8, N'8126155322', N'penatibus@ametrisusDonec.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (4, N'82654959', N'Upton', N'Dudley', N'Morton', 9, N'8156322583', N'scelerisque.neque.Nullam@velit.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (1, N'82659104', N'Galena', N'Carver', N'Aguirre', 6, N'8123964586', N'dictum.eu@auctorodioa.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (28, N'83326296', N'Drake', N'Glass', N'Strickland', 9, N'8178459487', N'magna.Sed.eu@dignissimlacusAliquam.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (13, N'83633022', N'Cheryl', N'Dickson', N'Moon', 7, N'8185693593', N'venenatis.vel.faucibus@massarutrummagna.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (62, N'83771979', N'Macey', N'Parrish', N'Dorsey', 6, N'8138534485', N'nisi.a@lectusante.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (45, N'84248459', N'Abbot', N'Donovan', N'Gill', 9, N'8181261447', N'nec.tempus@ultrices.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (90, N'85073606', N'Yetta', N'Carpenter', N'Phelps', 6, N'8134491555', N'congue@quis.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (97, N'85223615', N'Todd', N'Kramer', N'Lara', 3, N'8159652463', N'dapibus.rutrum.justo@sociisnatoque.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (44, N'85316868', N'Larissa', N'Cain', N'Emerson', 1, N'8111448125', N'sed@necquam.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (35, N'85326231', N'Odysseus', N'Jenkins', N'Riddle', 10, N'8145887182', N'tellus.non.magna@eudui.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (91, N'85406421', N'Margaret', N'Hanson', N'Young', 4, N'8191788414', N'purus.Duis@orciluctuset.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (36, N'85530465', N'Roth', N'Tucker', N'Cardenas', 8, N'8175745128', N'montes.nascetur@porttitorinterdumSed.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (29, N'85560419', N'Kadeem', N'Mcpherson', N'Jacobs', 8, N'8179742335', N'ac@montesnascetur.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (99, N'85621753', N'Micah', N'Carlson', N'Willis', 10, N'8191149939', N'ornare.libero@purusDuiselementum.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (15, N'85712593', N'Upton', N'Jefferson', N'Davenport', 5, N'8174858373', N'sem.consequat.nec@nuncQuisqueornare.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (37, N'86761763', N'Vaughan', N'Horn', N'Christian', 9, N'8155414269', N'lorem@ligulatortordictum.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (60, N'87098136', N'Zenia', N'Richardson', N'Chan', 6, N'8194733821', N'Cras.vulputate@NullafacilisisSuspendisse.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (67, N'87438117', N'Bo', N'Cobb', N'Whitehead', 8, N'8146141357', N'in@sedfacilisis.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (61, N'87606401', N'Nissim', N'Pitts', N'Ortega', 10, N'8159447622', N'fringilla.est.Mauris@venenatislacusEtiam.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (19, N'87629906', N'Valentine', N'Blevins', N'Calhoun', 7, N'8158138696', N'metus.In.lorem@Vestibulumanteipsum.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (69, N'87805946', N'Duncan', N'Kinney', N'Poole', 7, N'8193539589', N'luctus.Curabitur.egestas@tellusimperdietnon.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (53, N'88606157', N'Graiden', N'Young', N'Sloan', 8, N'8117549618', N'lorem.vehicula@dolorNulla.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (88, N'88660640', N'Audrey', N'Carr', N'Wilkerson', 9, N'8171773745', N'in@ametornare.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (20, N'88759207', N'Andrew', N'Duran', N'Lawrence', 7, N'8149214423', N'in.molestie.tortor@nasceturridiculus.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (41, N'88898984', N'Noel', N'Mccray', N'Nichols', 5, N'8138647622', N'interdum@lobortisnisinibh.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (52, N'88909051', N'Ulysses', N'Fitzgerald', N'Franks', 5, N'8135943827', N'venenatis.lacus.Etiam@adipiscingenimmi.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (48, N'89017533', N'Craig', N'Mccullough', N'Ashley', 1, N'8199161542', N'purus@luctusaliquetodio.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (33, N'89078012', N'Lara', N'Barker', N'Charles', 1, N'8131545927', N'eu@metuseu.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (77, N'89197976', N'Whilemina', N'Cleveland', N'Skinner', 9, N'8166592992', N'risus@loremsemper.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (65, N'89307264', N'Price', N'Bruce', N'James', 6, N'8179272439', N'nonummy.ultricies.ornare@vitaemaurissit.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (82, N'89526735', N'Burton', N'Blake', N'Atkins', 7, N'8197178473', N'semper.Nam.tempor@orcilobortisaugue.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (49, N'89725074', N'Kennan', N'Lopez', N'Lloyd', 3, N'8135865638', N'ac.mi@Aenean.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (86, N'89862196', N'Patience', N'Small', N'Francis', 1, N'8154712837', N'quam.Curabitur.vel@semegestasblandit.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (23, N'89899911', N'Naida', N'Reeves', N'Hickman', 2, N'8145993971', N'tempus.eu@leo.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (11, N'90093452', N'Ima', N'Newton', N'Hall', 2, N'8132442497', N'Nam.ligula@ornareIn.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (78, N'90201302', N'Judah', N'Freeman', N'Hayes', 10, N'8113995526', N'mi@nislelementum.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (81, N'90225488', N'Kenneth', N'Pena', N'Horn', 1, N'8136217448', N'dui.nec@imperdietnec.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (57, N'90469968', N'Martha', N'Maldonado', N'William', 8, N'8125744216', N'egestas.a.scelerisque@liberomaurisaliquam.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (83, N'90489041', N'Brenda', N'Forbes', N'Stein', 5, N'8148358396', N'nunc@seddictumeleifend.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (10, N'90847698', N'Tanner', N'Garcia', N'Barnes', 10, N'8197469319', N'dolor.egestas@quisarcu.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (80, N'90853440', N'Courtney', N'Buckner', N'Gonzales', 8, N'8153994374', N'tincidunt@nisidictumaugue.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (96, N'90957063', N'Warren', N'Pearson', N'Pickett', 9, N'8191748461', N'leo@aliquetdiamSed.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (26, N'91274266', N'Garth', N'Todd', N'Hanson', 8, N'8154945852', N'rutrum.magna@Sedeunibh.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (74, N'91285319', N'Cody', N'Atkinson', N'Summers', 10, N'8133769887', N'lobortis.mauris.Suspendisse@sit.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (46, N'91671123', N'Shoshana', N'Bird', N'Watkins', 2, N'8153375548', N'Ut@sapien.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (76, N'91707821', N'Chaim', N'Sweeney', N'Clay', 1, N'8112933733', N'mollis.Duis.sit@non.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (18, N'91815166', N'Tanek', N'Shelton', N'Aguilar', 6, N'8147356165', N'amet@luctuset.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (72, N'91988307', N'Jessamine', N'Miller', N'Conway', 4, N'8149424253', N'per.inceptos@massalobortis.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (42, N'92216454', N'Gavin', N'Scott', N'Hurley', 7, N'8159693756', N'Donec.at.arcu@vitaesemper.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (64, N'92381546', N'Bert', N'Murphy', N'Moss', 2, N'8185615665', N'Cum@Seddictum.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (6, N'92469610', N'Connor', N'Mcleod', N'Macias', 2, N'8198854324', N'neque@parturientmontes.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (66, N'92473394', N'Thomas', N'Hurley', N'Whitley', 8, N'8179535771', N'Nulla.tempor.augue@elitNulla.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (63, N'92761067', N'Tatyana', N'Bowen', N'Baldwin', 5, N'8143556387', N'arcu.iaculis@Nuncpulvinar.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (84, N'92998212', N'Burton', N'Huff', N'Guzman', 7, N'8118631688', N'feugiat@pedenecante.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (27, N'93645353', N'Celeste', N'Lowery', N'Jefferson', 3, N'8164625322', N'penatibus.et.magnis@pharetranibh.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (54, N'93695051', N'Conan', N'Gill', N'Atkins', 5, N'8193197699', N'augue.porttitor@imperdietornare.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (34, N'94080786', N'Judith', N'Lawson', N'Branch', 9, N'8135769542', N'libero.lacus@semmolestiesodales.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (14, N'94377940', N'Herman', N'Rocha', N'Marshall', 9, N'8157368259', N'adipiscing@risusNuncac.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (31, N'94422703', N'Carly', N'Patel', N'Blevins', 6, N'8198152596', N'tempus.mauris@Nunc.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (95, N'94497262', N'Travis', N'Nguyen', N'Hatfield', 1, N'8114873252', N'Praesent@neque.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (17, N'94497889', N'Chandler', N'Shaw', N'Grimes', 9, N'8193287982', N'neque@eu.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (51, N'95092953', N'Victor', N'Mills', N'Bradshaw', 8, N'8154393612', N'nunc.sed.pede@mifringillami.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (16, N'95255733', N'Breanna', N'Hess', N'Harding', 8, N'8185124452', N'neque@a.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (40, N'95329043', N'Aquila', N'Shaw', N'Morrison', 8, N'8183154469', N'ligula.Nullam.enim@SeddictumProin.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (47, N'95377834', N'Katelyn', N'Barker', N'Chan', 5, N'8157151184', N'fermentum.convallis.ligula@consec.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (93, N'95415453', N'Bradley', N'Jordan', N'Barker', 6, N'8116149912', N'rutrum.eu@Sed.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (38, N'95458223', N'Hashim', N'Taylor', N'Warner', 9, N'8132766453', N'Donec.consectetuer@Suspendisse.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (22, N'95912111', N'Kennan', N'Frazier', N'Valenzuela', 8, N'8146968882', N'auctor.Mauris.vel@ac.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (39, N'95949092', N'Kasper', N'Mosley', N'Webster', 4, N'8122871465', N'amet.faucibus.ut@molestiein.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (98, N'96122632', N'Ashely', N'Norris', N'Blackburn', 1, N'8125752252', N'diam.lorem@Etiamgravida.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (50, N'96344595', N'Eugenia', N'Zamora', N'Mcgee', 9, N'8184772938', N'conubia.nostra.per@et.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (92, N'96351063', N'Shay', N'Good', N'Hendricks', 3, N'8119713686', N'enim@lectusquis.com', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (79, N'96622916', N'Alfreda', N'Wood', N'Rhodes', 7, N'8195452492', N'et.ipsum.cursus@ami.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (59, N'96782284', N'Kathleen', N'Hendricks', N'Byrd', 1, N'8129613935', N'justo@fermentumrisus.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (8, N'96859363', N'Quamar', N'Foreman', N'Wilcox', 3, N'8111317668', N'dictum.eleifend.nunc@sitamet.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (32, N'97072739', N'Donna', N'Perkins', N'Morrison', 9, N'8115878363', N'nec@molestie.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (5, N'97220442', N'Uriel', N'Russo', N'Clayton', 5, N'8117661974', N'vitae.dolor.Donec@ornare.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (3, N'97229271', N'Ramona', N'Glass', N'York', 6, N'8147873292', N'molestie@Maecenasmalesuadafringilla.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (94, N'97508807', N'Flynn', N'Boone', N'Vang', 5, N'8118417162', N'at.augue.id@dui.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (70, N'97644204', N'Cora', N'Schmidt', N'Rivera', 5, N'8148564246', N'Donec@sodales.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (2, N'97691478', N'Charde', N'Reese', N'Snider', 8, N'8148324482', N'elementum.purus.accumsan@eget.net', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (89, N'98086870', N'Nash', N'Mcclure', N'Austin', 2, N'8164767918', N'sit.amet.consectetuer@SednequeSed.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (73, N'98477698', N'Martin', N'Hansen', N'Huff', 1, N'8124547282', N'Fusce.fermentum@Duiscursusdiam.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (55, N'98822389', N'Katelyn', N'Raymond', N'Cain', 10, N'8198646799', N'luctus.ut.pellentesque@Praesent.ca', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (12, N'98959138', N'Dakota', N'Duffy', N'Mccullough', 9, N'8153597465', N'Integer.eu.lacus@Proinvel.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (100, N'99468043', N'Eve', N'Salinas', N'Marquez', 4, N'8196434654', N'id.mollis@fermentumconvallis.edu', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (9, N'99560270', N'Lillith', N'Webb', N'Chaney', 9, N'8164646512', N'et.ipsum@sed.co.uk', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (58, N'99702259', N'April', N'Mckee', N'Orr', 9, N'8124921369', N'eu@Duisacarcu.org', N'estudiante')
INSERT [dbo].[Estudiantes] ([Estudiante_id], [Matricula_es], [Nombres_es], [Apellido1_es], [Apellido2_es], [Facultad_id2], [NumTel_es], [Correo_es], [TipoLector]) VALUES (71, N'99764774', N'Bruno', N'Myers', N'Bird', 4, N'8113663829', N'malesuada.fames.ac@feugiattelluslorem.net', N'estudiante')

INSERT INTO [dbo].[Generos]
           ([Genero_id]
           ,[Nombre_g])
     VALUES
          (1,'Drama'), (2,'Accion'), (3,'Suspenso'), (4,'Terror'), (5,'Ciencia ficcion'), (6,'Comedia'), (7,'Romance'), (8,'Fantasia'), (9,'Historico'), (10,'Biografia');


INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (1, 'Jaquelyn', 'Burt', 'Dennis', 'JBD')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (2, 'Unity', 'Vargas', 'Mccarty', 'UVM')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (3, 'Leilani', 'Boyer', 'Whitney', 'LBW')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (4, 'Deborah', 'Williams', 'Moon', 'DWM')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (5, 'Hop', 'Ellis', 'Cain', 'HEC')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (6, 'Galena', 'Mathews', 'Barton', 'GMB')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (7, 'Beau', 'Rose', 'Mcgowan', 'BRM')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (8, 'Raymond', 'Dillard', 'Barton', 'RDB')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (9, 'Raja', 'Peters', 'Welch', 'RPW')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (10, 'Kasper', 'Garrison', 'Ayers', 'KGA')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (11, 'Brynne', 'Shields', 'Knowles', 'BSK')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (12, 'Garth', 'Flowers', 'Huffman', 'GFH')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (13, 'Emi', 'Guzman', 'Christensen', 'EGC')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (14, 'Inez', 'Simpson', 'Myers', 'ISM')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (15, 'April', 'Shelton', 'Bowman', 'ASB')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (16, 'Rafael', 'Strong', 'Stark', 'RSS')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (17, 'Kirk', 'Guy', 'Vazquez', 'KGZ')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (18, 'MacKensie', 'Kennedy', 'Diaz', 'MKD')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (19, 'Hedley', 'Fuentes', 'Dominguez', 'HFD')
INSERT [dbo].[Autores] ([Autor_id], [Nombres_a], [Apellido1_a], [Apellido2_a], [Iniciales]) VALUES (20, 'Ronan', 'Rush', 'Hahn', 'RRH')

INSERT [dbo].[Editoriales] ([Editorial_id], [Nombre_ed]) VALUES (1, 'Acantilado')
INSERT [dbo].[Editoriales] ([Editorial_id], [Nombre_ed]) VALUES (2, 'Aguilar')
INSERT [dbo].[Editoriales] ([Editorial_id], [Nombre_ed]) VALUES (3, 'Valdemar')
INSERT [dbo].[Editoriales] ([Editorial_id], [Nombre_ed]) VALUES (4, 'Akal')
INSERT [dbo].[Editoriales] ([Editorial_id], [Nombre_ed]) VALUES (5, 'Satori')
INSERT [dbo].[Editoriales] ([Editorial_id], [Nombre_ed]) VALUES (6, 'Plaza y Jan�s')

SELECT * FROM Generos
SELECT * FROM Autores
SELECT * FROM Estudiantes
SELECT * FROM Maestros
SELECT * FROM Inventario
SELECT * FROM Libro
SELECT * FROM Maestros
SELECT * FROM Multas
SELECT * FROM Rentas
SELECT * FROM Sucursales
SELECT * FROM TipoPastas
SELECT * FROM Editoriales
SELECT * FROM Facultades
SELECT * FROM Empleados

SELECT Estudiantes.Estudiante_id, Facultades.Facultad_id, Facultades.Nombre_fac FROM Estudiantes JOIN Facultades ON Estudiantes.Estudiante_id = Facultades.Facultad_id
SELECT Maestros.Maestro_id, Maestros.Matricula_ma, Facultades.Facultad_id,Facultades.Nombre_fac FROM Maestros JOIN Facultades ON Maestros.Maestro_id = '3'
SELECT Libro.Libro_id, Libro.Titulo, Libro.Edicion, Autores.Autor_id, Autores.Nombres_a FROM Libro JOIN Autores  ON Libro.Libro_id = '5'
SELECT Inventario.Inventario_id, Inventario.Estatus, Libro.Libro_id, Libro.Titulo, libro.Autor_id2, Libro.Genero_id2 FROM Inventario JOIN Libro ON Inventario.Libro_id2 = Libro.Libro_id
SELECT Empleados.Empleado_id, Empleados.Nombres_em, Empleados.Sucursal_id3,Sucursales.Nombre_su FROM Empleados JOIN Sucursales ON Sucursales.Sucursal_id = Empleados.Sucursal_id3
SELECT Empleados.Empleado_id, Empleados.Nombres_em, Empleados.Sucursal_id3,Sucursales.Nombre_su FROM Empleados JOIN Sucursales ON Sucursales.Nombre_su = 'Biblioteca General'
SELECT Inventario.Inventario_id, Inventario.Estatus, Libro.Libro_id, Libro.Titulo, libro.Autor_id2, Libro.Genero_id2 FROM Inventario JOIN Libro ON Libro.Titulo = 'En busca del tiempo perdido'
SELECT  Estudiantes.Estudiante_id, Facultades.Facultad_id, Facultades.Nombre_fac FROM Estudiantes JOIN Facultades ON Estudiantes.Estudiante_id = '3'
SELECT Maestros.Maestro_id, Maestros.Matricula_ma, Facultades.Facultad_id,Facultades.Nombre_fac FROM Maestros JOIN Facultades ON Maestros.Maestro_id = '15' 
SELECT  Libro.Libro_id, Libro.Titulo, Libro.Edicion, Autores.Autor_id, Autores.Nombres_a FROM Libro JOIN Autores  ON Autores.Nombres_a = 'Jaquelyn'
