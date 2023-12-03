use master;
go
drop database if exists kolokvijvjezba5;
go
create database kolokvijvjezba5 collate croatian_ci_as;
go
use kolokvijvjezba5;

create table cura(
sifra int not null primary key identity (1,1),
carape varchar(41) not null,
maraka decimal(17,10) not null,
asocijalno bit,
vesta varchar(47) not null
);


create table svekar_cura(
sifra int not null primary key identity (1,1),
svekar int not null,
cura int not null
);

create table svekar(
sifra int not null primary key identity (1,1),
bojakose varchar(33),
majica varchar(31),
carape varchar(31) not null,
haljina varchar(43),
narukvica int,
eura decimal(14,5) not null
);

create table punac(
sifra int not null primary key identity (1,1),
dukserica varchar(33),
prviputa datetime not null,
majica varchar(36),
svekar int
);

create table punica(
sifra int not null primary key identity (1,1),
hlace varchar(43) not null,
nausnica int not null,
ogrlica int,
vesta varchar(49) not null,
modelnaocala varchar(31) not null,
treciputa datetime not null,
punac int not null,
);
create table ostavljena(
sifra int not null primary key identity (1,1),
majica varchar(33),
ogrlica int not null,
carape varchar(44),
stilfrizura varchar(42),
punica int not null
);

create table zarucnik (
sifra int not null primary key identity (1,1),
jmbag char(11),
lipa decimal(12,8),
indiferentno bit
);

create table mladic (
sifra int not null primary key identity (1,1),
kratkamajica varchar(48) not null,
haljina varchar(30) not null,
asocijalno bit,
zarucnik int
);

alter table svekar_cura add foreign key (cura) references cura(sifra);
alter table svekar_cura add foreign key (svekar) references svekar(sifra);
alter table punac add foreign key (svekar) references svekar(sifra);
alter table punica add foreign key (punac) references punac(sifra);
alter table ostavljena add foreign key (punica) references punica(sifra);
alter table mladic add foreign key (zarucnik) references zarucnik(sifra);

insert into cura (carape, maraka, vesta) values
('kratke crne','123.32','vunena crna'),
('bijele','4554.66','plava'),
('zeleno crvene','3536.44','zelena');

insert into svekar (majica, carape, eura) values
('bijela','kratke crne','123.32'),
('bijela','bijele','4554.66'),
('bijela','zeleno crvene','3536.44'),
('bijela','zeleno plave','3536.44');

insert into svekar_cura(svekar, cura) values
(1,1),
(2,2),
(3,3);

insert into punac (prviputa, majica, svekar) values 
('2004-01-10','polo crna',1),
('1987-12-20','polo plava',2),
('1988-12-25','polo zelena',3);

insert into punica (hlace, nausnica,vesta,modelnaocala,treciputa,punac) values
('Crne',2,'crna','blues brothers','2012-9-12',1),
('lewis',2,'bijela','maks dioptrija','2012-10-11',2),
('denim',2,'plava','neke vec jesu','2011-8-7',1);

insert into zarucnik (indiferentno) values 
(1),
(0),
(1);
insert into mladic (kratkamajica, haljina) values 
('polo crna','minjak'),
('kamo bez rukava','crna vecernja'),
('bijela la costa','plava');

insert into ostavljena (ogrlica, punica) values 
(17,1),
(18,2),
(2,3);

update mladic set haljina = 'Osijek';

select * from mladic;

delete from ostavljena where ogrlica = 17;

select * from ostavljena;

select majica from punac where prviputa is null;

select a.asocijalno, f.stilfrizura, e.nausnica
from cura a inner join svekar_cura b on a.sifra = b.cura
inner join svekar c on b.svekar = c.sifra
inner join punac d on b.sifra = d.svekar
inner join punica e on d.sifra = e.sifra
inner join ostavljena f on e.sifra = f.punica
where d.prviputa is not null and c.majica like '%ba%'
order by 3 desc;

select a.majica, a.carape
from svekar a inner join svekar_cura b on a.sifra = b.svekar
where b.svekar is null;