-- Transaktion starten um evtl. Fehler abzufangen
BEGIN;

-- Datenbankkontext festl3egen
USE m106_edu_games;

/* 
    Foreign Key Checks deaktivieren
*/
SET FOREIGN_KEY_CHECKS = 0;

/* 
    Datensätze importieren
*/

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/106-1A-assignment.csv'
INTO TABLE assignment
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
-- keine Mappings notwendig

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/106-1A-department.csv'
INTO TABLE department
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
-- keine Mappings notwendig

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/106-1A-employee_assignment.csv'
INTO TABLE employee_assignment
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(employee_id, assignment_id, date, time);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/106-1A-employee_salary.csv'
INTO TABLE employee_salary
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(employee_id, salary_id, percentage, @valid_date); -- valid_date aus CSV ist leer -> ignorieren

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/106-1A-employee.csv'
INTO TABLE employee
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
-- keine Mappings notwendig

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/106-1A-project.csv'
INTO TABLE project
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(project_id, name, game_id)
set head_id = 1; -- Wert fehlt, muss eingefügt werden

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/106-1A-salary.csv'
INTO TABLE salary
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
-- keine Mappings notwendig

/* 
    Foreign Key Checks aktivieren
*/
SET FOREIGN_KEY_CHECKS = 1;

-- Transaktion zurücksetzen -> bei Bedarf entkommentieren
-- ROLLBACK;