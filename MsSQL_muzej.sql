use muzej;

create table djela(
ID int,
naziv varchar(50),
autorIme varchar (20),
autorPrezime varchar(20), 
tip varchar(20),
zaIzlozbu varchar(50)
);

create table sponzori (
ID int,
ime varchar(20),
prezime varchar(20),
oib char(11),
spol char(1),

);

create table kustosi (
ID int,
ime varchar(50),
prezime varchar(50),
iban varchar(50),
oib char(11)

);

create table grupe (
ID int, 
zaIzlozbu varchar(50),
kustos varchar(50)
);


create table izlozbe(
ID int, 
naziv varchar(50), 
grupa varchar(50),
sponzor varchar(50),
prostor varchar(50)
);