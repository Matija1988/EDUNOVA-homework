use master;
go
drop database if exists DVCrvenkapica;
go
create database DVCrvenkapica collate croatian_ci_as;
go
use DVCrvenkapica;

create table djeca(
id int not null primary key identity(1,1),
ime varchar(50),
prezime varchar(50),
godinarodenja datetime,
spol char(1),
odgojnaSkupina int 
);

create table roditelji(
id int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
oib char(11) not null,
adresa varchar(50) not null
);

create table prijava(
dijete int not null,
roditelj int not null,
datumUpisa datetime not null
);

create table odgojneSkupine(
id int not null primary key identity(1,1),
naziv varchar(50),
maksBrpolaznica varchar(50),
);

create table dogadaji(
id int not null primary key identity(1,1),
naslov varchar(100) not null,
tekst varchar(1000) not null,
lokacijaNaslovneFotografije varchar(200),
galerijaFotografija varchar(100),

);

create table fotografije(
id int not null primary key identity(1,1),
lokacija varchar(200) not null
);

create table galerijeFotografija(
galerija varchar(100) primary key, constraint GA_GalerijaID unique(galerija),
fotografija int
);

alter table djeca add foreign key (odgojnaSkupina) references odgojneSkupine(id); 
alter table prijava add foreign key (dijete) references djeca(id);
alter table prijava add foreign key (roditelj) references roditelji(id);
alter table galerijeFotografija add foreign key (fotografija) references fotografije(id);
alter table dogadaji add foreign key (galerijaFotografija) references galerijeFotografija(galerija);  