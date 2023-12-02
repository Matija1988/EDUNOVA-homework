use master;
go
drop database if exists kolokvijvjezba2;
go
create database kolokvijvjezba2 collate CROATIAN_CI_AS;
go
use kolokvijvjezba2;

create table decko (
sifra int not null primary key identity(1,1),
indiferentno bit, 
vesta varchar(34),
asocijalno bit not null
);

create table cura (
sifra int not null primary key identity(1,1),
haljina varchar(33) not null,
drugiputa datetime not null, 
suknja varchar(38),
narukvica int,
introvertno bit,
majica varchar(40) not null,
decko int 
);
create table neprijatelj (
sifra int not null primary key identity(1,1),
majica varchar(32),
haljina varchar(43) not null,
lipa decimal(16,8),
modelnaocala varchar (49) not null,
kuna decimal (12,6) not null,
jmbg char (11),
cura int
);

create table brat(
sifra int not null primary key identity(1,1),
suknja varchar(47),
ogrlica int not null, 
asocijalno bit not null,
neprijatelj int not null
);

create table zarucnica (
sifra int not null primary key identity(1,1),
narukvica int,
bojakose varchar(37) not null,
novcica decimal (15,9),
lipa decimal (15,8) not null,
indiferentno bit not null
);
create table decko_zarucnica(
sifra int not null primary key identity(1,1),
decko int not null,
zarucnica int not null
);

create table svekar(
sifra int not null primary key identity(1,1),
stilfrizura varchar(48),
ogrlica int,
asocijalno bit 
);
create table prijatelj(
sifra int not null primary key identity(1,1),
modelnaocala varchar(37),
treciputa datetime not null, 
ekstrovertno bit,
prviputa datetime,
svekar int
);

alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table cura add foreign key (decko) references decko(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table prijatelj add foreign key (svekar) references svekar(sifra);

insert into decko (asocijalno, vesta) values (1, 'baba'),(0, 'blaba'),(1, 'crna vuna'),(1, 'plava');
insert into cura (haljina, drugiputa, majica) values ('kratka crna','2013-01-10','crvena'),
('duga crvena','2014-05-12','bijela'),('plava','2009-09-12','crna');
insert into neprijatelj (haljina, modelnaocala, kuna) values 
('Kratka roza','chao chao 2000','67.98'),('baba','jin jang 007','107.23'),
('Gucci model 666','raijbun','123.12'); 
insert into zarucnica (bojakose, lipa, indiferentno) values 
('Crna','1000',1),('Crvena','2000',0),('Plava','500',1);
insert into decko_zarucnica(decko, zarucnica) values (1,1),(2,2), (3,3);
insert into brat(ogrlica, asocijalno, neprijatelj) values (1, 0, 1),(2,1,2),(5,1,3);
update prijatelj set treciputa = '2020-4-30';

delete from brat where ogrlica != 14;

select haljina from cura;

select f.novcica, d.neprijatelj, c.haljina, b.drugiputa, a.vesta
from decko a inner join cura b on b.decko = a.sifra
inner join neprijatelj c on c.cura = b.sifra
inner join brat d on d.neprijatelj = c.sifra
inner join decko_zarucnica e on e.decko = a.sifra
inner join zarucnica f on f.sifra = e.zarucnica
where a.vesta like '%ba%'
order by 3 desc;


select vesta, asocijalno 
from decko where not exists (select * from decko_zarucnica where decko.sifra = decko_zarucnica.sifra);


