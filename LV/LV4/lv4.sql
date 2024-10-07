
--ZAD1
CREATE FUNCTION Pretrazi_tekst_fuk (@tekst VARCHAR(300), @unos VARCHAR(15))
RETURNS INT
BEGIN
	DECLARE @num INT;
	SET @num = 0;
	IF(LEN(@tekst)<LEN(@unos))
	BEGIN
		RETURN @num;
	END
	ELSE
	BEGIN
		WHILE (CHARINDEX(@unos, @tekst)>0)
		BEGIN
			SET @num = @num + 1;
			SET @tekst = SUBSTRING(@tekst,CHARINDEX(@unos, @tekst),LEN(@tekst)-CHARINDEX(@unos, @tekst))
		END
	END
	RETURN @num;
END

SELECT dbo.Pretrazi_tekst_fuk ('Lorem ipsum dolor sit amet', 'ipsum');

CREATE PROCEDURE Pretrazi_tekst (@tekst VARCHAR(300), @unos VARCHAR(15)) AS
BEGIN
	DECLARE @num INT;
	SET @num = 0;
	IF(LEN(@tekst)<LEN(@unos))
	BEGIN
		PRINT 'Neispravan unos';
	END
	ELSE
	BEGIN
		WHILE (CHARINDEX(@unos, @tekst)>0)
		BEGIN
			SET @num = @num + 1;
			SET @tekst = SUBSTRING(@tekst,CHARINDEX(@unos, @tekst),LEN(@tekst)-CHARINDEX(@unos, @tekst))
		END
	PRINT @num ;
	END
END

EXEC Pretrazi_tekst 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas auctor ipsum vitae augue commodo dictum. Cras semper arcu lorem, a sodales eros aliquam et. Nulla varius vel ipsum sed sodales. Donec eu est sed augue consectetur ornare. Etiam tellus quam, pharetra ac sem sit amet, gravida congue sapien. Cras at congue felis. Nullam ex dui, pharetra bibendum congue vel, facilisis quis libero. Praesent luctus, quam nec pharetra iaculis, felis risus laoreet ex, vel sagittis dolor dui ac libero. Cras venenatis libero quis nulla convallis hendrerit. Donec eu convallis neque, quis fermentum arcu', 'Cras';

--ZAD 2
CREATE TABLE racuni_1534(
broj INT,
datum DATETIME NOT NULL,
kupac CHAR(100),
CONSTRAINT racuni_pk_1534 PRIMARY KEY(broj)
);


CREATE TABLE stavke_racuna_1534(
broj_racuna INT,
rb INT,
kolicina DECIMAL(5,2) NOT NULL DEFAULT 1,
jm CHAR(3) NOT NULL DEFAULT 'kom',
naziv_robe VARCHAR(30) NOT NULL,
cijena DECIMAL(6,2) NOT NULL,
CONSTRAINT stavke_pk_1534 PRIMARY KEY(broj_racuna, rb),
CONSTRAINT stavke_fk_racuni_1534 FOREIGN KEY(broj_racuna) REFERENCES
racuni_1534 (broj) ON DELETE CASCADE,
CONSTRAINT stavke_chk_jm_1534 CHECK(jm IN ('kom', 'lit', 'kg')),
CONSTRAINT stavke_chk_kolicina_1534 CHECK(kolicina > 0)
);

ALTER TABLE stavke_racuna_1534 ADD ukupno DECIMAL(8,2);

CREATE TRIGGER IzracunUkupno1534
ON stavke_racuna_1534
AFTER INSERT, UPDATE
AS
DECLARE @broj_racuna INT;
DECLARE @rb INT;
SELECT @broj_racuna = broj_racuna, @rb = rb
 FROM inserted;
UPDATE stavke_racuna_1534 
SET ukupno = kolicina * cijena 
IF(ukupno > 100)
BEGIN
SET ukupno = ukupno *1.1;
END
WHERE broj_racuna = @broj_racuna AND rb = @rb;


INSERT INTO stavke_racuna_1534 VALUES(1, 1, 10, 'kom', 'jogurt', 2, NULL);
