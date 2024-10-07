--ZAD1
SELECT CONCAT(SUBSTRING(ime, 1, 1),'. ', SUBSTRING(prezime, 1, 1),'.') AS inic, datRod
FROM student;

SELECT ime, prezime--,datRod
FROM student
WHERE datRod = (
    SELECT MIN(datRod)
    FROM student
	WHERE spol = 'F');

--ZAD2
SELECT COUNT(*) AS BrStud
FROM student;

SELECT COUNT(DISTINCT CONCAT(SUBSTRING(ime, 1, 1),'. ', SUBSTRING(prezime, 1, 1),'.')) AS BrIncStud
FROM student;

SELECT COUNT(DISTINCT pbrPreb) AS BrStudPreb
FROM student;

--ZAD3
SELECT AVG(ocjena) AS prosjek
FROM ispit
WHERE ocjena > 1;

--ZAD4
SELECT ime, prezime, AVG(ocjena) AS prosjek
FROM ispit, student
WHERE mbr = mbrStud AND ocjena > 1
GROUP BY ime,prezime
ORDER BY prosjek DESC;

SELECT mbr, AVG(ocjena) AS prosjek
FROM ispit, student
WHERE mbr = mbrStud AND ocjena > 3.2
GROUP BY mbr
ORDER BY prosjek;

--ZAD5
CREATE VIEW slIspit AS
SELECT ime, prezime, ocjena, datIspita, naziv
FROM ispit, student, predmet
WHERE mbr = mbrStud AND sifra = sifPredmeta;


DROP VIEW slIspit;
