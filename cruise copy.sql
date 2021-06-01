

DROP DATABASE IF EXISTS DBMS;
CREATE DATABASE IF NOT EXISTS DBMS;
USE DBMS;


/*
 *	TABLE DEFINITIONS
 */
 
DROP TABLE IF EXISTS CONTINENTS;
CREATE TABLE IF NOT EXISTS CONTINENTS
	(
		contID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
        contName VARCHAR(25) NOT NULL UNIQUE
    )
;


DROP TABLE IF EXISTS COUNTRIES;
CREATE table if not exists COUNTRIES 
	(
		id integer not null primary key auto_increment,
		name VARCHAR(45)
    )
;

DROP table IF EXISTS COUNTRIES;
CREATE table if not exists COUNTRIES 
	(
		ctryID integer not null primary key auto_increment,
		ctryName VARCHAR(45) unique,
        id_cont INTEGER NOT NULL,
        FOREIGN KEY(id_cont) REFERENCES CONTINENTS(contID)
        ON DELETE CASCADE ON UPDATE CASCADE
    )
;


DROP TABLE IF EXISTS PORTS;
CREATE table if not exists PORTS 
	(
		id integer not null primary key auto_increment,
		name VARCHAR(60),
        id_country integer not null,
        FOREIGN KEY(id_country) references COUNTRIES(ctryID)
        ON DELETE CASCADE ON UPDATE CASCADE
    )
;

ALTER table PORTS add UNIQUE index (name, id_country);
ALTER table PORTS CHANGE name porName VARCHAR(60) NOT NULL;
ALTER table PORTS CHANGE id id integer not null;
ALTER table PORTS DROP PRIMARY KEY;
ALTER table PORTS CHANGE id porID integer not null primary key auto_increment;



DROP TABLE IF EXISTS STAFF;
CREATE TABLE IF NOT EXISTS STAFF (
	staID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    staName VARCHAR(45) NOT NULL,
    staSurname VARCHAR(60) NOT NULL,
    
    staSalary DOUBLE(4,2) NOT NULL,
    staAccountNo VARCHAR(30) NOT NULL,
    staStartDate date NOT NULL,
    staEndDate date,
    staPhoneNo VARCHAR(20),
    staAddress VARCHAR(60),
    staInsuranceNo VARCHAR(20)
);
ALTER TABLE staff CHANGE staSalary staSalary DOUBLE(10,2) NOT NULL;


    
   


DROP TABLE IF EXISTS CUSTOMERS;
CREATE TABLE IF NOT EXISTS CUSTOMERS (
	custID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    custName VARCHAR(50) NOT NULL,
    custSurname VARCHAR(50) NOT NULL,
    custCardNo VARCHAR(20),
    custSocialSecurityNo VARCHAR(20),
	custAddress VARCHAR(100));
    
DROP TABLE IF EXISTS HOTELS;    
CREATE TABLE IF NOT EXISTS HOTELS (
	hotID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	hotLocID INTEGER NOT NULL,
    hotPricePerNight DOUBLE (10,2),
    hotPriceCurrency VARCHAR(6),
    hotAddress VARCHAR(50),
    hotTelephoneNo VARCHAR(20),
    hotContactEmail VARCHAR(45));
    
    
ALTER table hotels ADD hotName VARCHAR(30);
    



DROP TABLE IF EXISTS BOOKINGS;
CREATE TABLE IF NOT EXISTS BOOKINGS (
	bookID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bookCustomerID INTEGER NOT NULL,
    bookPackageID INTEGER NOT NULL,
    bookNoOfPackPurchased INTEGER NOT NULL DEFAULT 1);

