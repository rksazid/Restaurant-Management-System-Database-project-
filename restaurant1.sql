----< drop all tables >----

DROP TABLE Order_info cascade constraints;
DROP TABLE Customer_Info cascade constraints;
DROP TABLE Order_Items cascade constraints;
DROP TABLE Menu cascade constraints;
DROP TABLE Management cascade constraints;
DROP TABLE Account_info cascade constraints;

----< Create tables >----

Create table Customer_Info(
	Email varchar(20)NOT NULL,
	Fname varchar(12),
	Lname varchar(12),
	Password varchar(15),
	Phone varchar(14),
	Area varchar(10),
	Town varchar(10),
	Status varchar(8),
	PRIMARY KEY(Email)
);

Create table Order_info(
	OrderID varchar(5)NOT NULL,
	Email varchar(20),
	TORCV Date,
	TODEL Date,
	PRIMARY KEY (OrderID),
	FOREIGN KEY (Email) References Customer_Info (Email)
);

Create table Management(
 	UserID varchar(20)NOT NULL,
 	Password varchar(15),
 	Name varchar(15),
 	Status varchar(5),
 	Designation varchar(8),
 	PRIMARY KEY (UserID)
 );

Create table Menu(
	ItemID varchar(7)NOT NULL,
	Name varchar(15),
	Description varchar(30),
	Price number(5,2),
	Catagory varchar(8),
	Status varchar(10),
	UserID varchar(20),
	PRIMARY KEY (ItemID),
	FOREIGN KEY (UserID) References Management(UserID)
);

Create table Order_Items(
 	OrderID varchar(5) NOT NULL,
 	ItemID varchar(7) NOT NULL,
 	Quantity number(4),
 	Status varchar(10),
 	UserID varchar(20),
 	PRIMARY KEY ( OrderID, ItemID )
 	--FOREIGN KEY(UserID) References Management(UserID)
 );

Create table Account_info(
 	userName varchar(20),
 	passWord varchar(20)
 );

----< Describe All Tables >----

DESCRIBE Customer_Info;
DESCRIBE Order_info;
DESCRIBE Management;
DESCRIBE Menu;
DESCRIBE Order_Items;
DESCRIBE Account_info;

Commit;

----< Insert Data >----

INSERT INTO Customer_Info VALUES ('rksazid@gmail.com','MD.REZAUL','KARIM','rksazid123','01521453995','TELIGATI','Khulna','Active');
INSERT INTO Customer_Info VALUES ('dipto.8081@gmail.com','Nafiul','Hamim','nafiul456','01767564223','TELIGATI','Rangpur','Active');
INSERT INTO Customer_Info VALUES ('mubin986@gmail.com','Shariful','Islam','mubin986','01831925544','TELIGATI','Dhaka','Blocked');
INSERT INTO Customer_Info VALUES ('billahmim@yahoo.com','Mustakim','Billah','billah1234','01674304054','TELIGATI','Dhaka','Active');
INSERT INTO Customer_Info VALUES ('uthsa@yahoo.com','Sayed','Alam','uthsacg4','01832467598','TELIGATI','Dhaka','Active');
INSERT INTO Customer_Info VALUES ('tusher@gmail.com','Tuser','Pranto','tpranto95','01715436782','TELIGATI','Bogura','Active');
INSERT INTO Customer_Info VALUES ('mehedi5@yahoo.com','Mehedi','Hasan','mehedi05','01723976487','TELIGATI','Panchagar','Active');
INSERT INTO Customer_Info VALUES ('abusaleh@gmail.com','Abu Saleh','Sahadat','sahadat07','01834982740','TELIGATI','Khulna','Active');
INSERT INTO Customer_Info VALUES ('sopto543@yahoo.com','Dibbedu','Sopto','sopto123','01632876354','TELIGATI','Jhenaidah','Active');
INSERT INTO Customer_Info VALUES ('shanto65@yahoo.com','Shanto','Khumar','shanto65','01916275386','TELIGATI','Bogura','Active');
INSERT INTO Customer_Info VALUES ('arnab@yahoo.com','Arnab','Majumdar','arnab456','01765382965','TELIGATI','Dhaka','Active');
INSERT INTO Customer_Info VALUES ('swajan@yahoo.com','Swajan','Chowdhury','swajan234','01523869406','TELIGATI','Kurigram','Active');


SELECT * FROM Customer_Info;


INSERT INTO Order_info VALUES ('1000','dipto.8081@gmail.com','4-APR-2017','5-APR-2017');
INSERT INTO Order_info VALUES ('1001','billahmim@yahoo.com','7-APR-2017','8-APR-2017');
INSERT INTO Order_info VALUES ('1002','mubin986@gmail.com','8-APR-2017','10-APR-2017');
INSERT INTO Order_info VALUES ('1003','rksazid@gmail.com','6-APR-2017','7-APR-2017');
INSERT INTO Order_info VALUES ('1004','swajan@yahoo.com','7-APR-2017','8-APR-2017');
INSERT INTO Order_info VALUES ('1005','arnab@yahoo.com','8-APR-2017','9-APR-2017');
INSERT INTO Order_info VALUES ('1006','shanto65@yahoo.com','8-APR-2017','9-APR-2017');
INSERT INTO Order_info VALUES ('1007','sopto543@yahoo.com','8-APR-2017','9-APR-2017');


