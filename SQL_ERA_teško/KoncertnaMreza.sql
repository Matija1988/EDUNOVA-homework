use master;
go
drop database if exists koncertnamreza;
go
create database koncertnamreza collate CROATIAN_CI_AS;
go
use koncertnamreza;

create table korisnici(
id int not null primary key identity(1,1),
naziv varchar(50),
sifra varchar(50),
pretinac int,
slika int,
opis int,
rezervacije int
);

create table inbox(
korisnikPosiljatelj int not null,
poruka varchar(500) not null,
korisnikPrimatelj int not null,
);

create table glazbeniDogadaji(
id int not null primary key identity(1,1),
naziv varchar(100) not null,
tekst varchar(1000) not null,
datumObjave datetime,
datumDogadaja datetime,
naslovnaFotografija varchar(200),
galerijaFotografija int,
komentari int
);

create table fotografije (
id int not null primary key identity(1,1),
lokacijaFotografije varchar(200)
);
create table galerije(
galerija varchar(100),
fotografija int
);


