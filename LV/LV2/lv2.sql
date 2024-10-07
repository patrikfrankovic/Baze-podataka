--DODATNE NAREDBE
SET DATEFORMAT dmy;--omogućava ispravno upisivanje datuma u bazu, potrebno samo jednom pokrenut

--ZAD1
CREATE TABLE osobe_pf
	(
		ime VARCHAR(30),
		prezime VARCHAR(30),
		OIB CHAR(11) PRIMARY KEY,
		datRod DATETIME,
		spol CHAR,
		visina SMALLINT,
		slika IMAGE,
		brCip DECIMAL(3,1),
		CONSTRAINT spol_osobe_pf CHECK (spol IN ('M', 'Ž')),
		CONSTRAINT visina_osobe_pf CHECK (visina > 0 AND visina < 300),
		CONSTRAINT brCip_osobe_pf CHECK (brCip > 10 AND brCip < 60)
	);

INSERT INTO osobe_pf
	(
		ime,
		prezime,
		OIB,
		datRod,
		spol,
		visina,
		brCip
	)
VALUES
	('Mario','Marin','00000000001','3.4.1998','M','177','40'),
	('Ivan','Radanović','00000000002','11.9.1970','M','180','42'),
	('Hasbulla','Magomedov','00000000003','1.1.2003','M','103','20'),
	('Marija','Fran','00000000004','1.3.1989','Ž','157','35'),
	('Željka','Katarina','00000000005','3.4.1966','Ž','168','37');
	
SELECT * FROM osobe_pf;
	
--ZAD2
UPDATE osobe_pf
SET ime = 'Radanović',
	prezime = 'Ivan'
WHERE OIB = '00000000002';

UPDATE osobe_pf
SET brCip = brCip + 2;

DELETE FROM osobe_pf
WHERE OIB = '00000000002';

--ZAD3
SELECT * FROM student
ORDER BY datUpis;

SELECT ime AS "ime_mlad",
	   prezime AS "prezime_mlad",
	   datRod AS "datRod_mlad"
FROM student
WHERE datRod < '01.01.1996'
ORDER BY prezime;

--ZAD4
SELECT s.ime,
	   s.prezime,
	   p.naziv AS "polozio",
	   i.ocjena
FROM Student AS s,
	 Predmet AS p,
	 Ispit AS i
WHERE i.mbrStud = s.mbr AND
	  i.sifPredmeta = p.sifra AND
	  i.ocjena >= 3;
	   