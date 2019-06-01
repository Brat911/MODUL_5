USE master;
GO
CREATE DATABASE YURII_BRATYUK
GO
------------------------------------------------------------------------------------------
USE YURII_BRATYUK
GO

-------- TABLE CREATION. Part 1 ---------------------

CREATE TABLE [coins]   (
		[id]						integer IDENTITY(1,1),
		[par]						integer NOT NULL,
		[obverse]					varchar (20) unique,
		[revers]					varchar (20) NOT NULL,
		[diameter_mm]				float NOT NULL ,
		[thickness_mm]				float NOT NULL,
		[start_coinage]				date ,
		[end_coinage]		        date ,
		[putINrun]					date ,
	    [numOFrun]					integer ,
		[sumOF_UAH]					integer,
		[inserted_date]				date  ,
			
)
GO


USE YURII_BRATYUK
GO
CREATE TABLE coinage (
			[id]						integer IDENTITY(1,1) ,
			[coin_id]					integer NOT NULL,
			[mint_city]					varchar (20) NOT NULL,
			[coinage_date]				date   NOT NULL,
			[color]						varchar(20) NOT NULL,
			[material]					varchar (20) NOT NULL,
			[weight_g]					float NOT NULL ,
			[coin_edges]				varchar(20) NOT NULL,
			[amount]					integer NOT NULL ,
			[inserted_date]				date  ,
			[updated_date]				date  ,
		 )
GO


CREATE TABLE log_check (
			[id]				integer IDENTITY(1,1) ,
			[date]				date,
			[operations]		varchar (8) NOT NULL,
			[old_value]			varchar (20) NOT NULL,
			[new_value]			varchar (20) NOT NULL,
         )
GO


------------CONSTRAINT----- CHECK--------KEYs---------------------

ALTER TABLE [coins] ADD 
	CONSTRAINT PK_coins PRIMARY KEY  NONCLUSTERED ([id]); 
ALTER TABLE [coinage] ADD 
	CONSTRAINT PK_coinage PRIMARY KEY  NONCLUSTERED ([id]), 
	CONSTRAINT weight_g_chk check (weight_g > 0), 
	CONSTRAINT coin_id_fk foreign key (coin_id) REFERENCES [coins] ([id]);


----------INSERT---------------------------


USE YURII_BRATYUK
GO

INSERT INTO coins ([par],[obverse],[revers],[diameter_mm],[thickness_mm],[start_coinage],[end_coinage],[putINrun],[numOFrun],[sumOF_UAH],[inserted_date])
	VALUES (1, '1','emblem', 16.0, 1.2, '1992-12-20', '2009-08-17', '1992-12-25' , 222600000, 2226000, getdate());
INSERT INTO coins ([par],[obverse],[revers],[diameter_mm],[thickness_mm],[start_coinage],[end_coinage],[putINrun],[numOFrun],[sumOF_UAH],[inserted_date])
	VALUES (2, '2','emblem', 17.3, 1.2, '1992-09-21', '2009-09-16', '1992-10-26' , 107000000, 2140000, getdate());
INSERT INTO coins ([par],[obverse],[revers],[diameter_mm],[thickness_mm],[start_coinage],[end_coinage],[putINrun],[numOFrun],[sumOF_UAH],[inserted_date])
	VALUES (5, '5','emblem', 24.0, 1.5, '1992-05-11', '2009-11-14', '1992-07-15' , 151700000, 7585000, getdate());	
INSERT INTO coins ([par],[obverse],[revers],[diameter_mm],[thickness_mm],[start_coinage],[end_coinage],[putINrun],[numOFrun],[sumOF_UAH],[inserted_date])
	VALUES (10, '10','emblem', 16.3, 1.25, '1992-03-22', '2009-06-08', '1992-06-08' , 330000000, 33000000, getdate());
