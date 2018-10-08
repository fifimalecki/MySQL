SET @borrowdate = '2018-02-15';
--SET @borrowdate = '2018-02-11';

SET @returndate = adddate(@borrowdate,INTERVAL 1 MONTH);

SELECT CASE weekday(@returndate)
						  WHEN 5 THEN subdate(@returndate,INTERVAL 1 DAY)
						  WHEN 6 THEN subdate(@returndate,INTERVAL 2 DAY)
						  ELSE @returndate
						  END data_zwrotu;