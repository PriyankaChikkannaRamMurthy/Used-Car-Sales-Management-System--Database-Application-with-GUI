--1. Identify the make and model of the car that has sold the most

SELECT Make,Model,CarCount
FROM ( SELECT Make,Model,COUNT(VIN) as CarCount
	   FROM F17_T21_SaleDetails NATURAL JOIN F17_T21_Car
	   GROUP BY Make,Model )
WHERE CarCount = ( SELECT MAX(COUNT(VIN))
				   FROM F17_T21_SaleDetails NATURAL JOIN F17_T21_Car
				   GROUP BY Make,Model )
ORDER BY Make asc ;

--2. Identify the cities where more than 20 customers are from

SELECT City, COUNT(City) as CityCount
FROM F17_T21_Customer
GROUP BY City
HAVING COUNT(CITY) > 20
ORDER BY CityCount asc ;

--3. Identify employee with lowest average customer satisfaction rating

SELECT EId, AvgRating
FROM ( SELECT EId,AVG(CustomerRating) as AvgRating
	   FROM F17_T21_SaleDetails NATURAL JOIN F17_T21_Employee
	   GROUP BY EId )
WHERE AvgRating = ( SELECT MIN(AVG(CustomerRating))
					FROM F17_T21_SaleDetails NATURAL JOIN F17_T21_Employee
					GROUP BY EId )
ORDER BY EId asc ;

--4. Calculate the total cost that is spent on servicing cars that are under warranty

SELECT SUM(Service_Cost) as Total_ServiceCost
FROM F17_T21_ServiceDetails
WHERE Service_Type = 'Warranty' ;

--5. Generate list of cars that are still under warranty, and the name and email address of the customer it belongs to

SELECT Warranty_End_Date,F17_T21_Car.Make, F17_T21_Car.Model, F17_T21_Customer.FirstName,
       F17_T21_Customer.LastName, F17_T21_Customer.EmailID
FROM F17_T21_SaleDetails Join F17_T21_Customer on F17_T21_SaleDetails.CustomerID = F17_T21_Customer.CustomerID
     Join F17_T21_Car on F17_T21_SaleDetails.VIN = F17_T21_Car.VIN
WHERE Warranty_End_Date > sysdate ;


--6. Identify the dealer location that has made the most money in the given date range i.e., '01-NOV-2014' and '30-DEC-2014'

SELECT Location
FROM F17_T21_Dealer 
WHERE DealerId = ( 
	SELECT Dealer_Id 
	FROM F17_T21_Employee join F17_T21_SaleDetails on F17_T21_Employee.EID = F17_T21_SaleDetails.EId
	WHERE F17_T21_Employee.EID  in (
		SELECT Sales_ID
		FROM (
			SELECT F17_T21_SaleDetails.EId as Sales_ID,SellingPrice,
				   BuyingPrice, Refurbish_Cost, SellingPrice - 
				   BuyingPrice - Refurbish_Cost as Profit
			FROM F17_T21_SaleDetails INNER JOIN F17_T21_BuyDetails 
				   on F17_T21_SaleDetails.VIN = F17_T21_BuyDetails.VIN
			       JOIN F17_T21_RefurbishDetails 
				   on F17_T21_BuyDetails.VIN = F17_T21_RefurbishDetails.VIN 
			       AND sellingdate BETWEEN '01-NOV-2014' AND '30-DEC-2014' 
			)
		WHERE Profit = 
			( SELECT MAX(SellingPrice - BuyingPrice - Refurbish_Cost)
			  FROM F17_T21_SaleDetails 
			  INNER JOIN F17_T21_BuyDetails on F17_T21_SaleDetails.VIN = F17_T21_BuyDetails.VIN
			  JOIN F17_T21_RefurbishDetails on F17_T21_BuyDetails.VIN = 
                   F17_T21_RefurbishDetails.VIN 
		      AND sellingdate BETWEEN '01-NOV-2014' AND '30-DEC-2014')
					));


--7. Identify the month that has the maximum car sales in a given year,e.g. 2008


SELECT Year, Month, MaxSales
FROM ( SELECT EXTRACT(year from SellingDate)as Year,
			  EXTRACT(month from SellingDate)as Month,
			  COUNT(EXTRACT(month from SellingDate)) as MaxSales
       FROM F17_T21_SaleDetails
       WHERE EXTRACT(year from SellingDate)='2008'
       GROUP BY EXTRACT(year from SellingDate),
                EXTRACT(month from SellingDate)
)
WHERE MaxSales =( SELECT MAX(COUNT(EXTRACT(month from SellingDate)))
                  FROM F17_T21_SaleDetails
                  WHERE EXTRACT(year from SellingDate)='2008'
                  GROUP BY EXTRACT(month from SellingDate)
				)
ORDER BY Month asc;

--8. Calculate the commission that should be paid to each sales employee for a particular month, e.g. March 2014

SELECT Sales_ID, SUM(Profit), 0.25 * SUM(PROFIT) as Commission
FROM 
    ( SELECT SellingDate, F17_T21_SaleDetails.EId as Sales_ID,SellingPrice, 
             BuyingPrice, Refurbish_Cost, SellingPrice - BuyingPrice - 
             Refurbish_Cost as Profit
	  FROM F17_T21_SaleDetails INNER JOIN F17_T21_BuyDetails 
           on F17_T21_SaleDetails.VIN = F17_T21_BuyDetails.VIN
	       JOIN F17_T21_RefurbishDetails on F17_T21_BuyDetails.VIN = F17_T21_RefurbishDetails.VIN 
	  WHERE SellingDate BETWEEN '01-MAR-2014' AND '01-APR-2014'
     )
GROUP BY Sales_ID
ORDER BY Sales_ID asc;


--9. List all sales employees with their total number of sales

SELECT EId, FirstName, LastName,
	( SELECT COUNT(F17_T21_SaleDetails.EId) 
	  FROM F17_T21_SaleDetails 
	  WHERE F17_T21_SaleDetails.EId = F17_T21_Employee.EId ) as SalesCount
FROM F17_T21_Employee
WHERE EId < 'Emp081';


--10. Identify employees making more/less than some number of sales i.e., 2 over a given time range

SELECT FirstName,LastName 
FROM F17_T21_Employee 
WHERE EID in ( SELECT EID 
			   FROM F17_T21_SaleDetails 
			   WHERE SellingDate BETWEEN '01-Jan-2011' AND '30-DEC-2014'     
			   GROUP BY EID 
			   HAVING count(EID)>2 );

--11. Generate list of how many times each sales employee has received a particular rating

SELECT EId, CustomerRating, COUNT(VIN) as Number_of_sales
FROM F17_T21_SaleDetails
GROUP BY ROLLUP(EId, CustomerRating);

