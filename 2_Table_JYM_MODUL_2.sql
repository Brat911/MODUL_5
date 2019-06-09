USE YURII_BRATYUK
GO
--drop table [jym]  drop table [subscription] drop table [jym_log]  

CREATE TABLE [jym]   
(
				[id]					integer IDENTITY(1,1),
				[first_name]				varchar (20),
				[last_name]				varchar (20),
				[date_of_birth]				date,
				[sex]					varchar (20),
				[initial_weight]			integer,
				[body_par]				varchar (20),
				[body_type]				varchar (20),
				[target]				varchar (20),
				[city]					varchar (20),
				[street]				varchar (20),
				[phone_num]				varchar (20),
				[subscription]				varchar (20),
				[inserted_date]				date,
)
GO

CREATE TABLE [jym_log]   
(
				[id]					integer IDENTITY(1,1),
				[first_name]				varchar (20),
				[last_name]				varchar (20),
				[date_of_birth]				date,
				[sex]					varchar (20),
				[initial_weight]			integer,
				[body_par]				varchar (20),
				[body_type]				varchar (20),
				[target]				varchar (20),
				[city]					varchar (20),
				[street]				varchar (20),
				[phone_num]				varchar (20),
				[subscription]				varchar (20),
				[inserted_date]				date,
				[type_of_operations]			varchar (20), 
				[date_of_operations]			date,
)
GO

CREATE TABLE [subscription]   
(
				[id]						integer IDENTITY(1,1),
				[name]						varchar (20) NOT NULL,
				[type]						varchar (20) NOT NULL,
				[validity]					varchar (20) NOT NULL,
				[visit_time]					varchar (20) NOT NULL,
				[jym]						varchar (20) NOT NULL,
				[pool]						varchar (20) NOT NULL,
				[spa]						varchar (20) NOT NULL,
				[crossfit]					varchar (20) NOT NULL,
				[yoga]						varchar (20) NOT NULL,
				[fitnees]					varchar (20) NOT NULL,
				[inserted_date]					date  ,		
)
GO

------------------------------CONSTRAINT-----------------------



ALTER TABLE [jym] ADD 
	CONSTRAINT PK_jym PRIMARY KEY  NONCLUSTERED ([id]),
	CONSTRAINT date_of_birth_chk check (date_of_birth < '2001-01-01');
	
ALTER TABLE [subscription] ADD 
	CONSTRAINT PK_subscription PRIMARY KEY  NONCLUSTERED ([id]);



	----------------------- TRIGGER FOR INSERT on Jym--------------------------------


CREATE TRIGGER I_jym ON jym 
AFTER INSERT
AS
BEGIN 
INSERT INTO jym_log 
SELECT   inserted.first_name
		,inserted.last_name
		,inserted.date_of_birth
		,inserted.sex
		,inserted.initial_weight
		,inserted.body_par
		,inserted.body_type
		,inserted.target
		,inserted.city
		,inserted.street
		,inserted.phone_num
		,inserted.subscription
		,inserted.inserted_date
		,'I' AS type_of_operations
		, Getdate() AS date_of_operations 
from inserted 
END

	----------------------- TRIGGER FOR UPDATE on Jym--------------------------------

CREATE TRIGGER U_jym ON jym
AFTER UPDATE
AS
BEGIN
UPDATE jym_log
set date_of_operations = getdate ()
INSERT INTO jym_log 
SELECT   inserted.first_name
		,inserted.last_name
		,inserted.date_of_birth
		,inserted.sex
		,inserted.initial_weight
		,inserted.body_par
		,inserted.body_type
		,inserted.target
		,inserted.city
		,inserted.street
		,inserted.phone_num
		,inserted.subscription
		,inserted.inserted_date
		,'U' AS type_of_operations
		, Getdate() AS date_of_operations 
FROM deleted JOIN inserted ON inserted.id = deleted.id
END


------------------------- TRIGGER FOR DELETE on Jym--------------------------------


CREATE TRIGGER D_jym ON jym
AFTER DELETE 
AS 
INSERT INTO jym_log 
SELECT	deleted.first_name
		,deleted.last_name
		,deleted.date_of_birth
		,deleted.sex
		,deleted.initial_weight
		,deleted.body_par
		,deleted.body_type
		,deleted.target
		,deleted.city
		,deleted.street
		,deleted.phone_num
		,deleted.subscription
		,deleted.inserted_date
		,'D' AS type_of_operations
		, Getdate() AS date_of_operations 
