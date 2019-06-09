USE master;
GO
CREATE DATABASE YURII_BRATYUK
GO

------------------------------------------------------------------------------------------
USE YURII_BRATYUK
GO


CREATE TABLE [suppliers]   (

		[supplierid]				integer PRIMARY KEY,
		[name]						varchar (20),
		[rating]					integer,
		[city]						varchar (20),
			
)
GO


CREATE TABLE [details]   (

		[detailid]					integer PRIMARY KEY,
		[name]						varchar (20),
		[color]						varchar (20),
		[weight]					integer,
		[city]						varchar (20),
)
GO

CREATE TABLE [products]   (

		[productid]				integer PRIMARY KEY,
		[name]						varchar (20),
		[city]						varchar (20),
)
GO


CREATE TABLE [supplies]   (
		[supplierid]				integer FOREIGN KEY REFERENCES suppliers(supplierid),
		[detailid]					integer FOREIGN KEY REFERENCES details(detailid),
		[productid]				integer FOREIGN KEY REFERENCES products(productid),
		[quantity]					integer ,
)
GO


USE YURII_BRATYUK
GO

INSERT INTO suppliers VALUES (1,	'Smith',	20,	'London'),
							 (2,	'Jonth',	10,	'Paris'),
							 (3,	'Blacke',	30,	'Paris'),
							 (4,	'Clarck',	20,	'London'),
							 (5,	'Adams',	30,	'Athens');


INSERT INTO details VALUES (1, 'Screw',		'Red',		12,	'London'),
						   (2, 'Bolt',			'Green',	17,	'Paris'),
						   (3, 'Male-screw',	'Blue',		17,	'Roma'),
						   (4, 'Male-screw',	'Red',		14,	'London'),
						   (5, 'Whell',		'Blue',		12,	'Paris'),
						   (6, 'Bloom',		'Red',		19,	'London');
						


INSERT INTO products VALUES (1, 'HDD',			'Paris'),
							(2, 'Perforator',	'Roma'),
							(3, 'Reader',		'Athens'),
							(4, 'Printer',		'Athens'),
							(5, 'FDD',			'London'),
							(6, 'Terminal',		'Oslo'),
							(7, 'Ribbon',		'London');



INSERT INTO supplies VALUES (1,	1,	1,	200),
							(1,	1,	4,	700),
							(2,	3,	1,	400),
							(2,	3,	2,	200),
							(2,	3,	3,	200),
							(2,	3,	4,	500),
							(2,	3,	5,	600),
							(2,	3,	6,	400),
							(2,	3,	7,	800),
							(2,	5,	2,	100),
							(3,	3,	1,	200),
							(3,	4,	2,	500),
							(4,	6,	3,	300),
							(4,	6,	7,	300),
							(5,	2,	2,	200),
							(5,	2,	4,	100),
							(5,	5,	5,	500),
							(5,	5,	7,	100),
							(5,	6,	2,	200),
							(5,	1,	4,	100),
							(5,	3,	4,	200),
							(5,	4,	4,	800),
							(5,	5,	4,	400),
							(5,	6,	4,	500);
						

GO




------------------------- 1
UPDATE suppliers
SET rating = (rating + 10) 
WHERE rating  < (SELECT rating FROM suppliers where supplierid = 4)





------------------------- 2
SELECT supplies.productid  INTO prodLond  
FROM supplies 
LEFT JOIN products on products.productid=supplies.productid 
LEFT JOIN suppliers on supplies.supplierid=suppliers.supplierid  
where suppliers.city = 'london' or products.city = 'london' 




------------------------- 3
DELETE products where productid NOT IN (SELECT productid FROM supplies )





------------------------  4







---------------------------- 5
UPDATE supplies
SET quantity = quantity+(quantity * 10)/100
WHERE supplierid IN
(SELECT  suppliers.supplierid 
FROM supplies 
LEFT JOIN suppliers on supplies.supplierid=suppliers.supplierid 
LEFT JOIN details on supplies.detailid=details.detailid 
where details.color = 'Red')





 ----------------------------6
 SELECT distinct color, city
 INTO colorcity 
 FROM details  
 GROUP BY color,city
 SELECT  * FROM colorcity




 ---------------------------7
 SELECT DISTINCT details.detailid INTO det_id 
  FROM supplies 
  LEFT JOIN suppliers on supplies.supplierid=suppliers.supplierid 
  LEFT JOIN details on supplies.detailid=details.detailid 
  LEFT JOIN products on supplies.productid=products.productid 
  WHERE suppliers.city = 'London' OR products.city = 'London'
  SELECT * FROM det_id




  -------------------------8
  INSERT INTO suppliers (supplierid,name,rating,city)
   VALUES (10,'”айт',DEFAULT,'Ќью-…орк')



  ------------------------9
  DELETE  FROM supplies WHERE productid IN 
  (SELECT products.productid FROM supplies 
  INNER JOIN products on supplies.productid=products.productid 
  WHERE products.city = 'Roma' )
  DELETE FROM products WHERE city = 'Roma'



------------------------10
 SELECT DISTINCT details.city INTO oneTab 
 FROM suppliers  JOIN details on suppliers.city=details.city  
 JOIN products on details.city=products.city 
 WHERE suppliers.supplierid > 0  AND productid > 0 AND details.detailid > 0  




------------------------11
UPDATE details
SET color = 'Yellow'
WHERE color = 'Red' AND weight < 15





----------------------12
SELECT productid,city INTO prodIDcity FROM products WHERE city like '_O%'




---------------------13  
UPDATE suppliers
SET rating = (rating + 10)  WHERE name in
(SELECT name FROM suppliers 
LEFT JOIN supplies on supplies.supplierid=suppliers.supplierid 
GROUP BY name 
HAVING  sum (quantity)  > 
(SELECT  avg (quantity) 
FROM supplies 
LEFT JOIN suppliers on supplies.supplierid=suppliers.supplierid)
)



 ---------------------- 14
SELECT supplies.supplierid, name INTO supIDname
FROM  suppliers LEFT JOIN supplies on supplies.supplierid=suppliers.supplierid  WHERE productid = 1


----------------------- 15
INSERT INTO suppliers VALUES (6,	'Ben',		60,		'Lviv'),
							 (8,	'Arthur',   70,		'Rivne');




------------------------------------MERGE----------------------------------------------------------


USE YURII_BRATYUK
GO

CREATE TABLE [tmp_details]   (

		[detailid]					integer PRIMARY KEY,
		[name]						varchar (20),
		[color]						varchar (20),
		[weight]					integer,
		[city]						varchar (20),
)
GO


INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (1, 'Screw',         'Blue',     13, 'Osaka');
INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (2, 'Bolt',           'Pink', 12, 'Tokio');

INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (18, 'Whell-24', 'Red',   14, 'Lviv');
INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (19, 'Whell-28', 'Pink',     15, 'London');

GO



MERGE details
USING tmp_details 
 ON (details.detailid = tmp_details .detailid)

WHEN MATCHED 
	THEN UPDATE  SET details.detailid = tmp_details .detailid, details.name=tmp_details.name, 
                 	details.color=tmp_details.color, details.weight=tmp_details.weight, details.city=tmp_details.city

WHEN NOT MATCHED 
	THEN INSERT  (detailid, name, color, weight,city) VALUES (tmp_details.detailid, tmp_details.name, 
				 tmp_details.color, tmp_details.weight,tmp_details.city);

SELECT * FROM details
