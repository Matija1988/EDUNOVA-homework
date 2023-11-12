--create database opg;

use opg;

create table sirovine(
id int, 
naziv varchar(50),
cijena decimal (12,2)
);

create table postupci (
sirovina varchar(50),
proizvod varchar(50),
djelatnik varchar(50)
);

create table proizvodi(
id int,
naziv varchar(50), 
postupak varchar(50),
cijena decimal (12,2)
);

create table djelatnici(
id int, 
ime varchar(50),
prezime varchar(50),
oib char(11),
iban varchar(50)
);
