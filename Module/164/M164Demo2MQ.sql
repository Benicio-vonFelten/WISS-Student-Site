UPDATE sq5b.employee
SET department = 1
WHERE name LIKE 'a%';

UPDATE sq5b.employee
SET department = 3
WHERE name LIKE 'm%' and not firstname like "m%";

UPDATE sq5b.employee
SET department = 4
WHERE firstname like "s%";

UPDATE sq5b.employee
SET department = 5
WHERE name LIKE 'm%' and firstname like "m%";

UPDATE sq5b.employee
SET department = 7
WHERE firstname like "f%";

UPDATE sq5b.employee
SET department = 6
WHERE department = 1 or department = 0;



/*name like = "a%";*/
/*where game_id = 3 and score > 75;*/
/*where klassenId is null;*/
/*order by Vorname desc;*/ 

