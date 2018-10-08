SET @separator = ' ';
--SET @separator = '_';

SET @firstname = 'Jan';
SET @lastname = 'Kowalski';

SELECT CONCAT_WS(@separator,@firstname,@lastname) imie_naziwsko;