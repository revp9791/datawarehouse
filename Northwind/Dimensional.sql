CREATE DATABASE northwind_dim;
USE northwind_dim;
----------------------------------------------
CREATE TABLE DimCustomer (
    CustomerId nchar(5) PRIMARY KEY,
    CompanyName NVARCHAR(40),
    City NVARCHAR(15),
    Country NVARCHAR(15)
);

----------------------------------------------
CREATE TABLE DimEmployee (
    EmployeeId INT PRIMARY KEY,
    EmpLastName NVARCHAR(20),
    MngLastName NVARCHAR(20)
);

----------------------------------------------
CREATE TABLE DimProduct (
    ProductId INT PRIMARY KEY,
    ProductName NVARCHAR(40),
    ProductCategory NVARCHAR(15),
   ProductCategoryName AS c.CategoryName + ' - ' + p.ProductName  
);

----------------------------------------------
CREATE TABLE DimSupplier (
    SupplierId INT PRIMARY KEY,
    CompanyName NVARCHAR(40),
    Country NVARCHAR(15)
);

CREATE TABLE DimTime (
    TimeId INT identity(1,1) not null,
    Date DATETIME,
    Year INT,
    Quarter INT,
    Month INT,
    Day INT,
    PRIMARY KEY (TimeId)
);

CREATE TABLE FactOrders (
    FactID int IDENTITY(1,1)PRIMARY KEY,
    OrderId INT,
    CustomerId nchar(5),
    ProductId INT,
    EmployeeId INT,
    TimeId INT,
    SupplierId INT,
    Price MONEY,
    Quantity INT,
    FOREIGN KEY (CustomerId) REFERENCES DimCustomer(CustomerId),
    FOREIGN KEY (ProductId) REFERENCES DimProduct(ProductId),
    FOREIGN KEY (EmployeeId) REFERENCES DimEmployee(EmployeeId),
    FOREIGN KEY (TimeId) REFERENCES DimTime(TimeId),
    FOREIGN KEY (SupplierId) REFERENCES DimSupplier(SupplierId)
);
