--create database kozmeticki;
use kozmeticki;

create table posjeta(
korisnik varchar(50),
termin datetime, 
djelatnik varchar(50),
usluga varchar(50)
);

create table korisnici (
brmobitel varchar(50),
spol char(1),
tipkoze varchar(50),
dob int, 
napomena varchar(100)
);

create table djelatnici (
ID int,
ime varchar (50),
prezime varchar(50),
specijaliziranza varchar(50)
);

create table usluga (
ID int,
naziv varchar (50),
cijena decimal (10,2)
);