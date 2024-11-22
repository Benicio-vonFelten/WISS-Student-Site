create database if not EXISTS Mint;
use Mint;

-- Tabelle Erstellen
CREATE TABLE if not EXISTS Spiele (
    Name VARCHAR(255),
    Theme VARCHAR(255),
    DescEn VARCHAR(255),
    DescDe VARCHAR(255),
    AgeGroup VARCHAR(255),
    Infra VARCHAR(255),
    Teamplay VARCHAR(255),
    Cost VARCHAR(255),
    IntroDate VARCHAR(255)
);


-- Daten laden
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/actiongameTabelle.csv"
INTO TABLE Spiele
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Name, Theme, DescEn, DescDe, AgeGroup, Infra, Teamplay, Cost, IntroDate);

-- display import result
-- SELECT * FROM Spiele;