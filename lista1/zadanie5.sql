SET @firstname = 'Jan', @lastname = 'Kowalski';
-- Set @firstname = 'Szymon', @lastname = 'Chyła';

SELECT (IF(left(@firstname,2)=('ch'or'sz'or'cz'or'dz'or'rz'),
	left(@firstname,2),
	left(@firstname,1)))
	   +
(IF(left(@lastname,2)=('ch'or'sz'or'cz'or'dz'or'rz'),
	left(@lastname,2),
	left(@lastname,1)));