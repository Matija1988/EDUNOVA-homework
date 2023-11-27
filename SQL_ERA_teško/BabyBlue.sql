use master;
go
drop database if exists BabyBlue;
go
create database BabyBlue collate croatian_ci_as;
go
use BabyBlue;

create table korisnici(
id int not null primary key identity(1,1),
userName varchar(50),
password varchar(50),
email varchar(50)
);

create table objave(
id int not null primary key identity(1,1),
naslov varchar(100) not null,
tekst varchar(2000),
datumObjave datetime not null,
naslovnaFotografija int not null,
galerijaFotografija int,
komentariGrupa int
);

create table galerijeFotografija(
galerija int not null,
fotografija int not null
);

create table fotografije(
id int not null primary key identity(1,1),
lokacija varchar(200),
naziv varchar(100)
);

create table komentari(
id int not null primary key identity(1,1),
korisnik int,
nastao datetime,
tekst varchar(500)
);

create table komentariGrupa(
komentar int, 
objava int, 
);

create table galerije (
id int not null primary key identity (1,1),
naziv varchar(200) 
);

alter table galerijeFotografija add foreign key (galerija)
references galerije(id);
alter table galerijeFotografija add foreign key (fotografija)
references fotografije(id); 
alter table objave add foreign key (naslovnaFotografija)
references fotografije(id); 
alter table komentariGrupa add foreign key (objava) references objave(id);
alter table komentariGrupa add foreign key (komentar) references komentari(id);
alter table komentari add foreign key (korisnik) references korisnici(id); 