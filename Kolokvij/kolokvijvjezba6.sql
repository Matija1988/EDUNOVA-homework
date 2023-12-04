use master;
go
drop database if exists kolokvijvjezba6;
go
create database kolokvijvjezba6 collate croatian_ci_as;
go
use kolokvijvjezba6;

create table decko (
sifra int not null primary key identity (1,1),
prviputa datetime,
modelnaocala varchar(41),
nausnica int,
zena int not null
);

create table brat(
sifra int not null primary key identity(1,1),
nausnica int not null,
treciputa datetime not null,
narukvica int not null,
hlace varchar(31),
prijatelj int,
);

create table zena (
sifra int not null primary key identity(1,1),
novcica decimal(14,8) not null,
narukvica int not null,
dukserica varchar(40) not null,
haljina varchar(30),
hlace varchar(32),
brat int not null,
);

create table prijatelj(
sifra int not null primary key identity(1,1),
haljina varchar(35),
prstena int not null,
introvertno bit,
stilfrizura varchar(36)
);

create table ostavljena(
sifra int not null primary key identity(1,1),
prviputa datetime not null,
kratkamajica varchar(39) not null,
drugiputa datetime,
maraka decimal(14,10)
);

create table prijatelj_ostavljena(
sifra int not null primary key identity(1,1),
prijatelj int not null,
ostavljena int not null
);

create table punac(
sifra int not null primary key identity(1,1),
ekstrovertno bit not null, 
suknja varchar(30) not null,
majica varchar(44) not null,
prviputa datetime not null
);
create table svekrva(
sifra int not null primary key identity(1,1),
hlace varchar(48) not null,
suknja varchar(42) not null,
ogrlica int not null,
treciputa datetime not null,
dukserica varchar(32) not null,
narukvica int not null,
punac int 
);

alter table decko add foreign key (zena) references zena(sifra);
alter table zena add foreign key (brat) references brat(sifra);
alter table brat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_ostavljena add foreign key (ostavljena) references ostavljena(sifra);
alter table svekrva add foreign key (punac) references punac(sifra);

insert into brat (nausnica, treciputa, narukvica) values 
(2,'2013-12-05',3),
(1,'2014-1-15',6),
(1,'2011-5-13',12);

insert into zena(novcica, narukvica, dukserica, brat) values 
('123.23',2,'Crna',1),
('6776.23',5,'Crvena Urban Instinkt',2),
('434.3221',1,'Bijela',3);

insert into decko(modelnaocala, zena) values 
('AB', 1),
('Reyban', 2),
('Vasisdas', 3);

insert into prijatelj (prstena, stilfrizura) values 
(2,'Irokeza'),
(10,'Futbalerka'),
(1,'Celav'),
(16,'Kratka');

insert into ostavljena (prviputa, kratkamajica) values 
('2009-12-08','crna'),
('2019-07-12','plava'),
('2012-08-02','bijela');

insert into prijatelj_ostavljena (prijatelj, ostavljena) values 
(1,1),
(2,2),
(3,3);

insert into punac (ekstrovertno, suknja, majica, prviputa) values 
(1, 'kratka crna','crna sa dugim rukavima', '1987-08-07'),
(0, 'duga plava','plava', '1977-01-12'),
(1, 'duga bijela','bijela', '1967-05-18');

insert into svekrva (hlace, suknja, ogrlica, treciputa, dukserica, narukvica) values 
('Denim','Duga crna',1, '2019-10-27', 'Roza', 12),
('Lewis','Duga bijela',5, '2012-1-12', 'crna', 1),
('WGW crne','plava',5, '2007-3-20', 'plava', 1);

update svekrva set suknja = 'Osijek';

select suknja from svekrva;

delete decko where modelnaocala != 'AB';

select modelnaocala from decko;

select narukvica from brat where treciputa is null; 

select f.drugiputa, a.zena, b.narukvica
from decko a inner join zena b on a.zena = b.sifra
inner join brat c on b.brat=c.sifra 
inner join prijatelj d on c.prijatelj=d.sifra
inner join prijatelj_ostavljena e on e.prijatelj= d.sifra
inner join ostavljena f on e.ostavljena=f.sifra
where b.narukvica is not null and d.prstena = 219
order by 3 desc
;
select * from prijatelj; 

select a.prstena, a.introvertno
from prijatelj a left join prijatelj_ostavljena b on a.sifra=b.prijatelj
where b.prijatelj is null;