CREATE VIEW V1
AS
SELECT Estudiantes.Estudiante_id, Facultades.Facultad_id, Facultades.Nombre_fac FROM Estudiantes JOIN Facultades ON Estudiantes.Estudiante_id = Facultades.Facultad_id


CREATE VIEW V2
AS
SELECT Maestros.Maestro_id, Maestros.Matricula_ma, Facultades.Facultad_id,Facultades.Nombre_fac FROM Maestros JOIN Facultades ON Maestros.Maestro_id = '3'

CREATE VIEW V3
AS
SELECT Libro.Libro_id, Libro.Titulo, Libro.Edicion, Autores.Autor_id, Autores.Nombres_a FROM Libro JOIN Autores  ON Libro.Libro_id = '5'

CREATE VIEW V4
AS
SELECT Inventario.Inventario_id, Inventario.Estatus, Libro.Libro_id, Libro.Titulo, libro.Autor_id2, Libro.Genero_id2 FROM Inventario JOIN Libro ON Inventario.Libro_id2 = Libro.Libro_id

CREATE VIEW V5
AS
SELECT Empleados.Empleado_id, Empleados.Nombres_em, Empleados.Sucursal_id3,Sucursales.Nombre_su FROM Empleados JOIN Sucursales ON Sucursales.Sucursal_id = Empleados.Sucursal_id3


CREATE VIEW V6
AS
SELECT Empleados.Empleado_id, Empleados.Nombres_em, Empleados.Sucursal_id3,Sucursales.Nombre_su FROM Empleados JOIN Sucursales ON Sucursales.Nombre_su = 'Biblioteca General'

CREATE VIEW V7
AS
SELECT Inventario.Inventario_id, Inventario.Estatus, Libro.Libro_id, Libro.Titulo, libro.Autor_id2, Libro.Genero_id2 FROM Inventario JOIN Libro ON Libro.Titulo = 'En busca del tiempo perdido'

CREATE VIEW V8
AS
SELECT  Estudiantes.Estudiante_id, Facultades.Facultad_id, Facultades.Nombre_fac FROM Estudiantes JOIN Facultades ON Estudiantes.Estudiante_id = '3'


CREATE VIEW V9
AS
SELECT Maestros.Maestro_id, Maestros.Matricula_ma, Facultades.Facultad_id,Facultades.Nombre_fac FROM Maestros JOIN Facultades ON Maestros.Maestro_id = '15' 


CREATE VIEW V10
AS
SELECT  Libro.Libro_id, Libro.Titulo, Libro.Edicion, Autores.Autor_id, Autores.Nombres_a FROM Libro JOIN Autores  ON Autores.Nombres_a = 'Jaquelyn'


