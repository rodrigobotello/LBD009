--Botello Alanis Armando Rodrigo
--Base de datos de Tienda de Abarrotes

create database Abarrotes_LSTI
use Abarrotes_LSTI

create table catalogo_productos(
id_producto int not null primary key,
departamento varchar(100),
marca varchar(100),
descripcion varchar(100),
precio float not null)

insert into catalogo_productos values(1,'Frutas y verduras','Sin marca','Sandia',7.89)
insert into catalogo_productos values(2,'Frutas y verduras','Sin marca','Melon',13.45)
insert into catalogo_productos values(3,'Frutas y verduras','Sin marca','Jicama',9.36)
insert into catalogo_productos values(4,'Frutas y verduras','Sin marca','Cebolla',31.08)
insert into catalogo_productos values(5,'Frutas y verduras','Sin marca','Tomate',4.99)
insert into catalogo_productos values(6,'Bebidas','Jumex','Jugo de mango 500ml',9)
insert into catalogo_productos values(7,'Bebidas','Jumex','Jugo de mango 1L',15.5)
insert into catalogo_productos values(8,'Bebidas','Del valle','Jugo de mango 500ml',9)
insert into catalogo_productos values(9,'Bebidas','Del valle','Jugo de durazno 500ml',16)
insert into catalogo_productos values(10,'Bebidas','Gatorade','Gatorade lima limon 1L',22)
insert into catalogo_productos values(11,'Bebidas','Gatorade','Gatorade Naranja 1L',22)
insert into catalogo_productos values(12,'Limpieza','Charmin','Papel higienico 16pz',54.49)
insert into catalogo_productos values(13,'Limpieza','Mr. Musculo','Mr. Musculo 1L',32.5)
insert into catalogo_productos values(14,'Limpieza','Yanitor','escoba grande',27.2)
insert into catalogo_productos values(15,'Dulceria','Bubalo','Paquete chicles bubalo mixtos 100pz',36.99)
insert into catalogo_productos values(16,'Dulceria','bocadin','Paquete bocadin 45pz',27)


create table almacen(
id_producto int not null foreign key references catalogo_productos(id_producto),
cantidad int not null,
diponible varchar(40) not null)

insert into almacen values(1,56,'Si')
insert into almacen values(2,42,'Si')
insert into almacen values(3,25,'Si')
insert into almacen values(4,68,'Si')
insert into almacen values(5,5,'Si')
insert into almacen values(6,21,'Si')
insert into almacen values(7,45,'Si')
insert into almacen values(8,63,'Si')
insert into almacen values(9,25,'Si')
insert into almacen values(10,45,'No')
insert into almacen values(11,21,'Si')
insert into almacen values(12,47,'Si')
insert into almacen values(13,89,'Si')
insert into almacen values(14,63,'Si')
insert into almacen values(15,21,'Si')
insert into almacen values(16,23,'Si')


create table proveedores_tienda(
id_proveedor int not null primary key,
nombre varchar(50),
departamento varchar(100),
correo varchar(50),
telefono bigint)

insert into proveedores_tienda values (55,'Gran Almacen','Zona Verde, Guadalajara, Area 1','granventasa@gmail.com',8374502742)
insert into proveedores_tienda values (56,'Todo Surtimos','Maryland, Groenlandia 5009','todosurtimoscv@hotmail.com',7381726389)
insert into proveedores_tienda values (57,'Productos Alcance','Guadalupe, Bortines, México','prodalcance@gmail.com',4364025379)

select * from proveedores_tienda

insert into catalogo_productos values(289,'Abarrotes San Miguel','Frutas y Verduras','Abarrotes_y_mas@hormail.com',1565478952)
insert into catalogo_productos values(389,'Coca cola','Bebidas','Coca_cola@gmail.com',1325698547)
insert into catalogo_productos values(489,'Charmin','Limpieza','Cha_cha_charmin@yahoo.com.mx',1523658975)
insert into catalogo_productos values(589,'Mr.Musculo','Limpieza','Musculo_sa_de_sv@hotmail.com',1258794651)
insert into catalogo_productos values(689,'Yanitor','Limpieza','Yanitors@gmail.com',1254875696)
insert into catalogo_productos values(789,'Bubbaloo','Dulceria','buba_loo@hotmail.com',1325684578)

create table empleados(
id_empleado int not null primary key,
nombre varchar(50),
puesto varchar(50),
direccion varchar(50),
correo varchar(50),
telefono bigint,
fecha_nacimiento varchar(50)
)

insert into empleados values(42568,'Maria Guadalupe','Cajero','calle robles #157','maria@hotmail.com',1258458796,'1997-10-29')
insert into empleados values(42574,'Angel Cuevas','Cajero','hercules #756','angel@hotmail.com',1254687542,'1996-09-24')
insert into empleados values(42580,'Mayra delano','Cajero','Aries #135','Mayra@hotmail.com',1896321547,'1998-05-14')
insert into empleados values(42586,'Benito Alvarado','Supervisor','15 de mayo #582','Beni@hotmail.com',2356975481,'1992-09-24')
insert into empleados values(42592,'Karen del Roble','Guardia','Av. Lincon #137','Karen_roble@hotmail.com',1256487598,'1991-02-28')
insert into empleados values(42598,'Cristian Martinez','Gerente','calle Acapulco #842','Chris_mtz@hotmail.com',1368525847,'1989-05-06')