INSERT INTO coins ([par],[obverse],[revers],[diameter_mm],[thickness_mm],[start_coinage],[end_coinage],[putINrun],[numOFrun],[sumOF_UAH],[inserted_date])
	VALUES (25, '25','emblem', 20.8, 1.35, '1992-05-14', '2009-07-09', '1992-09-15' , 152000000, 38000000, getdate());
INSERT INTO coins ([par],[obverse],[revers],[diameter_mm],[thickness_mm],[start_coinage],[end_coinage],[putINrun],[numOFrun],[sumOF_UAH],[inserted_date])
	VALUES (50, '50','emblem', 23.0, 1.55, '1992-03-10', '2009-11-17', '1992-05-24' , 85010000, 42505000, getdate());
INSERT INTO coins ([par],[obverse],[revers],[diameter_mm],[thickness_mm],[start_coinage],[end_coinage],[putINrun],[numOFrun],[sumOF_UAH],[inserted_date])
	VALUES (100, '100','emblem', 26.0, 1.85, '1992-11-11', '2006-07-20', '1992-11-11' , 41700000, 41700000, getdate());




INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (1,'kyiv', '1992-12-20', 'silver', 'steel', 1.5, 'ribbet' , 610000, getdate());		
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (1,'lugansk','1993-11-21', 'silver', 'steel', 1.5, 'ribbet' , 2400000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (1,'italy', '2000-02-18', 'silver', 'steel', 1.5, 'ribbet' , 600000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (1,'lugansk', '2001-05-25', 'silver', 'steel', 1.5, 'smooth' , 1500000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (1,'kyiv', '2009-09-12', 'silver', 'steel', 1.5, 'smooth' , 2200000, getdate());

INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (2,'kyiv', '1992-10-25', 'silver', 'aluminum', 1.8, 'ribbet' , 900000, getdate());		
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (2,'lugansk', '1993-11-21', 'silver', 'steel', 1.8, 'ribbet' , 2300000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (2,'italy', '2001-08-28', 'silver', 'aluminum', 1.8, 'ribbet' , 900000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (2,'lugansk', '2002-06-15', 'silver', 'steel', 1.8, 'smooth' , 2000000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (2,'kyiv', '2009-10-13', 'silver', 'aluminum', 1.8, 'ribbet' , 2000000, getdate());

INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (3,'lugansk', '1992-10-25', 'silver', 'steel', 4.3, 'smooth' , 890000, getdate());		
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (3,'kyiv', '1994-05-01', 'silver', 'steel', 4.3, 'ribbet' , 2900000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (3,'italy', '2003-08-28', 'silver', 'aluminum', 4.3, 'ribbet' , 950000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (3,'kyiv', '2005-06-15', 'silver', 'steel', 4.3, 'ribbet' , 1800000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (3,'kyiv', '2009-08-12', 'silver', 'aluminum', 4.3, 'smooth' , 1500000, getdate());

INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (4,'lugansk', '1992-11-28', 'aluminum bronze', 'brass', 1.7, 'ribbet' , 490000, getdate());		
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (4,'lugansk', '1995-10-01', 'aluminum bronze', 'brass', 1.7, 'ribbet' , 1400000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (4,'lugansk', '2003-08-28', 'aluminum bronze', 'bronze', 1.7, 'smooth' , 1900000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (4,'kyiv', '2005-11-05', 'aluminum bronze', 'bronze', 1.7, 'ribbet' , 1300000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (4,'kyiv', '2009-06-02', 'aluminum bronze', 'brass', 1.7, 'ribbet' , 2000000, getdate());

INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (5,'lugansk', '1992-05-28', 'aluminum bronze', 'brass', 2.9, 'smooth' , 600000, getdate());		
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (5,'lugansk', '1993-11-11', 'aluminum bronze', 'brass', 2.9, 'smooth' , 150000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (5,'kyiv', '2004-08-28', 'aluminum bronze', 'bronze', 2.9, 'smooth' , 1800000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (5,'kyiv', '2005-11-06', 'aluminum bronze', 'brass', 2.9, 'ribbet' , 2000000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (5,'kyiv', '2009-07-05', 'aluminum bronze', 'brass', 2.9, 'ribbet' , 1500000, getdate());

INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (6,'lugansk', '1992-08-18', 'aluminum bronze', 'brass', 4.2, 'smooth' , 500000, getdate());		
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (6,'kyiv', '1995-09-21', 'aluminum bronze', 'brass', 4.2, 'ribbet' , 100000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (6,'kyiv', '2003-12-18', 'aluminum bronze', 'bronze', 4.2, 'ribbet' , 1600000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (6,'kyiv', '2004-01-26', 'aluminum bronze', 'brass', 4.2, 'ribbet' , 2100000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (6,'kyiv', '2009-08-25', 'aluminum bronze', 'brass', 4.2, 'ribbet' , 2500000, getdate());


INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (7,'lugansk', '1992-08-18', 'aluminum bronze', 'brass', 7.1, 'smooth' , 150, getdate());		
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (7,'lugansk', '1996-10-21', 'aluminum bronze', 'brass', 7.1, 'ribbet' , 1000000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (7,'kyiv', '2001-10-11', 'aluminum bronze', 'bronze', 7.1, 'ribbet' , 500000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (7,'kyiv', '2004-03-25', 'aluminum bronze', 'brass', 7.1, 'ribbet' , 200000, getdate());
INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (7,'kyiv', '2006-07-20', 'aluminum bronze', 'brass', 7.1, 'ribbet' , 200000, getdate());
	
	GO


-------TRIGGER---------------------------------------------------------


CREATE TRIGGER tr_coinage ON coinage
AFTER UPDATE 
AS 
BEGIN
UPDATE coinage
set updated_date = getdate() from coinage inner join inserted on coinage.id=inserted.id where coinage.id=inserted.id      ------------- апдейтить колонку updated_date
INSERT INTO log_check ([date],[operations],[old_value],[new_value])                                                       ----------------------  Insert into Log
SELECT	getdate(), 'U', deleted.material, inserted.material FROM inserted JOIN deleted ON inserted.id = deleted.id
END



update coinage SET material = 'wood' where coin_id = 4 and coinage_date = '1992-11-28'               --------------------- Перевірка роботи TRIGGER AFTER UPDATE 


select * from log_check              ------- лог данні по апдейту
select * from coins
select * from coinage



 ----------------------VIEW----------------------------------------------
 

CREATE VIEW coins_v AS 
SELECT [par],[obverse],[revers],[diameter_mm],[thickness_mm],[start_coinage],[end_coinage] FROM coins WHERE par = 1 with check option


CREATE VIEW coinage_v AS 
SELECT [coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges] FROM coinage WHERE weight_g < 2 with check option

insert into coins_v values (5,'qwe','qweqr',2,3,'1992-12-20','1992-12-20')     -------------------------------------------- check option не пускає інсерт

SELECT * FROM coins_v
SELECT * FROM coinage_v



--------------- Перевірка роботи CONSTRAINT
-----Нульова або відємна вага CHECK "weight_g_chk"

INSERT INTO coinage ([coin_id],[mint_city],[coinage_date],[color],[material],[weight_g],[coin_edges],[amount],[inserted_date])	
	VALUES (1,'kyiv', '1992-12-20', 'silver', 'steel', 0, 'ribbet' , 610000, getdate());	


-------Інсерти одинакових ключів UNIQUE KEY

INSERT INTO coins ([par],[obverse],[revers],[diameter_mm],[thickness_mm],[start_coinage],[end_coinage],[putINrun],[numOFrun],[sumOF_UAH],[inserted_date])
	VALUES (1, '1','emblem', 16.0, 1.2, '1992-12-20', '2009-08-17', '1992-12-25' , 222600000, 2226000, getdate());

