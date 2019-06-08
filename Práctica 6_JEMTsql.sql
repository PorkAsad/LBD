-- Práctica 6
-- 1.SELECTS AVANZADOS

SELECT Estudiantes.Estudiante_id, Facultades.Facultad_id, Facultades.Nombre_fac FROM Estudiantes JOIN Facultades ON Estudiantes.Estudiante_id = Facultades.Facultad_id

SELECT Maestros.Maestro_id, Maestros.Matricula_ma, Maestros.Maestro_id, Facultades.Facultad_id,Facultades.Nombre_fac FROM Maestros JOIN Facultades ON Maestros.Maestro_id = '3'

SELECT Libro.Libro_id, Libro.Titulo, Libro.Edicion, Autores.Autor_id, Autores.Nombres_a FROM Libro JOIN Autores  ON Libro.Libro_id = '5'


-- 2. SELECTS 


SELECT * FROM Generos where Genero_id = '5'
SELECT * FROM Autores  where Autor_id = '3'
SELECT * FROM Estudiantes where Estudiante_id = '14'
SELECT * FROM Maestros  where Maestro_id = '8'
SELECT * FROM Inventario  where  Inventario_id = '9'
SELECT * FROM Libro  where Libro_id = '7'
SELECT * FROM Multas  where Multa_id = '3'
SELECT * FROM Rentas  where Prestamo_id = '3'
SELECT * FROM Sucursales  where Sucursal_id = '2'
SELECT * FROM TipoPastas  where Nombre_p = 'Dura'
SELECT * FROM Editoriales  where Editorial_id= '5'
SELECT * FROM Facultades  where Facultad_id = '1'
SELECT * FROM Empleados  where Empleado_id = '2'