DROP TABLE IF EXISTS PACKAGES;    
CREATE TABLE IF NOT EXISTS PACKAGES (
	packID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    packTitle VARCHAR(30) NOT NULL,
	packDescription TEXT,
    packLocationID INTEGER NOT NULL,
    packHotelID INTEGER NULL,
    packDuration TINYINT NOT NULL,
    packPrice DOUBLE (10,2) NULL,
    packPriceCurrency VARCHAR(3),
    packrefNo TINYINT NOT NULL DEFAULT 1,
    packStartDate DATE NOT NULL,
    packEndDate DATE NOT NULL,
    packDiscountAt TINYINT,
    packDiscountAmnt DOUBLE (4,2),
    packTransportIncluded BOOL DEFAULT false,
    
    FOREIGN KEY (packLocationID) REFERENCES PORTS (porID)
    ON UPDATE CASCADE,
    
    FOREIGN KEY (packHotelID) REFERENCES HOTELS (hotID) 
    ON UPDATE CASCADE 
	);


DROP PROCEDURE IF EXISTS customerStatusAll;
DELIMITER $$
CREATE PROCEDURE customerStatusAll ()
BEGIN
	SELECT concat(custName, ' ', custSurname) as 'Name', count(bookCustomerID) as 'Number of bookings', sum(packPrice) as 'Total Spent (EUR)'
	from customers 
	join bookings on bookCustomerID=custID 
	join packages on bookPackageID=packID
	group by bookCustomerID;
END;
$$
DELIMITER ;


DROP PROCEDURE IF EXISTS packageStatus;
DELIMITER $$
CREATE PROCEDURE packageStatus()
begin
	select a.packTitle as 'Title', porName as 'port Name', count(a.bookCustomerID) as 'Number of Reservations'
	from (	select packTitle, packLocationID, bookCustomerID from packages left join bookings
			on bookPackageID=packID) as a 
    inner join PORTS on
	a.packLocationID=porID
	group by (a.packLocationID)
	;
end;
$$
DELIMITER ;

    
    














/*
 *	INSERTS
 */
 INSERT INTO CONTINENTS (contName) VALUES 	('AFRICA'), 
											('EUROPE'), 
											('ASIA'), 
											('SOUTH AMErICA'), 
											('NORTH AMERICA'), 
											('   AuSTRALIa'), 
											('ANTArctICA');
  
  
 /*
  *	INDEX
  */
  
CREATE INDEX ord_Cont on CONTINENTS (contName);               

DELETE FROM CONTINENTS WHERE contName='ASIA';
INSERT INTO CONTINENTS(contName) VALUES ('Asia ');


        

INSERT INTO COUNTRIES (ctryName, id_cont) VALUES 
	('Italy', 2),
    ('Greece', 2),
    ('SPAIN', 2),
    ('Portugal', 2),
    ('germany', 2),
    ('romania', 2),
    ('croatia', 2),
    ('the uk', 2),
    ('ireland', 2),
    ('turkey', 8),
    ('russia', 8),
    ('HOlland', 2),
    ('FranCe', 2),
    ('Australia', 6);
CREATE INDEX ctry_Ind on COUNTRIES (ctryName);


INSERT INTO PORTS (porName, id_country) values
	('Bari', 1),
    ('Corfu', 1),
    ('Bilbao', 1),
    ('Mumbai', 2),
    ('Hamburg', 3),
    ('Midia', 4),
    ('Zadar', 5),
    ('Felixstowe', 10),
    ('Dublin', 10),
    ('Mercin', 11),
    ('Vladivostok', 11),
    ('Rotterdan', 12),
    ('Brest', 13),
    ('Sydney', 13),
    


UPDATE COUNTRIES set ctryName=upper(ctryName) WHERE 1=1;	# Required disabling safe mode

