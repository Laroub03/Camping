USE Camping
CREATE TABLE Customers(id int IDENTITY(1,1) PRIMARY KEY,
email VarChar(50),
firstName VarChar(50),
lastName VarChar(50),
phone VarChar(50))

CREATE TABLE Prices(id int IDENTITY(1,1) PRIMARY KEY,
highprice int,
lowprice int)
CREATE TABLE SpotType(id INT IDENTITY(1,1) PRIMARY KEY,
name varchar(50),
price_id INT 
FOREIGN KEY REFERENCES Prices(id))

CREATE TABLE Reservation(id INT IDENTITY(1,1) PRIMARY KEY,
customer_id INT FOREIGN KEY REFERENCES Customers(id),
spot_id INT FOREIGN KEY REFERENCES Spots(id),
startDate DATE,
endDate DATE)

CREATE TABLE SeasonType(id INT IDENTITY(1,1) PRIMARY KEY,
price_id int FOREIGN KEY REFERENCES Prices(id))
CREATE TABLE SeasonOrders(id INT IDENTITY(1000,1) PRIMARY KEY,
customer_id INT FOREIGN KEY REFERENCES Customers(id),
seasonSpot_id INT FOREIGN KEY REFERENCES SeasonType(id),
reservation_id INT FOREIGN KEY REFERENCES Reservation(id))
CREATE TABLE SingleOrders(id INTEGER IDENTITY(1000,1) PRIMARY KEY,
customer_id int FOREIGN KEY REFERENCES Customers(id),
adults int NOT NULL,
kids int,
dogs int,
reservation_id INT FOREIGN KEY REFERENCES Reservation(id)) 

CREATE TABLE ExtraType(id INTEGER IDENTITY(1,1) PRIMARY KEY,
name VarChar(50),
price_id INTEGER FOREIGN KEY REFERENCES Prices(id)

CREATE TABLE OrderExtra(id INTEGER IDENTITY(1,1) PRIMARY KEY,
Singleorder_id INT FOREIGN KEY REFERENCES SingleOrders(id),
extraType_id INTEGER FOREIGN KEY REFERENCES ExtraType(id),
quantity INT)

CREATE TABLE Seasons(id INTEGER IDENTITY(1,1) PRIMARY KEY,
seasonName VarChar(50),
startDate Date,
endDate date)

CREATE TABLE Spots(id INT IDENTITY(1,1)PRIMARY KEY,
name varchar(50),
spottype INT 
FOREIGN KEY REFERENCES Spottype(id))

INSERT INTO Customers VALUES('Admin@Campingpladsen.dk','Admin','Admin','22222222');

INSERT INTO Prices VALUES(60,50)
INSERT INTO Prices VALUES(80,65)
INSERT INTO Prices VALUES(500,350)
INSERT INTO Prices VALUES(850,600)
INSERT INTO Prices VALUES(35,45)

INSERT INTO Prices VALUES(82,87) 
INSERT INTO Prices VALUES(42,49) 
INSERT INTO Prices VALUES(30,30) 

INSERT INTO Prices VALUES(30,30)
INSERT INTO Prices VALUES(150,150)
INSERT INTO Prices VALUES(200,200)
INSERT INTO Prices VALUES(30,30)
INSERT INTO Prices VALUES(15,15)

INSERT INTO SpotType VALUES('Caravan/Autocamper (Small)',1);
INSERT INTO SpotType VALUES('Caravan/Autocamper (Big)',2);
INSERT INTO SpotType VALUES('Standard Cabin 4 Person',3);
INSERT INTO SpotType VALUES('Delux Cabin 4-6 Person',4);
INSERT INTO SpotType VALUES('Tent',5);

INSERT INTO ExtraType VALUES('Bed linen',9)
INSERT INTO ExtraType VALUES('Final cleaning',10)
INSERT INTO ExtraType VALUES('bicycle rental', 11)
INSERT INTO ExtraType VALUES('Pool Ticket (Adult)',12)
INSERT INTO ExtraType VALUES('Pool Ticket(Kid)',13)


DECLARE @i int = 1
WHILE @i <= (SELECT Count(id) FROM Spots)
BEGIN 
	INSERT INTO Reservation VALUES(1,@i, '2022-01-01','2022-01-01')
	SET @i = @i+1
END

INSERT INTO Seasons VALUES('Summer','2022-06-14','2022-08-15')


DECLARE @i int = 1;
WHILE @i <= 8
BEGIN 
	INSERT INTO Spots VALUES(CONCAT('h',@i),3)
	IF @i = 5
		SET @i = @i + 2
	ELSE
		SET @i = @i + 1	
END

DECLARE @i int = 10
WHILE @i <= 15
BEGIN 
	INSERT INTO Spots VALUES(CONCAT('h',@i),4)
	SET @i = @i + 1	
END

DECLARE @i int = 2
WHILE @i <= 309
BEGIN 
	INSERT INTO Spots VALUES(CAST(@i as varchar(50)),1)
	IF @i = 4
		SET @i = 11
	ELSE IF @i = 13
		SET @i = @i+2
	ELSE IF @i = 15
		SET @i = 20
	ELSE IF @i = 22
		SET @i = 24
	ELSE IF @i = 26
		SET @i = @i+2
	ELSE IF @i = 30
		SET @i = @i +2
	ELSE IF @i = 52
		SET @i = @i +2
	ELSE IF @i = 56
		SET @i = @i + 2
	ELSE IF @i = 61
		SET @i = @i + 2
	ELSE IF @i = 64
		SET @i = @i +2
	ELSE IF @i = 68
		SET @i = @i +2
	ELSE IF @i = 70
		SET @i = 84
	ELSE IF @i = 84
		SET @i = @i + 2
	ELSE IF @i = 87
		SET @i = @i +2
	ELSE IF @i = 89
		SET @i = 93
	ELSE IF @i = 93
		SET @i = @i +2
	ELSE IF @i = 96
		SET @i = @i +2
	ELSE IF @i = 98
		SET @i = 101
	ELSE IF @i = 112
		SET @i = @i+2
	ELSE IF @i = 117
		SET @i = @i+2
	ELSE IF @i = 125
		SET @i = @i +2
	ELSE IF @i = 128
		SET @i = 133
	ELSE IF @i = 133
		SET @i = @i + 2
	ELSE IF @i = 138
		SET @i = @i + 2
	ELSE IF @i = 142
		SET @i = @i + 2
	ELSE IF @i = 148
		SET @i = 151
	ELSE if @i = 160
		SET @i = 181
	ELSE IF @i = 184
		SET @i = 226
	ELSE IF @i = 232
		SET @i = 237
	ELSE IF @i = 258
		SET @i = 300
	ELSE SET @i = @i +1
END;


DECLARE @i int = 72
WHILE @i <= 199
BEGIN 
	INSERT INTO Spots VALUES(CAST(@i as varchar(50)),2)
	IF @i = 74
		SET @i = @i +2
	ELSE IF @i = 80
		SET @i = 129
	ELSE IF @i = 130
		SET @i = 161
	ELSE IF @i = 174
		SET @i = 190
	ELSE IF @i = 193
		SET @i = 195
	ELSE SET @i = @i +1
END;

DECLARE @i int = 204
WHILE @i <= 236
BEGIN
	INSERT INTO Spots VALUES(CAST(@i as varchar(50)),5)
	IF @i = 221
		SET @i = 225
	ELSE if @i = 225
		SET @i = 233
	ELSE SET @i = @i+1
END;
