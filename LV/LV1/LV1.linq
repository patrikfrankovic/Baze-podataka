<Query Kind="SQL">
  <Connection>
    <ID>e7bde5b8-6498-4236-b17a-15fc85544f45</ID>
    <Persist>true</Persist>
    <Server>192.168.20.20</Server>
    <SqlSecurity>true</SqlSecurity>
    <UserName>student</UserName>
    <Password>AQAAANCMnd8BFdERjHoAwE/Cl+sBAAAAculE2XJRiEq4QnZ5pJhQaAAAAAACAAAAAAAQZgAAAAEAACAAAAD1CyARQNiTX3gAdOBRBGN+yKFejdUz87zeJvgxy3oHCQAAAAAOgAAAAAIAACAAAAALVdeIdXHzkA952jCkKKkcNO+DDnIcMpBuo/LP0NQdEBAAAAARLGpfsnZJyN9hiIr5CA4DQAAAAKMuJQQVnoglUcq+rqNsGBdSWkIFt2QK4HPiCOsW3b8RtcpUkYv33jxGSwuGMYGRyYH5dv0ROS7tyAhb8sQtx94=</Password>
    <Database>student</Database>
    <ShowServer>true</ShowServer>
    <NoPluralization>true</NoPluralization>
  </Connection>
</Query>

--ZAD 2
CREATE TABLE smartphone_frankovic(
imei CHAR(15) PRIMARY KEY,
naziv_proizvođača VARCHAR(30),
naziv_modela VARCHAR(30),
količina_memorije SMALLINT,
takt_procesora DECIMAL(2,1),
veličina_zaslona DECIMAL(4,2),
naziv_OSa VARCHAR(30),
datum_zadnje_nadogradnje_OSa SMALLDATETIME,
ime_korisnika VARCHAR(30),
prezime_korisnika VARCHAR(30)
);

--ZAD3
CREATE TABLE djelatnik_frankovic(
matbr CHAR(13) PRIMARY KEY,
ime VARCHAR(30),
prezime VARCHAR(30)
);

CREATE TABLE projekt_frankovic(
oznaka VARCHAR(30) PRIMARY KEY,
naziv CHAR(30)
);

CREATE TABLE radi_na_frankovic(
matbr CHAR(13),
oznaka VARCHAR(30),
broj_dana SMALLINT,
CONSTRAINT radi_na_fk_djelatnik FOREIGN KEY(matbr) REFERENCES djelatnik_frankovic(matbr),
CONSTRAINT radi_na_fk_projekt FOREIGN KEY(oznaka) REFERENCES projekt_frankovic(oznaka),
CONSTRAINT radi_na_pk PRIMARY KEY(matbr,oznaka)
);

--ZAD 4
CREATE TABLE grupa_frankovic(
id_grupe CHAR(10) PRIMARY KEY,
oznaka_grupe VARCHAR(30) UNIQUE,
smjer VARCHAR(50),
broj_studenta SMALLINT
);

--ZAD 5
CREATE TABLE student_frankovic(
br_indexa CHAR(10) PRIMARY KEY,
grupa CHAR(10),
ime VARCHAR(30),
prezime VARCHAR(30),
godina_upisa SMALLDATETIME,
godina_studija SMALLDATETIME,
CONSTRAINT student_fk_frankovic FOREIGN KEY(grupa) REFERENCES grupa_frankovic(id_grupe)
);

--ZAD 6
ALTER TABLE student_frankovic ADD prosjek DECIMAL(3,2);
ALTER TABLE student_frankovic ADD CONSTRAINT prosjek_limit CHECK(prosjek >= 1);
ALTER TABLE student_frankovic DROP COLUMN godina_studija;
	