SELECT * FROM Order_info;


INSERT INTO Management VALUES ('Masud','m12345','Masud Rana','Actv','Employee');
INSERT INTO Management VALUES ('Bahadur','baha12345','Arshad Bahadur','Actv','Cook');
INSERT INTO Management VALUES ('HasibIq','hiprato123','Hasib Iqbal','Actv','Manager');
INSERT INTO Management VALUES ('tk004','tkman123','Tawhid Joarder','Blkd','Employee');
INSERT INTO Management VALUES ('kundu07054','kundu54','Mithila Kundu','Actv','Cook');
INSERT INTO Management VALUES ('tahsin','tahsin56','Tahsin Ahmed','Actv','Employee');
INSERT INTO Management VALUES ('arpancse','arpan95','Arpan Bhowmik','Actv','Employee');
INSERT INTO Management VALUES ('ijaj321','ijajsayem','Ijaj Sayem','Blkd','Employee');

SELECT * FROM Management;

INSERT INTO Menu VALUES ('20001','Shami Kabab','Kabab',60,'Fastfood','Available','HasibIq');
INSERT INTO Menu VALUES ('20002','Beef Bhuna','Beef',125,'Fastfood','Available','HasibIq');
INSERT INTO Menu VALUES ('20003','Chicken Bhuna','Chicken',125,'Fastfood','Available','HasibIq');
INSERT INTO Menu VALUES ('20004','Chop','Beef',150,'Fastfood','Available','HasibIq');
INSERT INTO Menu VALUES ('20005','Burger','Vagitable',70,'Fastfood','Available','HasibIq');
INSERT INTO Menu VALUES ('20006','Pizza','Chicken',50,'Fastfood','Available','HasibIq');
INSERT INTO Menu VALUES ('20007','Shawrma','Chicken',250,'Fastfood','Available','HasibIq');

SELECT * FROM Menu;


----< Insert login information in Account Table >----

INSERT INTO Account_info VALUES ('rksazid','sazidcse1234');
INSERT INTO Account_info VALUES ('ayon','ayoncse1234');
INSERT INTO Account_info VALUES ('amit','amitcse1234');
INSERT INTO Account_info VALUES ('manan','manancse1234');

----< Log-In >----

PROMPT You need to login first.......................
PROMPT Enter your username and password..................

set echo off;
set define '&';

SET SERVEROUTPUT ON
DECLARE
   checkIdPassword NUMBER(2);
   uname Account_info.userName%TYPE;
   pword Account_info.passWord%TYPE;
BEGIN
    uname := '&Username';
    pword := '&Password';

    select count(*) into checkIdPassword from Account_info
    where Account_info.userName=uname and Account_info.passWord=pword;

    if checkIdPassword = 1 then
      dbms_output.put_line ('Successfully Loged in !!');
    else
      dbms_output.put_line ('Id or password did not match!!');
    end if;  

    EXCEPTION
      WHEN others THEN
        NULL;
END;
/

PAUSE Press ENTER to continue ...

----< Alter Foreign key >----

ALTER TABLE Order_Items ADD CONSTRAINT order_items_fk
	FOREIGN KEY (UserID) REFERENCES Management(UserID) ON DELETE CASCADE;

----< Alter Table >----

PROMPT Alter Operations.................

ALTER TABLE Order_Items
	ADD dropThis varchar(4);

DESCRIBE Order_Items;

ALTER TABLE Order_Items
	MODIFY dropThis varchar(10);
DESCRIBE Order_Items;

ALTER TABLE Order_Items
	RENAME COLUMN dropThis to tempColumn;
DESCRIBE Order_Items;

ALTER TABLE Order_Items
	DROP COLUMN tempColumn;

DESCRIBE Order_Items;

ALTER TABLE Order_Items
	ADD TotalPrice number(8,2);

DESCRIBE Order_Items;

PAUSE Press ENTER to continue ...

----< Trigger >----

PROMPT Using Trigger...............

CREATE or REPLACE TRIGGER TR_1 
BEFORE UPDATE OR INSERT ON Order_Items
FOR EACH ROW 
BEGIN
IF :NEW.ItemID = '20001' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 60) ;
ELSIF :NEW.ItemID = '20002' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 125) ;
ELSIF :NEW.ItemID = '20003' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 125) ;
ELSIF :NEW.ItemID = '20004' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 150) ;
ELSIF :NEW.ItemID = '20005' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 70) ;
ELSIF :NEW.ItemID = '20006' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 50) ;
 ELSIF :NEW.ItemID = '20007' THEN
  :NEW.TotalPrice := (:NEW.Quantity * 250) ;
