USE Hotel ; 
Go 

CREATE SCHEMA Hotel;
GO
CREATE SCHEMA Common;
GO
CREATE SCHEMA Operations;
GO
CREATE SCHEMA Finance;
GO

CREATE TABLE Hotel.Hotel_Guests 
(
	Guest_Id INT IDENTITY(1,1) PRIMARY KEY,
	First_Name VARCHAR(225) NOT NULL ,
	Last_Name VARCHAR(225) NOT NULL ,
	Email VARCHAR(225) UNIQUE ,
	Gender VARCHAR(50) CHECK (Gender IN ('Male', 'Female')) , 
	Nationality VARCHAR(225) NOT NULL
);

CREATE TABLE Hotel.Hotel_Vendors 
(
	Vendor_ID INT IDENTITY(1,1) PRIMARY KEY,
	Vendor_Name VARCHAR(225) NOT NULL , 
	Housekeeping VARCHAR(150) NOT NULL , 
	Maintenance INT NOT NULL , 
	Food_Beverages VARCHAR(225) NOT NULL,
	City  VARCHAR(225) NOT NULL

);

CREATE TABLE Hotel.Hotel_Rooms 
(
	Room_ID INT IDENTITY(1,1) PRIMARY KEY,
	Room_Number INT UNIQUE ,
	Double_Room TINYINT  ,
	Suite_Room TINYINT  , 
	Single_Room TINYINT  , 
	Price_Per_Night NUMERIC(10,3) NOT NULL

);


CREATE TABLE Common.Hotel_Calender 
(
	Date_ID DATE PRIMARY KEY, 
	Year_Of_Date INT NOT NULL ,
	Month_Of_Date INT NOT NULL ,
	Quarter_Of_Year INT NOT NULL ,
	Day_Of_Week VARCHAR(50) NOT NULL 
);

CREATE TABLE Operations.Reservations 
(
	Reservation_ID 	INT IDENTITY(1,1) PRIMARY KEY,
	Revenue NUMERIC(10,3) NOT NULL ,
	R_Direct TINYINT  NOT NULL ,
	R_Expedia TINYINT NOT NULL ,
	R_Booking TINYINT NOT NULL ,
	Confirmed TINYINT NOT NULL ,
	Canceled TINYINT NOT NULL ,
	Guest_ID INT NOT NULL,
	Room_ID INT NOT NULL , 
	Checkin_Date DATE NOT NULL , 
	Checkout_Date DATE NOT NULL , 

    CONSTRAINT Reservation_Guest_FK FOREIGN KEY (Guest_ID)
	REFERENCES Hotel.Hotel_Guests (Guest_ID),
    CONSTRAINT Reservation_Room_FK FOREIGN KEY (Room_ID) 
	REFERENCES Hotel.Hotel_Rooms (Room_ID),
    CONSTRAINT Reservation_Checkin_FK FOREIGN KEY (Checkin_Date)
	REFERENCES Common.Hotel_Calender (Date_ID),
    CONSTRAINT FK_Reservation_Checkout FOREIGN KEY (Checkout_Date) 
	REFERENCES Common.Hotel_Calender (Date_ID)
);


CREATE TABLE Finance.Purchases 
(
	Purchas_ID INT IDENTITY(1,1) PRIMARY KEY ,
	Vendor_ID INT NOT NULL ,
	Purchas_Date DATE NOT NULL , 
	Quantity INT NOT NULL , 
	Unit_Price NUMERIC(10,3) NOT NULL ,
	Total_Cost NUMERIC(10,3) NOT NULL ,
	
    CONSTRAINT FK_Purchases_Vendors FOREIGN KEY (Vendor_ID)
	REFERENCES Hotel.Hotel_Vendors (Vendor_ID),
    CONSTRAINT FK_Purchases_Calender FOREIGN KEY (Purchas_Date)
	REFERENCES Common.Hotel_Calender (Date_ID)
);
