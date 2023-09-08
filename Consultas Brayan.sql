-- cambios pertinentes 


SELECT 
u.Nombre1 AS Nombre, 
u.Apellido1 AS Apellido, 
COUNT(f.id_Factura) AS Numero_De_Ventas, 
SUM(CAST(f.Total AS DECIMAL(10,2))) AS Total_Ventas,
AVG(CAST(f.Total AS DECIMAL(10,2))) AS Promedio_Ventas,
MAX(CAST(f.Total AS DECIMAL(10,2))) AS Venta_Maxima
FROM factura AS f    
JOIN mesero AS m ON f.Mesero_Usuario_Id_Usuario = m.Usuario_Id_Usuario   
JOIN usuario AS u ON m.Usuario_Id_Usuario = u.Id_Usuario
GROUP BY u.Nombre1, u.Apellido1                          
ORDER BY Total_Ventas DESC;


SELECT 
c.Id_cocinero AS ID_Cocinero, 
CONCAT(u.Nombre1,'', u.Apellido1) AS Nombre_Cocinero, 
SEC_TO_TIME(AVG(TIMESTAMPDIFF(SECOND, o.Fecha_hora_inicio, o.Fecha_hora_finalizacion))) AS Tiempo_Promedio_Preparacion 
FROM cocinero AS c     
JOIN usuario AS u ON c.Usuario_Id_Usuario = u.Id_Usuario
JOIN orden AS o ON c.Id_cocinero = o.Cocinero_Id_cocinero
GROUP BY c.Id_cocinero, u.Nombre1, u.Apellido1;


SELECT   
m.Id_Mesero,
CONCAT(u.Nombre1, ' ', u.Apellido1) AS NombreMesero,
SUM(do.Orden_Total) AS TotalVentas   
FROM mesa AS me 
INNER JOIN mesero AS m ON me.Mesero_Id_Mesero = m.Id_Mesero
INNER JOIN usuario AS u ON m.Usuario_Id_Usuario = u.Id_Usuario
INNER JOIN orden_de_mesa AS om ON me.Id_Mesa = om.Mesa_Id_Mesa   
INNER JOIN detalle_de_orden AS do ON om.Orden_Id_Orden = do.Orden_Id_Orden
GROUP BY m.Id_Mesero, NombreMesero
ORDER BY TotalVentas DESC
LIMIT 3 