END IF;
END TR_1;
/
SHOW ERRORS;

INSERT INTO Order_Items VALUES ('1000','20003',5,'Pending','Bahadur',NULL);
INSERT INTO Order_Items VALUES ('1001','20001',10,'Ready','Bahadur',NULL);
INSERT INTO Order_Items VALUES ('1002','20003',15,'Pending','Bahadur',NULL);
INSERT INTO Order_Items VALUES ('1003','20002',5,'Pending','Bahadur',NULL);
INSERT INTO Order_Items VALUES ('1004','20006',7,'Pending','kundu07054',NULL);
INSERT INTO Order_Items VALUES ('1005','20004',5,'Ready','Bahadur',NULL);
INSERT INTO Order_Items VALUES ('1006','20007',5,'Pending','kundu07054',NULL);
INSERT INTO Order_Items VALUES ('1007','20003',5,'Pending','kundu07054',NULL);

SELECT * FROM Order_Items;

----< Cursors >----

PROMPT Menu Details Using Cursors.........

SET SERVEROUTPUT ON
DECLARE
     CURSOR item_cur IS SELECT Name,Description,Price,Catagory FROM Menu;
  item_details item_cur%ROWTYPE;

BEGIN
OPEN item_cur;
      LOOP
        FETCH item_cur INTO item_details;
        EXIT WHEN item_cur%ROWCOUNT > 5;
      DBMS_OUTPUT.PUT_LINE ('Name : ' || item_details.Name || '  Description :' || item_details.Description || ' Price :' || item_details.Price || '  Catagory :' || item_details.Catagory);
      END LOOP;
      CLOSE item_cur;   
END;
/


----< Working Query >----                  

PAUSE Press ENTER to continue ...

----< Update Operation >----

UPDATE Customer_Info SET Status='Active' WHERE Email='mubin986@gmail.com';
UPDATE Menu SET Price = 60 WHERE Name = 'Pizza';
UPDATE Order_Items SET Status = 'Ready' WHERE OrderID = '1007';

SELECT * FROM Customer_Info;

----< Joins >----

PROMPT JOIN1 :

SELECT * FROM (Menu m join Order_Items oi 
	ON m.ItemID = oi.ItemID);

PROMPT JOIN2 :

SELECT * FROM (Menu Natural join Order_Items);

PROMPT JOIN3 :

SELECT * FROM (Menu m cross join Order_Items oi )WHERE m.ItemID = oi.ItemID;

PROMPT JOIN4 :

SELECT * FROM (Order_Items oi LEFT OUTER JOIN Order_info oin ON oi.OrderID = oin.OrderID);

PROMPT JOIN5 :

SELECT * FROM (Order_Items oi RIGHT OUTER JOIN Order_info oin ON oi.OrderID = oin.OrderID);


PAUSE Press ENTER to continue ...
----< Procedure >----


----< Savepoint & Rollback >----
Savepoint s1;

INSERT INTO Order_Items VALUES ('1008','20004',5,'Pending','Bahadur',NULL);

Savepoint s2;

INSERT INTO Order_Items VALUES ('1009','20006',5,'Pending','kundu07054',NULL);

SELECT * FROM Order_Items;

Rollback to s2;

SELECT * FROM Order_Items;

----< Subquery >----

PROMPT Items Which are ready to delivery :

SELECT Name FROM Menu 
WHERE ItemID IN 
	(SELECT ItemID FROM Order_Items 
		WHERE Status = 'Ready'); 

PROMPT Items Which are Pending :

SELECT Name FROM Menu 
WHERE ItemID IN 
	(SELECT ItemID FROM Order_Items 
		WHERE Status = 'Pending');

----< Count >----

SELECT count(*) AS "Number Of Available Items" FROM Menu;

----< Union >----

SELECT ItemID AS "Item Name" , Status FROM Menu
UNION All
SELECT ItemID AS "Item Name" , Status FROM Order_Items;

----< Intersects >----

PROMPT Ordered Items :

SELECT ItemID,Name FROM Menu
WHERE ItemID IN(SELECT ItemID AS "Items" FROM Menu
				INTERSECT
				SELECT ItemID AS "Items" FROM Order_Items);


----< Loop >----

SET SERVEROUTPUT ON;
DECLARE
   counter    NUMBER(2) := 0;
   var_Email Customer_Info.Email%TYPE;
  
BEGIN

   WHILE counter <= 4 
   LOOP

      SELECT Email 
      INTO var_Email
      FROM Customer_Info
      WHERE
      Status = 'Blocked';

      DBMS_OUTPUT.PUT_LINE ('User number :' || counter || ' Email :' || var_Email );

      counter := counter + 1 ;

   END LOOP;

   EXCEPTION
      WHEN others THEN
         DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/


