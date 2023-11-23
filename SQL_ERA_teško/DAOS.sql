use master;
go
drop database if exists zbirkaMaticnihKnjigaDAOS;
go
create database zbirkaMaticnihKnjigaDAOS collate Croatian_CI_AS;
go
use zbirkaMaticnihKnjigaDAOS;

create table zahtjevi(
id int not null primary key identity(1,1),
brojzahtjeva varchar(50) not null, 
opiszahtjeva varchar(1000) not null,
datumPodnosenja datetime not null,
podnositelj int not null
);

create table podnositelji(
id int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
oib char(11) not null,
email varchar(200) not null,
brMob varchar(30)
);

alter table zahtjevi add foreign key (podnositelj) references podnositelji(id);

insert into podnositelji(ime, prezime, oib, email, brMob) values
('Otto','Struppi','12345678910','secesija@gmail.com',null),
('Alen','Lorkin','12345678911','lore@gmail.com','+38594000111'),
('Dino','Hamilton','12345678912','hamilton@gmail.com',null),
('Bole','Veličanstveni','12345678913','mrš@hotmail.com','+38596666999'),
('Ana Marija','Hoffstader','12345678914','obiteljskodrvo@company.com','+38591222333');

insert into zahtjevi(brojzahtjeva,opiszahtjeva,datumPodnosenja,podnositelj) 
values('DAOS-MK-1', 'Razlog 1', '2021-10-11 09:00:00', 1),
('DAOS-MK-2', 'Razlog 2', '2021-11-12 10:00:00', 2),
('DAOS-MK-3', 'Razlog 3', '2021-11-13 11:00:00', 3),
('DAOS-MK-4', 'Razlog 4', '2021-11-17 12:00:00', 4),
('DAOS-MK-5', 'Razlog 5', '2021-11-18 12:10:00', 5),
('DAOS-MK-6', 'Razlog 6', '2021-11-20 09:00:00', 1);
