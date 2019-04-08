-- INSERT 
INSERT INTO F17_T21_Car VALUES ('2CGLF034VJR699410','Mini Cooper','Cooper','10471','1600CC','Mattblack','2000','12425');
INSERT INTO F17_T21_BuyDetails VALUES ('Emp071','Cust001','2CGLF034VJR699410','04-Jan-2010',11000);
INSERT INTO F17_T21_RefurbishDetails VALUES('Emp081','2CGLF034VJR699410','Test','04-Jan-2010',1000);
INSERT INTO F17_T21_SaleDetails VALUES ('Emp009','Cust151','2CGLF034VJR699410',22000,'12-Mar-2014',25,1,1900,'12-Mar-2014','12-Mar-2017');

-- UPDATE
UPDATE F17_T21_Customer
SET  FirstName ='Priyanka', LastName = 'Murthy'
WHERE CustomerID = 'Cust167';

UPDATE F17_T21_Customer
SET  FirstName ='Nathan', LastName = 'Huang'
WHERE CustomerID = 'Cust160';

UPDATE F17_T21_Customer
SET  FirstName ='Sriranga', LastName = 'Ramakrishna'
WHERE CustomerID = 'Cust025';

-- DELETE
DELETE FROM F17_T21_ServiceDetails 
WHERE VIN = '4BLGL637RAL092284' AND Service_Date = '04-Oct-2009';


/*
Expected Output:
--1. Identify the make and model of the car that has sold the most

	MAKE                 MODEL                  CARCOUNT                                                                                                            
	-------------------- -------------------- ----------                                                                                                            
	Mini Cooper          Cooper                   6 => 7


--3. Identify employee with lowest average customer satisfaction rating

	EID      AVGRATING                                                                                                                                              
	------- ----------                                                                                                                                              
	Emp009    1.5 => 1.333333

--4. Calculate the total cost that is spent on servicing cars that are under warranty

	SELECT SUM(Service_Cost) as Total_ServiceCost
	FROM F17_T21_ServiceDetails
	WHERE Service_Type = 'Warranty' ;

	TOTAL_SERVICECOST                                                                                                                                               
	-----------------                                                                                                                                               
			17400 => 16720 
	
--5. Generate list of cars that are still under warranty, and the name and email address of the customer it belongs to

SELECT Warranty_End_Date,F17_T21_Car.Make, F17_T21_Car.Model, F17_T21_Customer.FirstName,
       F17_T21_Customer.LastName, F17_T21_Customer.EmailID
FROM F17_T21_SaleDetails Join F17_T21_Customer on F17_T21_SaleDetails.CustomerID = F17_T21_Customer.CustomerID
     Join F17_T21_Car on F17_T21_SaleDetails.VIN = F17_T21_Car.VIN
WHERE Warranty_End_Date > sysdate ;

	WARRANTY_ MAKE                 MODEL                FIRSTNAME          LASTNAME            EMAILID                                                              
	--------- -------------------- -------------------- ------------------ ------------------- --------------------------------------                               
	13-FEB-18 Ford                 Mustang              Ryan => Nathan     Harris => Huang     RyanHarris@hexa.org                                                  
	26-NOV-17 Honda                Civic                Travis => Priyanka Head => Murthy      TravisHead@zoho.com                                                  
	19-JAN-18 Ford                 Taurus           Najibullah => Sriranga  Zadran => Ramakrishna  NajibullahZadran@hotmail.com           

	
--8. Calculate the commission that should be paid to each sales employee for a particular month, e.g. March 2014

	SALES_I SUM(PROFIT) COMMISSION                                                                                                                                  
	------- ----------- ----------                                                                                                                                  
	Emp002        10625    2656.25                                                                                                                                  
	Emp008         7321    1830.25                                                                                                                                  
	Emp073         9702     2425.5 
  =>Emp009        10000	      2500
*/