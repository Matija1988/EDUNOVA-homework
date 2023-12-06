use master;
go
drop database if exists kolokvijvjezba8;
go
create database kolokvijvjezba8 collate croatian_ci_as;
go
use kolokvijvjezba8;

create table prijateljica (
sifra int not null primary key identity(1,1),
vesta varchar(50),
nausnica int not null,
introvertno bit not null
);

create table cura (
sifra int not null primary key identity(1,1),
nausnica int not null,
indiferentno bit,
ogrlica int not null,
gustoca decimal(12,6),
drugiputa datetime,
vesta varchar(33),
prijateljica int
);

create table decko(
sifra int not null primary key identity(1,1),
kuna decimal(12,10),
lipa decimal(17,10),
bojakose varchar(44),
treciputa datetime not null,
ogrlica int not null,
ekstrovertno int not null
);

create table muskarac (
sifra int not null primary key identity(1,1),
haljina varchar(47),
drugiputa datetime not null,
treciputa datetime,
);

create table muskarac_decko(
sifra int not null primary key identity(1,1),
muskarac int not null,
decko int not null
);

create table becar (
sifra int not null primary key identity(1,1),
eura decimal(15,10),
treciputa datetime,
prviputa datetime,
muskarac int not null
);

create table neprijatelj(
sifra int not null primary key identity(1,1),
kratkamajica varchar(44),
introvertno bit,
indiferentno bit,
ogrlica int not null,
becar int not null
);

create table brat (
sifra int not null primary key identity(1,1),
introvertno bit,
novcica decimal(14,10) not null,
treciputa datetime,
neprijatelj int
);

alter table cura add foreign key (prijateljica) references prijateljica(sifra);
alter table muskarac_decko add foreign key (muskarac) references muskarac(sifra);
alter table muskarac_decko add foreign key (decko) references decko(sifra);
alter table becar add foreign key (muskarac) references muskarac(sifra);
alter table neprijatelj add foreign key (becar) references becar(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

insert into decko(treciputa, ogrlica, ekstrovertno) values 
('2013-02-11',2,1),
('2016-12-18',8,0),
('1987-07-07',222,1);

insert into muskarac(drugiputa) values 
('2012-10-19'),
('2007-5-27'),
('2001-9-12'),
('2011-11-19');

insert into muskarac_decko(muskarac,decko) values 
(1,1),
(2,2),
(3,3);

insert into becar(eura, muskarac) values 
('1234.12',1),
('3543.46',2),
('5255.46',3);

insert into neprijatelj(ogrlica, becar) values 
(12, 1),
(14,2),
(353,3);

insert into cura (nausnica, indiferentno, ogrlica) values 
(12,1,23),
(56,0,34),
(65,1, 23);

update cura set indiferentno = 0;

select indiferentno from cura;

insert into brat (novcica) values 
('9.24'),
('923.75'),
('1234.56');

delete from brat where novcica != '12.75';

select novcica from brat;

select prviputa from becar;

select a.bojakose, f.neprijatelj, e.introvertno 
from decko a inner join muskarac_decko b on a.sifra = b.decko
inner join muskarac c on b.muskarac = c.sifra
inner join becar d on c.sifra= d.muskarac
inner join neprijatelj e on e.becar = d.sifra
inner join brat f on f.neprijatelj = e.sifra
where d.treciputa is not null and c.drugiputa is not null
order by 3 desc
;

select a.drugiputa, a.treciputa
from muskarac a left join muskarac_decko b on a.sifra = b.muskarac
where b.muskarac is null;