FROM deleted


--------------------------------INSERT-------------------------------------------------------------


INSERT INTO jym ([first_name],[last_name],[date_of_birth],[sex],[initial_weight],[body_par],[body_type],[target],[city],[street],[phone_num],[subscription],[inserted_date])
	VALUES ('Tomas','Edison', '1890-11-13','male',120.5,'110*90*120','Endomorph','slim','yoyoland','fine-street','+380961145632','ClassicM',GETDATE() )
INSERT INTO jym ([first_name],[last_name],[date_of_birth],[sex],[initial_weight],[body_par],[body_type],[target],[city],[street],[phone_num],[subscription],[inserted_date])
	VALUES ('Deni','Mahao', '1990-04-29','male',65.5,'84*95*100','Ectomorph','muscle','New Somewhere','Glory-street','+380734435388','Prem',GETDATE() )




INSERT INTO subscription ([name],[type],[validity],[visit_time],[jym],[pool],[spa],[crossfit],[yoga],[fitnees],[inserted_date])
	VALUES ('ClassicM','morning_fit','1m','07:00-13:00','y','n','n','y','n','y',GETDATE())
INSERT INTO subscription ([name],[type],[validity],[visit_time],[jym],[pool],[spa],[crossfit],[yoga],[fitnees],[inserted_date])
	VALUES ('ClassicD','day_fit','1m','13:00-23:00','y','n','n','y','n','y',GETDATE())
INSERT INTO subscription ([name],[type],[validity],[visit_time],[jym],[pool],[spa],[crossfit],[yoga],[fitnees],[inserted_date])
	VALUES ('Up','day_fit','1m','13:00-23:00','y','n','n','y','n','y',GETDATE())
INSERT INTO subscription ([name],[type],[validity],[visit_time],[jym],[pool],[spa],[crossfit],[yoga],[fitnees],[inserted_date])
	VALUES ('Prem','full_fit','2m','07:00-23:00','y','y','n','y','n','y',GETDATE())
INSERT INTO subscription ([name],[type],[validity],[visit_time],[jym],[pool],[spa],[crossfit],[yoga],[fitnees],[inserted_date])
	VALUES ('Lux','full_fit','2m','07:00-23:00','y','y','n','y','y','y',GETDATE())
INSERT INTO subscription ([name],[type],[validity],[visit_time],[jym],[pool],[spa],[crossfit],[yoga],[fitnees],[inserted_date])
	VALUES ('Prem-Lux','full_fit','3m','07:00-23:00','y','y','y','y','y','y',GETDATE())



	------------------------TRIGERS CHECK------------------------------------

INSERT INTO jym ([first_name],[last_name],[date_of_birth],[sex],[initial_weight],[body_par],[body_type],[target],[city],[street],[phone_num],[subscription],[inserted_date])   -------------   INSERT CHEK
	VALUES ('Tomas','Edison', '1890-11-13','male',120.5,'110*90*120','Endomorph','slim','Lviv','fine-street','+380961145632','ClassicM',GETDATE() )
INSERT INTO jym ([first_name],[last_name],[date_of_birth],[sex],[initial_weight],[body_par],[body_type],[target],[city],[street],[phone_num],[subscription],[inserted_date])
	VALUES ('Deni','Mahao', '1990-04-29','male',65.5,'84*95*100','Ectomorph','muscle','New Somewhere','Glory-street','+380734435388','Prem',GETDATE() )


update jym set city = 'Yoyoland' where city = 'New Somewhere'                   ------------------ UPDATE CHECK

delete from jym where id = 2							------------------ DELETE CHECK


	select * from subscription
	select * from jym
	select * from jym_log													 


-----------------------Synonym---------------------------


create synonym syn_coins for coins_v
go
create synonym syn_coinage for coinage_v
go
create synonym syn_jym for jym
go
create synonym syn_sub for subscription
go

	select * from coins_v
	select * from coinage_v
	

	SELECT * FROM syn_jym JOIN syn_sub on syn_jym.subscription=syn_sub.name   ----------- synonym script
