use master;
go
drop database if exists kolokvijvjezba4;
go 
create database kolokvijvjezba4 collate CROATIAN_CI_AS;
go
use kolokvijvjezba4;

create table prijatelj(
sifra int primary key not null identity(1,1),
eura decimal(16,9),
prstena int not null, 
gustoca decimal(16,5),
jmbag char(11) not null,
suknja varchar(47) not null,
becar int not null
);


create table becar(
sifra int primary key not null identity(1,1),
novcica decimal(16,9),
kratkamajica varchar(48) not null,
bojaociju varchar(36) not null,
snasa int not null
);
create table snasa(
sifra int primary key not null identity(1,1),
introvertno bit,
treciputa datetime,
haljina varchar(44) not null,
zena int not null
);


create table zena(
sifra int primary key not null identity(1,1),
suknja varchar(39) not null,
lipa decimal (18,7),
prstena int not null
);


create table zena_mladic(
sifra int primary key not null identity(1,1),
zena int not null,
mladic int not null
);

create table mladic(
sifra int not null primary key identity(1,1),
kuna decimal (15,9),
lipa decimal(18,5),
nausnica int,
stilfrizura varchar(49),
vesta varchar(34)
);

create table punac (
sifra int not null primary key identity(1,1),
treciputa datetime,
majica varchar(46),
jmbag char(11) not null,
novcica decimal(18,7) not null,
maraka decimal(12,6) not null,
ostavljen int
); 

create table ostavljen(
sifra int not null primary key identity(1,1),
modelnaocala varchar(43),
introvertno bit,
kuna decimal(14,10)
);

alter table prijatelj add foreign key (becar) references becar(sifra);
alter table becar add foreign key (snasa) references snasa(sifra);
alter table snasa add foreign key (zena) references zena(sifra);
alter table zena_mladic add foreign key (zena) references zena(sifra);
alter table zena_mladic add foreign key (mladic) references mladic(sifra);
alter table punac add foreign key (ostavljen) references ostavljen(sifra);


insert into zena(lipa, suknja, prstena) values 
('1234','Crna',1),
('333','Plava',2),
('444','Crvena',3),
('3424','Roza',3);


insert into snasa(haljina, zena) values
('Crvena',1),
('Plava',2),
('Crna',3);

insert into becar(kratkamajica, bojaociju, snasa) values 
('Polo plava','smeđa',1),
('Iron maiden','plava',2),
('Crna','zelena',3);


insert into mladic (vesta) values 
('Crna'),
('Plava'),
('Zelena');
insert into zena_mladic(zena, mladic) values 
(1,1),
(2,2),
(3,3);
insert into ostavljen (modelnaocala) values (''),(''),('');

insert into punac (majica, jmbag, novcica, maraka, ostavljen) values 
('Crna','12345678910', '12.13', '123.323', 1),
('Crna','12345678910', '12.13', '123.323', 2),
('Crna','12345678910', '12.13', '123.323', 3);

update punac set majica = 'Osijek';

select * from punac;

insert into prijatelj (prstena, jmbag, suknja, becar) values 
(18, '12345678910','crna',1),
(19, '12345678911','crvena',2),
(1, '12345678912','plava',3);

delete from prijatelj where prstena > 17;

select * from prijatelj;

select haljina from snasa where treciputa is null;

select a.nausnica, f.jmbag, e.kratkamajica
from mladic a inner join zena_mladic b on a.sifra = b.mladic
inner join zena c on c.sifra = b.zena
inner join snasa d on c.sifra = d.zena
inner join becar e on d.sifra = e.snasa
inner join prijatelj f on e.sifra = f.sifra
where d.treciputa is not null and c.lipa != 29
order by kratkamajica desc
;

select a.lipa, a.prstena
from zena a left join zena_mladic b on a.sifra = b.zena
where b.zena is null;