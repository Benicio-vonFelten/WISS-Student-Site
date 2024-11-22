-- Datenbank löschen (falls vorhanden) & neu erstellen
drop database if EXISTS m164_rezept;
create database m164_rezept;
use m164_rezept;

-- Tabellen erstellen
CREATE TABLE rezept (
    rezeptId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    Kochanleitung VARCHAR(255),
    anzahlPortionen INT,
    schwierigkeitsID INT NOT NULL
);

create table schwierigkeitsstufe (
	schwierigkeitsID int Primary key AUTO_INCREMENT,
    name VARCHAR(50) not null
);

create table zutat (
	zutatid int Primary key AUTO_INCREMENT,
    name VARCHAR(50) not null
);

create table rezept_zutat (
	rezeptId int not null,
    zutatid int not null,
    menge int,
    einheit varchar(3)
);

-- Fremdschlüssel erstellen
alter table rezept
	add constraint fk_rezept_schwierigkeitsstufe
    FOREIGN KEY (rezeptId) references schwierigkeitsstufe(schwierigkeitsID);

alter table rezept_zutat
	add constraint fk_rezept_zutat_rezept
    FOREIGN KEY (rezeptId) references rezept(rezeptId),
	add constraint fk_zutatid
    FOREIGN KEY (zutatid) references zutat(zutatid);