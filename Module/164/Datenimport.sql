use m164_rezept;

load data infile "Pfad"
into table rezept
fields
	terminated by ";"
lines
	terminated by 0x0d0a
ignore 1 lines
(@rezeptId,name,@Kochanleitung,@anzahlPortionen,@schwierigkeitsID)
set
	ranking = 20*@ranking,
    name = concat(@name," ",@lastname)
;

select * from rezept;