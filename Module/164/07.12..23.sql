/*Datenbank ersellen*/

drop database if exists m164_demo;
create database m164_demo;
use m164_demo;

/*Tabellen erstellen*/

CREATE TABLE LerndendePerson (
    LernendenNr int primary key,
    Name VARCHAR(100),
    Vorname VARCHAR(100),
    KlassenID int
);

CREATE TABLE Modul (
    ModulNr int primary key,
    Modulbezeichnung VARCHAR(100)
);

CREATE TABLE Klasse (
    KlassenID int primary key,
    KlassenNr int,
    KlassenLPID int
);

CREATE TABLE Lehrperson (
    LehrpersonID int primary key,
    Name VARCHAR(100)
);

CREATE TABLE BesuchtesModul (
    LernendenNr int primary key,
    Module int primary key
);

/*Datein einfügen*/

insert into Lernendeperson
	(LernendenNr, nachname, name, klassenid)
values 
	(1,'Muster', 'Sarah', 1),
    (2,'Lustig', 'Peter', 2),
    (3,'Wenk', 'Georg', 3);
    
    
insert into Lehrperson
	(LehrpersonID, name)
values 
	(1,'Bruce'),
    (2,'Mirco');
    

insert into BesuchtesModul
	(LernendenNr, Module)
values 
	(1,123),
    (1,117),
    (2,123),
    (2,117),
    (3,323),
    (3,320);
    
    
insert into Modul
	(ModulNr, Modulbezeichnung)
values 
	(123,'Windows Server'),
    (117,'Netzwerktechnik'),
    (323,'Funktionale Programmierung'),
    (320,'OO-Programmierung');
    
    
insert into Klasse
	(KlassenID, KlassenNr, KlassenLPID)
values 
	(1,'IT21a',1),
    (2,'IT20f',1),
    (3,'IT20b',2);

/*Fremdschlüssel zuteilung*/

alter table LernendePerson
add foreign key (KlassenID) references Klasse(KlassenID);

alter table BesuchtesModul
add foreign key (LernendenNr) references Lernendeperson(LernendenNr),
add foreign key (Module) references Modul(ModulNr);

alter table Klasse
add foreign key (KlassenLPID) references Lehrperson(LehrpersonID);