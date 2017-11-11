create view VerMovies
as
select Movies.Nombre, CapituloAnime.IDAnime
from Movies
INNER JOIN PartMovies on Movies.IDMovies = SerieMovies.IDMovies

select * from VerMovies

create view IDSBooks
as select TOP 10 Book.IDBook, ChapterBook.Nombre
from Book
RIGHT JOIN CapituloManga on Manga.IDManga = CapituloManga.IDManga
ORDER BY Manga.Nombre;

select * from IDSBooks

create view FIDS
as
select AVG(Movies.IDMovies) as 'prom. de animes' , AVG(Manga.IDManga) as 'prom. de Manga', AVG(Genero.IDGenero) as 'prom. de generos'
FROM Movies
left join Books on Movies.IDMovies = Books.IDBooks
inner join Genero on Books.IDBooks = Genero.IDGenero

select * from FIDS 

Create view Gen
as
select Genero.IDGenero, Movies.IDMovies, Manga.Descripcion
from Genero
right join Movies on Movies.IDGenero = Genero.IDGenero
right join Books on Books.IDGenero = Movies.IDGenero

select * from Gen

create view Descargas
as
select Movies.Descarga, Genero.Nombre, Books.Estado, Books.IDBooks
From Movies
inner join Books on Movies.IDMovies = Books.IDBooks
inner join Genero on Books.IDGenero = Genero.IDGenero

select * from Descargas

--Subconsultas

select *
from(
select *
from CapituloMoviesMovies
where NumeroCap >= 1
)as Parentesis
where Parentesis.Nombre <> 'Another-1'


with WithTemp as (
select Genero.Nombre as 'Genero', Movies.Nombre, CapituloMovies.IDMovies
from Anime, Genero, CapituloAnime
where Genero.IDGenero = Movies.IDGenero and Movies.IDMovies = CapituloMovies.IDMovies
)
select *
from WithTemp
where WithTemp.Genero = 'AVENTURA'


--Tabla temporal

select Genero.Nombre as 'Genero', Books.Nombre as 'Books'
into #temp
from genero, Books
where Genero.IDGenero = Books.IDGenero

select *
from #temp
