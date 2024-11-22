


CREATE USER 'klasse'@'%' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON m164_demo TO 'finance'@'%';
SHOW GRANTS FOR 'finance'@'%';
