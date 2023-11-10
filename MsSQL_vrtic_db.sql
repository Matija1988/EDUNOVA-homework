--create database vrtic;

use  vrtic;

create table odgojnaskupina (
ID int,
grupa varchar(50),
prostorija varchar(50),
odgajateljica varchar(50)

);

create table grupe(
ID int,
naziv varchar(50), 
djete varchar(50)
);

create table djeca (
ID int,
ime varchar(50),
prezime varchar(50),
spol bit,
imeOca varchar(50),
prezimeOca varchar(50),
imeMajke varchar(50),
prezimeMajke varchar(50)

);

create table odgajateljice (
strucnasprema varchar(50),
ime varchar(50),
prezime varchar(50),
oib char(11), 
iban varchar(50)

);
