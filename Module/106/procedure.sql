delimiter //

create procedure pr_rename_employee (
	in eId int,
    in newFirstname varchar(50),
    in newlastname varchar(50))
Begin
	update employee
		set
			firstname = newFirstname,
            name = newlastname
		where employee_id = eId;
end //

delimiter ;