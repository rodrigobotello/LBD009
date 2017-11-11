--Vistas
create view VerMovies
as
select Movies.Nombre, CapituloMovies.IDMovies
from Movies
INNER JOIN CapituloMovies on Movies.IDMovies = CapituloMovies.IDMovies

select * from VerMovies

create view IDSBooks
as select TOP 10 Books.IBooks, CapituloBooks.Nombre
from Manga
RIGHT JOIN CapituloBooks on Books.IBooks = CapituloBooks.IDBooks
ORDER BY Books.Nombre;

select * from IDSBooks

create view FIDS
as
select AVG(Movies.IDMovies) as 'prom. de Movies' , AVG(MoviesBooks.IDBooks) as 'prom. de Books', AVG(Genero.IDGenero) as 'prom. de generos'
FROM Anime
left join Books on Movies.IDMovies = Books.IDBooks
inner join Genero on Books.IDBooks = Genero.IDGenero

select * from FIDS 

Create view Gen
as
select Genero.IDGenero, Movies.IDAnime, Books.Descripcion
from Genero
right join Movies on Movies.IDGenero = Genero.IDGenero
right join Books on Books.IDGenero = Movies.IDGenero

select * from Gen

create view Descargas
as
select Movies.Descarga, Genero.Nombre, Manga.Estado, MoviesManga.IDManga
From Anime
inner join Books on Movies.IDMovies = Books.IDBooks
inner join Genero on Books.IDGenero = Genero.IDGenero

select * from Descargas



--Procedimientos almacenados

create Procedure ReporteMovies(@valor int)
as 
begin 
select * 
from dbo.VerMovies
where IDMovies >4
end

exec ReporteMovies 4


create Procedure ReporteBooks(@valor int)
as 
begin 
select * 
from dbo.IDSBooks 
where IDBooks  > 2
end

exec ReporteBooks 1


create Procedure ReporteFIDS(@valor int)
as 
begin 
select * 
from dbo.FIDS
where [prom. de generos] > 4
end

exec ReporteManga 1


create Procedure ReporteGenDes(@valor int)
as 
begin 
select * 
from dbo.Gen
where IDMovies <> 5 and IDGenero > 3
end

exec ReporteGenDes 6


create Procedure ReporteDescargas(@valor int)
as 
begin 
select * 
from dbo.Descargas
where IDBooks <> 5 and IDBooks <> 3 and IDBooks <> 7
end

exec ReporteDescargas 8


--Funcion

create function PromedioDeCap(@Numero int, @Numero2 int, @Numero3 int, @Numero4 int)
returns float 
as
begin
	return (@Numero + @Numero2 + @Numero3 + @Numero4)/4   
	end

select dbo.PromedioDeCap(5,9,7,6) as 'suma de 4 capitulos'

--Triggers
--tipo after
create trigger DisparadorMovies
on Movies
after update 
as
begin
select * 
from inserted
end

update Movies
set Movies.Nombre = '99'
from Movies
where Movies.Nombre = 'Pulp Fiction'


--Tipo instead

create trigger DisparadorBooks
on Books
instead of update 
as declare @BooksNombre varchar(max) 
IF UPDATE (Nombre)
	begin
		set @BooksNombre = 'Es culpa del trigger'
		select Descripcion, @BooksNombre as 'columna extra'
		from Books
		where Books.Descripcion = 'El enorme sistema de cuevas, conocido como El Abismo, es el último lugar inexplorado en el mundo. Nadie sabe que tan profundo es este agujero titánico, habitado por extrañas y maravillosas criaturas y lleno de misterio y reliquias antiguas de propósito desconocido para la humanidad. Generaciones de valientes aventureros han sido atraídos a las profundidades cripticas del Abismo. Con el paso del tiempo estos exploradores son conocidos como "Exploradores de las Profundidades". En Oath, el pueblo al borde del Abismo, vive una pequeña niña huérfana llamada Riko, que sueña con convertirse en una gran exploradora como su madre y descubrir los misterios del Abismo. Un día explorando las obscuras profundidades se encuentra con un niño, que resulta ser un robot...'
		
		end
else 
	begin
		set @BooksNombre = 'No es culpa del trigger'
		select * 
		from Books
end

update Books
set Nombre = '99'
from Books
where Nombre = 'Pulp Fiction'


--crear 1 funcion y usarla
--5 procedimientos almacenados
	--uno para cada reporte de la practica anterior
	--debe de utilizar parametros para filtrar el reporte
--crear 1 trigger tipo after
--crear 1 trigger tipo instead


