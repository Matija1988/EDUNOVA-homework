use svastara;

select a.naziv, c.naziv, b.naziv, d.naziv, e.datum, g.kratkiNaziv
from opcine a inner join zupanije b
on a.zupanija = b.sifra
inner join mjesta c on c.opcina = a.sifra
inner join dobavljaci d on d.mjesto = c.sifra
inner join primke e on e.dobavljac = d.sifra
inner join ArtikliNaPrimci f on f.primka = e.sifra
inner join artikli g on f.artikl = g.sifra
where b.naziv like '%osjecko%' and a.naziv like '%erd%'; 

