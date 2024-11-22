/*
    Datenbank erstellen
*/
DROP DATABASE IF EXISTS m106_edu_games;
CREATE DATABASE m106_edu_games;
USE m106_edu_games;

/*
    Tabellenstrukturen erstellen
*/
CREATE TABLE salary(
    salary_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(13,2) NOT NULL
);

CREATE TABLE employee_salary(
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    salary_id INT NOT NULL,
    percentage FLOAT DEFAUlT NULL,
    valid_date DATE DEFAULT NULL
);

CREATE TABLE employee(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) DEFAULT NULL,
    firstname VARCHAR(50) DEFAULT NULL,
    department INT NOT NULL
);

CREATE TABLE department(
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) DEFAULT NULL,
    head INT DEFAULT NULL
);

CREATE TABLE employee_assignment(
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    assignment_id INT NOT NULL,
    date DATE DEFAULT NULL,
    time TIME DEFAULT NULL
);

CREATE TABLE assignment(
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) DEFAULT NULL,
    project_id INT NOT NULL,
    priority ENUM("A","B","C") DEFAULT NULL,
    status ENUM("in Bearbeitung","wartend","Abgeschlossen") DEFAULT NULL
);

CREATE TABLE project(
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) DEFAULT NULL,
    head_id INT NOT NULL,
    game_id INT NOT NULL
);

/*
    Fremdschlüssel-Beziehungen erstellen
*/
ALTER TABLE employee_salary
    ADD CONSTRAINT fk_employee_salary_salary
    FOREIGN KEY (salary_id) REFERENCES salary(salary_id),
    ADD CONSTRAINT fk_employee_salary_employee
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

ALTER TABLE employee
    ADD CONSTRAINT fk_employee_department
    FOREIGN KEY (department) REFERENCES department(department_id);

ALTER TABLE department
    ADD CONSTRAINT fk_department_employee
    FOREIGN KEY (head) REFERENCES employee(employee_id);

ALTER TABLE employee_assignment
    ADD CONSTRAINT fk_employee_assignment_employee
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    ADD CONSTRAINT fk_employee_assignment_assignment
    FOREIGN KEY (assignment_id) REFERENCES assignment(assignment_id);

ALTER TABLE assignment
    ADD CONSTRAINT fk_assignment_project
    FOREIGN KEY (project_id) REFERENCES project(project_id);

ALTER TABLE project
    ADD CONSTRAINT fk_project_employee
    FOREIGN KEY (head_id) REFERENCES employee(employee_id);