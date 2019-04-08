set linesize 160;

Create table F17_T21_Dealer(
   DealerId varchar(10) primary key Not null,
   Location varchar(20),
   PhoneNo varchar(15)
);

Create table F17_T21_Employee(
   EId varchar(7) primary key not null,
   FirstName varchar(15),
   LastName varchar(15),
   DOB date,
   Address varchar(20),
   Salary float,
   Dealer_Id varchar(10), 
   JoinDate date,
   foreign key(Dealer_Id) References F17_T21_Dealer(DealerId) ON Delete Cascade
);


Create table F17_T21_Customer(
   CustomerId varchar(10) primary key Not null,
   FirstName varchar(18),
   LastName varchar(19),
   DOB date,
   EmailId varchar(38),
   StreetNo varchar(10), 
   StreetName varchar(25),
   City varchar(17),
   State varchar(5)
);

Create table F17_T21_Car(
   VIN varchar(18) primary key Not null,
   Make varchar(20),
   Model varchar(20),
   Mileage varchar(8),
   EngineCapacity varchar(15),
   Color varchar(13),
   Year varchar(5),
   MSRP varchar(10) 
);

Create table F17_T21_BuyDetails(
   EId varchar(7),
   CustomerID varchar(15),
   VIN varchar(18),
   BuyingDate date,
   BuyingPrice float,
   CONSTRAINT PK_BuyDetails primary key (EId,CustomerID,VIN,BuyingDate,BuyingPrice),
   foreign key(EId) References F17_T21_Employee(EId) on delete cascade,
   foreign key(VIN) References F17_T21_Car(VIN) on delete cascade,
   foreign key(CustomerID) References F17_T21_Customer(CustomerId) on delete cascade
);

Create table F17_T21_RefurbishDetails(
   EId varchar(7),
   VIN varchar(18),
   Service_Type varchar(40),
   Refurbish_Date date, 
   Refurbish_Cost float,
   CONSTRAINT PK_RefurbishDetails primary key (EId,VIN,Service_Type,Refurbish_Date,Refurbish_Cost),
   foreign key(EId) References F17_T21_Employee(EId) on delete cascade,
   foreign key(VIN) References F17_T21_Car(VIN) on delete cascade
);

Create table F17_T21_SaleDetails(
   EId varchar(7),
   CustomerID varchar(15),
   VIN varchar(18), 
   SellingPrice float,
   SellingDate date,
   CommissionPercentage float,
   CustomerRating float,
   WarrantyPrice float,
   Warranty_Start_Date date,
   Warranty_End_Date date,
   CONSTRAINT PK_SaleDetails primary key (EId,CustomerID,VIN,SellingPrice,SellingDate),
   foreign key(EId) References F17_T21_Employee(EId) on delete cascade,
   foreign key(VIN) References F17_T21_Car(VIN) on delete cascade,
   foreign key(CustomerID) References F17_T21_Customer(CustomerId) on delete cascade
);

Create table F17_T21_ServiceDetails(
   EId varchar(7),
   VIN varchar(18),
   Service_Type varchar(20),
   Service_Date date,
   Service_Cost float,
   CONSTRAINT PK_ServiceDetails primary key (EId,VIN,Service_Type,Service_Date,Service_Cost),
   foreign key(EId) References F17_T21_Employee(EId) on delete cascade,
   foreign key(VIN) References F17_T21_Car(VIN) on delete cascade
);