create table clientes(
id_cliente int not null primary key,
nombre varchar(100),
fecha_nacimiento varchar(50),
correo_electronico varchar(50),
direccion varchar(50),
telefono bigint)

insert into clientes values(12345,'Peña Nieto','1997-06-01','Peña_@hotmail.com','San fernando #468',2356874568)
insert into clientes values(12350,'Edgar Martinez Rodriguez','1992-07-11','EdMar@hotmail.com','Hercules #134',2365987541)
insert into clientes values(12355,'Karen Michelle Mendez','1991-09-25','Karen_mich@hotmail.com','30 Mayo #347',1254879658)
insert into clientes values(12360,'Patricio Ernesto Rodriguez','1994-01-30','Patrick_ernesto@hotmail.com','Pino suarez #137',1356428597)



create table ventas(
id_venta int not null primary key,
fecha varchar(50),
cliente int not null foreign key references clientes(id_cliente),
empleado int not null foreign key references empleados(id_empleado) ,
estado_venta varchar(50))

create table detalle_venta(
id_venta int not null foreign key references ventas(id_venta),
id_producto int not null foreign key references catalogo_productos(id_producto),
total int)

CREATE procedure sp_genera_venta
@fecha varchar(50),
@id_venta int,
@id_empleado int,
@id_cliente int
as
insert into ventas values(@id_venta,@fecha,@id_cliente,@id_empleado,'En tramite')
go

exec sp_genera_venta '2017-12-10',1,42568,12350
exec sp_genera_venta '2017-12-10',2,42574,12345
exec sp_genera_venta '2017-12-11',3,42574,12350
exec sp_genera_venta '2017-12-11',4,42574,12345
exec sp_genera_venta '2017-12-12',5,42586,12355
exec sp_genera_venta '2017-12-12',6,42568,12355

select * from ventas


CREATE procedure sp_agrega_productos
@id_venta int,
@id_producto int,
@cantidad int
as
insert into detalle_venta values(@id_venta,@id_producto,@cantidad)
go

exec sp_agrega_productos 1,1,2
exec sp_agrega_productos 1,3,4
exec sp_agrega_productos 2,4,5
exec sp_agrega_productos 2,5,4
exec sp_agrega_productos 3,6,3
exec sp_agrega_productos 3,7,8
exec sp_agrega_productos 4,8,2
exec sp_agrega_productos 4,9,2
exec sp_agrega_productos 5,11,6
exec sp_agrega_productos 6,12,4
exec sp_agrega_productos 6,13,5

CREATE procedure sp_cancela_ventas
@id_venta int
as
update ventas set estado_venta = 'Cancelada' where id_venta = @id_venta
go

exec sp_cancela_ventas 1

select * from ventas


CREATE procedure sp_aprueba_ventas
@id_venta int
as
update ventas set estado_venta = 'Aprobada' where id_venta = @id_venta

update almacen set almacen.cantidad = almacen.cantidad - detalle_venta.total 
from detalle_venta inner join almacen on
almacen.id_producto = detalle_venta.id_producto
where detalle_venta.id_venta = @id_venta
go

exec sp_aprueba_ventas 2
exec sp_aprueba_ventas 3
exec sp_aprueba_ventas 4
exec sp_aprueba_ventas 5
exec sp_aprueba_ventas 6

select * from almacen

select * from detalle_venta


alter view vista_ventas_diarias
as
SELECT        TOP (100) PERCENT dbo.ventas.fecha, dbo.ventas.empleado, dbo.empleados.nombre,COUNT(dbo.ventas.empleado) AS total_ventas
FROM            dbo.ventas INNER JOIN
                         dbo.empleados ON dbo.ventas.empleado = dbo.empleados.id_empleado
WHERE        (dbo.ventas.estado_venta = 'Aprobada')
GROUP BY dbo.ventas.fecha, dbo.ventas.empleado, dbo.empleados.nombre
ORDER BY dbo.ventas.fecha
go


SELECT        TOP (100) PERCENT dbo.ventas.fecha, dbo.ventas.empleado, dbo.empleados.nombre,COUNT(dbo.ventas.empleado) AS total_ventas
FROM            dbo.ventas INNER JOIN
                         dbo.empleados ON dbo.ventas.empleado = dbo.empleados.id_empleado
WHERE        (dbo.ventas.estado_venta = 'Aprobada')
GROUP BY dbo.ventas.fecha, dbo.ventas.empleado, dbo.empleados.nombre
ORDER BY dbo.ventas.fecha


select * from ventas 
select * from vista_ventas_diarias


select * from vista_ventas_diarias where fecha = '2017-12-11'
