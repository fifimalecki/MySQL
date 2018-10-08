SET @dateofbirth = '2000-11-11';
--SET @dateofbirth = '2000-01-01';

SELECT CASE WHEN month(now())-month(@dateofbirth) < 0 
				THEN year(now())-year(@dateofbirth)-1 
			WHEN month(now())-month(@dateofbirth) > 0 
				THEN year(now())-year(@dateofbirth) 
			WHEN month(now())-month(@dateofbirth) = 0 
				THEN CASE 
					 WHEN day(now())-day(@dateofbirth) < 0 
					 	THEN year(now())-year(@dateofbirth)-1 
					 WHEN day(now())-day(@dateofbirth) >= 0 
					 	THEN year(now())-year(@dateofbirth) END END lat;