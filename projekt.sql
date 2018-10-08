DROP TABLE IF EXISTS `Dostawca`;
DROP TABLE IF EXISTS `Kelner`;
DROP TABLE IF EXISTS `KlientDostawa`;
DROP TABLE IF EXISTS `Menu`;
DROP TABLE IF EXISTS `Stolik`;
DROP TABLE IF EXISTS `Zamowienie`;

CREATE TABLE `Dostawca` (
	`idd` int(10) NOT NULL UNIQUE AUTO_INCREMENT,
	`imie` varchar(50) NOT NULL,
	`naziwsko` varchar(50) NOT NULL,
	PRIMARY KEY (`idd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Dostawca` VALUES
	(1,'Adam','Adamek'),
	(2,'Bartosz','Bartoszewski'),
	(3,'Cezary','Cezary'),
	(4,'Dariusz','Darowski'),
	(5,'Emil','Email');

CREATE TABLE `Kelner` (
	`idk` int(10) NOT NULL UNIQUE AUTO_INCREMENT,
	`imie` varchar(50) NOT NULL,
	`nazwisko` varchar(50) NOT NULL,
	PRIMARY KEY (`idk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Kelner` VALUES
	(1,'Filip','Z Konopi'),
	(2,'Grzegorz','Grzelak'),
	(3,'Helena','Hura'),
	(4,'Izabela','Iniezabela'),
	(5,'Jerzy','Jeż');

CREATE TABLE `KlientDostawa` (
	`idkd` int(10) NOT NULL UNIQUE AUTO_INCREMENT,
	`imie` varchar(50) NOT NULL,
	`nazwisko` varchar(50) NOT NULL,
	`adres` varchar(50) NOT NULL,
	`komentarz` varchar(50) DEFAULT NULL,
	`d_id` int(10) NOT NULL,
	PRIMARY KEY (`idkd`),
	KEY `d_id` (`d_id`),
	CONSTRAINT `fk_KlientDostawa_Dostawca` 
		FOREIGN KEY (`d_id`) 
		REFERENCES `Dostawca` (`idd`) 
		ON UPDATE CASCADE
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERt INTO `KlientDostawa` VALUES
	(1,'Krzysztof','Krzyżowy','ul. Kolumba 13',NULL,3),
	(2,'Lena','Lana','ul. Luna 22','Prosze narysować serduszko na pudełku <3',1),
	(3,'Michał','Małyjurek','ul. Dużych Jurków 23/32',NULL,4),
	(4,'Norman','Nienormalny','ul. Normalna 1/1','Dawać szybciutko placki',2),
	(5,'Olga','Olineczkova','ul. Imigrantow 12/34',NULL,5);

CREATE TABLE `Menu` (
	`idm` int(10) NOT NULL UNIQUE AUTO_INCREMENT,
	`nazwa` varchar(50) NOT NULL,
	`cena` float DEFAULT 0.0,
	`wege` tinyint(2) NOT NULL,
	PRIMARY KEY (`idm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Menu` VALUES
	(1,'Pizza Margherita',10.50,1),
	(2,'Pizza Salami',12.75,0),
	(3,'Sałatka Grecka',11.00,1),
	(4,'Frytki',6.50,1),
	(5,'Zapiekanka',8.50,0);

CREATE TABLE `Stolik` (
	`idst` int(10) NOT NULL UNIQUE AUTO_INCREMENT,
	`iloscOsob` int(10) NOT NULL,
	`zajety` tinyint(2) NOT NULL,
	`k_id` int(10) NOT NULL,
	PRIMARY KEY (`idst`),
	KEY `k_id` (`k_id`),
	CONSTRAINT `Stolik_ibfk_1` 
		FOREIGN KEY (`k_id`) 
		REFERENCES `Kelner` (`idk`) 
		ON UPDATE CASCADE
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Stolik` VALUES
	(1,2,0,1),
	(2,2,0,1),
	(3,4,0,2),
	(4,4,0,3),
	(5,6,0,4),
	(6,6,0,5);

CREATE TABLE `Zamowienie` (
	`idz` int(11) NOT NULL,
	`m_id` int(11) NOT NULL,
	`st_id` int(11) DEFAULT NULL,
	`kd_id` int(11) DEFAULT NULL,
	KEY `m_id` (`m_id`),
	KEY `st_id` (`st_id`),
	KEY `kd_id` (`kd_id`),
	CONSTRAINT `Zamowienie_ibfk_1` 
		FOREIGN KEY (`m_id`) 
		REFERENCES `Menu` (`idm`) 
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT `Zamowienie_ibfk_2` 
		FOREIGN KEY (`st_id`) 
		REFERENCES `Stolik` (`idst`) 
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT `Zamowienie_ibfk_3` 
		FOREIGN KEY (`kd_id`) 
		REFERENCES `KlientDostawa` (`idkd`) 
		ON UPDATE CASCADE
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Zamowienie` VALUES
	(1,1,NULL,4),
	(1,2,NULL,4),
	(2,3,1,NULL),
	(3,3,NULL,2),
	(3,4,NULL,2);