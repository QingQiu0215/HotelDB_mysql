DROP DATABASE IF EXISTS HotelGuild;

CREATE DATABASE HotelGuild;

USE HotelGuild;

CREATE TABLE Amenity (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    AmenityType VARCHAR(50) ,
    Price DECIMAl(6,2)
);

CREATE TABLE RoomType (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    TypeName VARCHAR(50),
    StandardOccupancy INT NOT NULL,
    MaxOccupancy INT NOT NULL,
    BasePrice DECIMAl(6,2) NOT NULL,
    ExtraPrice DECIMAl(6,2)
);

CREATE TABLE Room (
	Id INT PRIMARY KEY,
    ADAAccessible boolean,
    RoomTypeId INT,
    FOREIGN KEY (RoomTypeId) REFERENCES RoomType(Id)
);

CREATE TABLE RoomAmenity (
	RoomId INT,
	AmenityId INT,
    PRIMARY KEY pk_Room_Amenity (RoomId,AmenityId),
	FOREIGN KEY (RoomId) REFERENCES Room(Id),
	FOREIGN KEY (AmenityId) REFERENCES Amenity (Id)
);
CREATE TABLE Reservation (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Adults INT ,
    Children INT,
    StartDate DATE DEFAULT '0000-00-00',
	EndDate DATE DEFAULT '0000-00-00',
    Cost DECIMAL(6,2) 
);


CREATE TABLE RoomReservation (
	RoomId INT,
	ReservationId INT,
    PRIMARY KEY pk_Room_Reservation (RoomId, ReservationId),
	FOREIGN KEY fk_Room_Reservation (RoomId) REFERENCES Room(Id),
	FOREIGN KEY fk_Room_Reservation (ReservationId) REFERENCES Reservation(Id)
);

CREATE TABLE Guest (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR (50) NOT NULL,
    Address VARCHAR(300) NOT NULL,
    City VARCHAR(300) ,
    State CHAR(2) ,
    Zip VARCHAR(5) ,
    Phone VARCHAR(20) NOT NULL
);

CREATE TABLE GuestReservation (
	GuestId INT NOT NULL,
	ReservationId INT NOT NULL,
    PRIMARY KEY pk_Guest_Reservation (GuestId, ReservationId),
	FOREIGN KEY (GuestId) REFERENCES Guest(Id),
	FOREIGN KEY (ReservationId) REFERENCES Reservation(Id)
);