SET @json = N'[{
	"firstname":,
	"lastname":
}]';

SET @firstlastname = 'Jan Kowalski';

SET @json = JSON_MODIFY(@json,'firstname',SUBSTRING_INDEX(firstname,' ',2));

SELECT * FROM OPENJSON(@json);