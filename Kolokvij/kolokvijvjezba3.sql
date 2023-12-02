use master;
go
drop database if exists kolokvijvjezba3;
go
create database kolokvijvjezba3 collate CROATIAN_CI_AS;
go
use kolokvijvjezba3;

create table brat (
sifra int not null primary key identity(1,1),
jmbag char(11),
ogrlica int not null,
ekstrovertno bit not null, 
);

create table prijatelj (
sifra int not null primary key identity(1,1),
kuna decimal(16,10),
haljina varchar(37),
lipa decimal(13, 10),
dukserica varchar(31),
indiferentno bit
);
create table ostavljena (
sifra int not null primary key identity(1,1),
kuna decimal(17,5),
lipa decimal(15,6),
majica varchar(36),
modelnaocala varchar(31) not null,
prijatelj int
);
create table snasa (
sifra int not null primary key identity(1,1),
introvertno bit,
kuna decimal(15,6) not null,
eura decimal(12,9) not null,
treciputa datetime,
ostavljena int not null
);

create table punica (
sifra int not null primary key identity(1,1),
asocijalno bit,
kratkamajica varchar(44),
kuna decimal(13,8) not null,
vesta varchar(32) not null,
snasa int 
);

create table prijatelj_brat (
sifra int not null primary key identity(1,1),
prijatelj int not null,
brat int not null
);

create table cura (
sifra int not null primary key identity(1,1),
dukserica varchar(49),
kuna decimal(13,7),
drugiputa datetime,
majica varchar(49),
novcica decimal (15,8),
ogrlica int not null
);

create table svekar (
sifra int not null primary key identity(1,1),
novcica decimal(13,7) not null,
suknja varchar(49) not null,
bojakose varchar(36),
prstena int,
narukvica int not null,
cura int not null
);

alter table punica add foreign key (snasa) references snasa(sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);

alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);

alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);

alter table prijatelj_brat add foreign key (brat) references brat(sifra);

insert into brat(ogrlica, ekstrovertno) values (11,1),(12,0),(3,1);
insert into prijatelj (indiferentno, haljina, lipa) values (1, 'ba','100'),(0, 'babska', '203'),
(1, 'trans kraljica', '200'), (0, 'ne', '23');
insert into prijatelj_brat(prijatelj, brat) values (1,1),(2,2),(3,3);
insert into ostavljena(modelnaocala, lipa) values ('reyban', '12.32'),('mike','92.21'),('adibus','12.10');
insert into snasa(kuna, eura, ostavljena) values ('17.60','12.23',1),
('12.32', '232.22', 2),('123.21','32.32', 3);
insert into cura (ogrlica) values (1);
insert into svekar(novcica, suknja, narukvica, cura) values ('12.22','crna',2,1)
insert into punica(kuna, vesta) values ('23.23', 'plava'),('91.22', 'crna');
update svekar set suknja = 'Osijek', novcica = '0.00', narukvica = 14, cura = 1;
select * from svekar;  

delete from punica where kratkamajica = 'AB'; 

select * from ostavljena where lipa not in ('9','10','20' ,'30' ,'35'); 
select * from ostavljena where not (lipa like '9' or lipa like '10' or lipa like '20' 
or lipa like '30' or lipa like '35');

select a.ekstrovertno, f.vesta, e.kuna
from brat a inner join prijatelj_brat b on a.sifra = b.brat
inner join prijatelj c on b.brat = c.sifra
inner join ostavljena d on c.sifra = d.prijatelj
inner join snasa e on d.sifra = e.ostavljena
inner join punica f on e.sifra = f.snasa
where d.lipa not like 91 and c.haljina like '%ba%'
order by 3 desc; 

select haljina, lipa 
from prijatelj where not exists(select * from prijatelj_brat where prijatelj.sifra = prijatelj_brat.sifra);
