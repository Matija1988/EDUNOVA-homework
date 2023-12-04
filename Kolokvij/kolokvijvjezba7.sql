use master;
go
drop database if exists kolokvijvjezba7;
go
create database kolokvijvjezba7 collate croatian_ci_as;
go
use kolokvijvjezba7;

create table mladic(
sifra int not null primary key identity(1,1),
prstena int,
lipa decimal(14,5) not null,
narukvica int not null,
drugiputa datetime not null
);

create table zarucnik(
sifra int not null primary key identity(1,1),
vesta varchar(34),
asocijalno bit not null,
modelnaocala varchar(43),
narukvica int not null, 
novcica decimal(15,5) not null
);

create table zarucnik_mladic(
sifra int not null primary key identity(1,1),
zarucnik int not null,
mladic int not null
);

create table ostavljen(
sifra int not null primary key identity(1,1),
lipa decimal(14,6),
introvertno bit not null,
 kratkamajica varchar(38) not null, 
 prstena int not null,
 zarucnik int
);

create table prijateljica (
sifra int not null primary key identity(1,1),
haljina varchar(45),
gustoca decimal(15,10) not null,
ogrlica int,
novcica decimal(12,5),
ostavljen int
);
create table sestra (
sifra int not null primary key identity(1,1),
bojakose varchar(34) not null,
hlace varchar(36) not null,
lipa decimal(15,6),
stilfrizura varchar(40) not null,
maraka decimal(12,8) not null,
prijateljica int
);

create table cura (
sifra int not null primary key identity(1,1),
lipa decimal(12,9) not null, 
introvertno bit,
modelnaocala varchar(40),
narukvica int,
treciputa datetime,
kuna decimal(14,9)
);

create table punica (
sifra int not null primary key identity(1,1),
majica varchar(40),
eura decimal(12,6) not null,
prstena int,
cura int not null,
);

alter table zarucnik_mladic add foreign key (zarucnik) references zarucnik(sifra);
alter table zarucnik_mladic add foreign key (mladic) references mladic(sifra);
alter table ostavljen add foreign key (zarucnik) references zarucnik(sifra);
alter table prijateljica add foreign key (ostavljen) references ostavljen(sifra);
alter table sestra add foreign key (prijateljica) references prijateljica (sifra);
alter table punica add foreign key (cura) references cura(sifra);

insert into mladic(lipa,narukvica, drugiputa)values 
('12345.45',2,'2019-11-17'),
('83535.45',132,'2011-12-19'),
('93857.45',17,'2001-01-23');

insert into zarucnik(asocijalno, narukvica, novcica) values 
(1, 12, '123.55'),
(0, 22, '356.895'),
(1, 1, '5647.546'),
(0, 5, '2314.777');

insert into zarucnik_mladic(zarucnik, mladic) values 
(1,1),
(2,2),
(3,3);

insert into ostavljen(introvertno, kratkamajica,prstena) values 
(1,'crna',12),
(0,'plava',22),
(1,'crvena',2);

insert into prijateljica (gustoca) values 
('135.46'),
('1453.544'),
('657.32');

insert into sestra (bojakose, hlace, stilfrizura, maraka) values 
('Crna','AB','CD','123.45'),
('Plava','Osijek','DVD','356.77'),
('Plava','Zagreb','DOS','7643.77');

insert into cura (lipa) values ('123.5353');
insert into punica (eura, cura) values ('1235.45', 1);

update punica set eura = '15.77';

delete from sestra where hlace != 'AB';

select kratkamajica from ostavljen;

select a.narukvica, f.stilfrizura, e.gustoca
from mladic a inner join zarucnik_mladic b on a.sifra = b.mladic
inner join zarucnik c on b.zarucnik = c.sifra
inner join ostavljen d on c.sifra = d.zarucnik
inner join prijateljica e on e.ostavljen = d.sifra
inner join sestra f on e.sifra = f.prijateljica
where d.introvertno is not null and c.asocijalno is not null
order by 3 desc;

select a.asocijalno, a.modelnaocala
from zarucnik a left join zarucnik_mladic b on a.sifra = b.mladic
where b.mladic is null; 