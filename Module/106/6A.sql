

use m106_edu_games;

create view v_kunde as
	SELECT customer_id, name
	FROM customeraccount;


-- Erstelle eine View v_abteilungen, die jeden Department-Namen als Abteilung und den vollständigen 
-- Namen der Führungsperson (head) als Leitung ausgibt. 
-- Diese View ist für alle Employees lesbar (Rolle erstellen wenn noch nicht vorhanden).
create view v_abteilung as
	select name as Abteilung, head as Leitung
	from department;
    
-- Erstelle eine View v_top_sales zur Anzeige der Games, die mindestens 3 mal verkauft wurden
-- Zeige die game_id, den titel und die Anzahl der Verkäufe an. 
-- Die View ist für alle Mitarbeiter der Marketing-Abteilung lesbar (Rolle erstellen wenn noch nicht vorhanden).

create view v_top_salessales as
	select salesdate as Verkaufsdaten, game_id
	from sales;
    
-- Erstelle eine View v_top_buyer, welche
-- die Kunden ausgibt, welche insgesamt für mehr als 30 Geldeinheiten eingekauft haben
-- die View zeigt folgende Informationen an:
	-- KundenID
	-- Namen
	-- Gesamtpreis der gekauften Artikel 
-- sortiere die Ausgabe nach Preis absteigend
-- Die View ist für alle Mitarbeiter der Marketing-Abteilung lesbar (Rolle erstellen wenn noch nicht vorhanden).

create view v_top_buyer as
	select customer_id, name
	from customeraccount;
    
			
-- Erstelle eine View v_mitarbeiter, welche ID, Vollnamen und Department der employees anzeigt, die KEIN Department leiten 😊
-- Die Mitarbeiter der HR bekommen nur noch Lese- und Schreibrechte auf der View v_mitarbeiter, sie dürfen die Tabelle employee nicht mehr direkt lesen und schreiben.
-- Testen Sie die View und das erstellte Berechtigungssystem!

create view v_mitarbeiter as
	select employee_id, concat(firstname," ",name) as name, department
    from employee;
    
select * from m106_edu_games.v_abteilung;
select * from m106_edu_games.v_kunde;
select * from m106_edu_games.v_top_salessales;
select * from m106_edu_games.v_top_buyer;
select * from m106_edu_games.v_mitarbeiter;