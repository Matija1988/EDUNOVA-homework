use master; 
go
drop database if exists kolokvijvjezba1;
go
create database kolokvijvjezba1 collate CROATIAN_CI_AS;
go
use kolokvijvjezba1; 

create table svekar (
sifra int primary key not null identity(1,1),
bojaociju varchar(40),
prstena int,
dukserica varchar(41),
lipa decimal (13,8),
eura decimal (12,7),
majica varchar(35)
);


create table sestra_svekar(
sifra int primary key not null identity(1,1),
sestra int not null,
svekar int not null
);


create table mladic (
sifra int primary key not null identity(1,1),
suknja varchar(50) not null,
kuna decimal (16,8) not null,
drugiputa datetime,
asocijalno bit,
ekstrovertno bit  not null,
dukserica varchar(48),
muskarac int
);

create table muskarac(
sifra int primary key not null identity(1,1),
bojaociju varchar(50) not null,
hlace varchar(30),
modelnaocala varchar(43),
maraka decimal(14,5) not null,
zena int not null
);


create table sestra(
sifra int primary key not null identity(1,1),
introvertno bit,
haljina varchar(31) not null,
maraka decimal(16,6),
hlace varchar(46) not null,
narukvica int not null,
);

create table zena(
sifra int primary key not null identity(1,1),
treciputa datetime, 
hlace varchar(46),
kratkamajica varchar(31) not null,
jmbag char(11) not null,
bojaociju varchar(39) not null,
haljina varchar(44),
sestra int not null
);

create table cura (
sifra int primary key not null identity(1,1),
novcica decimal(16,5) not null,
gustoca decimal(18,5) not null,
lipa decimal (13,10),
ogrlica int not null,
bojakose varchar(38),
suknja varchar(36),
punac int
);


create table punac (
sifra int primary key not null identity(1,1),
ogrnlica int,
 gustoca decimal(14,9),
 hlace varchar(41) not null
);

alter table cura add foreign key (punac) references punac(sifra);
alter table mladic add foreign key(muskarac) references muskarac(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table zena add foreign key(sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

insert into sestra(introvertno, haljina, maraka, hlace, narukvica) values 
(0,'poslovna plava','1017.93','lewis crne', 1),
(1,'gothic crna','977.11','ne nosi hlace', 5),
(0,'večernja crvena','2017.13','denim', 0),
(1,'večernja plava','1233.13','lewis', 1);
insert into zena(treciputa,hlace,kratkamajica, jmbag,bojaociju, haljina,sestra) values
('2017-01-02','WGW','crna','12345678910','plava','gucci',1),
('2017-01-02','Denim','bijela','12345678911','zelena','prada',2),
('2017-01-02','Lewis','crvena','12345678912','smeđa','sa koridora crna',3);
insert into muskarac(bojaociju, hlace, modelnaocala, maraka, zena) values 
('smeđa','denim','rayban','1001.97007',1),('zelena','camel','chinese','987.9998',2),
('placa','WGW','taiwan','2012.09231',3);
insert into svekar(bojaociju) values ('plave'),('smeđe'),('zelene');
insert into sestra_svekar(sestra, svekar) values 
(1,1),(2,2),(3,3);
insert into cura(novcica, gustoca, ogrlica) values ('1500.03','15.77',1),('1323.03','15.77',2),
('1500.03','15.77',1);

insert into mladic (suknja, kuna, ekstrovertno, dukserica) values (
'kilt','15.98',1,'crna')
,('none','153.98',1,'plava'),
('','1511.98',1,'crvena');

delete from mladic where kuna > 15.78;
select * from zena where kratkamajica like '%a%n%a%'

select * from sestra where sifra = 4;

select f.dukserica, a.hlace, b.asocijalno, c.hlace
from muskarac a inner join mladic b on a.sifra = b.sifra
inner join zena c on a.zena = c.sifra
inner join sestra d on c.sestra = d.sifra
inner join sestra_svekar e on e.sestra = d.sifra
inner join svekar f on e.svekar = f.sifra
where a.hlace like 'B%' and d.haljina like '%b%a%'
order by 2 desc 
;


