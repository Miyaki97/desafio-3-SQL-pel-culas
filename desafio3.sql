drop table if exists reparto;
drop table if exists peliculas;


create table peliculas(
	id SERIAL primary key,
	Pelicula varchar (200) not null,
	estreno int,
	Director varchar (100)
);

create table reparto (
	pelicula_id INT references peliculas(id),
	actor varchar(200)
);

--importar el CSV
copy peliculas from 'c:\peliculas.csv'
delimiter ','
csv header;

select * from peliculas;

--importar reparto

copy reparto from 'c:\reparto.csv'
delimiter ','
csv header;

select * from reparto;

select id from peliculas where pelicula = 'Titanic';

select  actor from reparto where pelicula_id = 2;

select count(*) from reparto where actor = 'Harrison Ford';

select * from peliculas where estreno >= 1989 and estreno < 2000 order by Pelicula asc;

select Pelicula, length(Pelicula) as longitud_titulo from peliculas;

select max(length(pelicula)) as longitud_max from peliculas;