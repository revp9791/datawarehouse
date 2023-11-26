CREATE DATABASE  Covid_Report;

USE DATABASE  Covid_Report;

CREATE TABLE Dim_Date (
    DateKey INT IDENTITY(1,1) PRIMARY KEY,
    Date DATE UNIQUE,
    Year INT,
    Quarter INT,
    Month INT,
    Week INT,
    DayOfWeek INT
);


CREATE TABLE Dim_Location (
    LocationKey INT IDENTITY(1,1) PRIMARY KEY,
    CountryRegionCode VARCHAR(50),
    CountryRegion VARCHAR(100),
    SubRegion1 VARCHAR(100),
    SubRegion2 VARCHAR(100),
    MetroArea VARCHAR(100),
    ISO3166_2Code VARCHAR(50),
    CensusFipsCode VARCHAR(50),
    PlaceID VARCHAR(100)
);


CREATE TABLE Fact_Mobility (
    MobilityID INT IDENTITY(1,1) PRIMARY KEY,
    DateKey INT FOREIGN KEY REFERENCES Dim_Date(DateKey),
    LocationKey INT FOREIGN KEY REFERENCES Dim_Location(LocationKey),
    RetailAndRecreationChange INT,
    GroceryAndPharmacyChange INT,
    ParksChange INT,
    TransitStationsChange INT,
    WorkplacesChange INT,
    ResidentialChange INT
);