INSERT INTO CUSTOMERS	(custName, custSurname, custCardNo, custSocialSecurityNo, custAddress) VALUES
						
						('Emilia', 'Clarke', '4716785105999216', '044-20-3064', '15 New Sandridge, Newbiggin-by-the-Sea NE64 6DX, UK'),
                        ('Sherlock', 'Holmes', '5237000519035418', '222-20-0107', '221B Baker Street'),
                        ('Matt', 'Murdock', '378449500019826', '654-03-7276', '22 Bergholt Ave, Ilford IG4 5NE, UK'),
                        ('Jessica', 'Jones', '374737367310237', '416-24-0430', '29 Withy Mead, London E4 6JY, UK'),
                        ('Oliver', 'Queen', '377467177618507', '001-70-8727', '15C Conewood St, London N5 1BZ, UK'),
                        ('Amelia', 'Earhart', '370476885874911', '003-18-9982', '9 Wearfield, Sunderland SR5 2TG, UK'), 
                        ('Elektra', 'Natchios', '347184958274940', '529-98-7900', '10 Gale Cl, Hales, Norwich NR14 6SN, UK'),
						('Amberle', 'Elessedil', '4514029875991689', '215-82-0623', '38 Anderson St, Inverness IV3 8DF, UK'),
                        ('Emma', 'Swan', '5206278971927036', '576-44-5409', 'Longwood Ln, United Kingdom'),
                        ('Harry', 'Potter', '5304721916534756', '221-78-6228', '21 Privet Drive, Little Winging, Surrey'),
                        ('Luke', 'Cage', '371380687639226', '135-22-9947', 'Merry Ln, Highbridge TA9 3PS, UK');


INSERT INTO HOTELS (hotLocID, hotName, hotAddress , hotContactEmail, hotPricePErNight) VALUES
(12, 'Triple Fjord Hotel', 'Amsterdam 1', 'contact@fjordhotel.com', 50),
(8, 'Suleyiman Saray', 'Antalya 1', 'contact@ssaray.com', 30),
(4, 'Troya Hotel', 'Athens 1', 'contact@troyahotels.com', 30),
(5, 'Hotel Barca', 'Barca 1', 'contact@barcahotel.com', 55),
(7, 'Berliner Hotels', 'Berlin Alexanderplatz 1', 'contact@berlineralexhotel.com', 40),
(9, 'Hotel Galata', 'Istanbul Galata Bridge 1', 'contact@galatahotel.com', 35),
(3, 'Hotel Dom Milano', 'Milano Dom 1', 'contact@dommilano.com', 50),
(13, 'Eiffel Hotel Paris', 'Paris Louvre 1', 'contact@eiffelhotels.com', 90),
(6, 'Porto Wino Hostel', 'Porto 1', 'contact@portohostel.com', 70),
(1, 'Colosseum Hotel', 'Rome Colosseum 1', 'contact@colloseumhotels.it', 45),
(2, 'Hotel Grand Canale', 'Venice Grand Canal 1', 'contact@grandcanelehotels.com', 55),
(15, 'Sydney Opera Hotel', 'Sydney Opera 1', 'contact@syoperahotel.com', 60);




DELETE from STAFF where 1=1;
INSERT INTO STAFF (staName, staSurname, position_id, staSalary, staAccountNo, staStartDate) VALUES
('James', 'Howlett', 7, 100, '4556315376438273', '2015-12-11'),
('Sara', 'Lance', 8, 100, '342875545339832', '2014-07-01'),
('Felicity', 'Smoak', 3, 100, '378951202793145', '2017-05-03'),
('James', 'Rhodes', 1, 100, '5278461483279004', '2011-07-06'),
('Vegeta', 'Prince', 1, 100, '4929325031020937', '2017-02-09'),
('Clark', 'Kent', 6, 100, '5269768863327877', '2015-03-10'),
('Bruce', 'Wayne', 4, 100, '378747694766783', '2016-03-02'),
('Iam', 'Groot', 2, 100, '6011107596622883', '2017-06-13'),
('Wilson', 'Fisk', 11, 100, '340233352451740', '2015-10-10'),
('Diana', 'Prince', 5, 100, '4556400401622875', '2017-04-09');







INSERT INTO bookings (bookCustomerID, bookPackageID) VALUES
	(1, 7),
    (2, 1),
    (3, 5),
    (1, 9),
    (5, 11), 
    (6, 11),
    (4, 3),
    (7, 6),
    (8, 11),
    (9, 11),
    (9, 7),
    (10, 2),
    (11, 8),
    (7, 4), 
    (6 ,4),
    (10, 10);
    
call customerStatusAll();
call  packageStatus();



									
select * from continents;
select * from countries;
select * from ports;
select * from hotels;



select * from customers;
select * from staff;

select * from bookings;
		