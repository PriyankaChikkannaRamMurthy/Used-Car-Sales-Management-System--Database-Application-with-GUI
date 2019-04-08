package uta.db.dao;

public interface StringConstants {
	String DRIVER = "com.mysql.jdbc.Driver";
	String URL = "jdbc:mysql://localhost:3306/testdatabase";
	String USER = "root";
	String PASSWORD = "root";
	
	String CAR_SUCCESS_MSG = "Car Added Successfully";
	String CAR_UPDATE_MSG = "Car Updated Successfully";
	String CAR_FAILURE_MSG = "Car addition Failed";
	String ADD_CAR="insert into car(vin,make,model,mileage,enginecapacity,color,year,msrp)values(?,?,?,?,?,?,?,?)";
	String GET_CAR= "select * from car";
	String DELETE_CAR = "delete from car where VIN = ?";
	String GET_UPDATE_CAR = "select  * from car where VIN = ?";
	String UPDATE_CAR = "update car set make = ?,model = ?,mileage=?,enginecapacity=?,color=?,year=?,msrp=? where VIN= ? ";
	String GET_EMPLOYEE = "select * from Employee";
	String GET_DEALER = "select * from Dealer where DealerId =?";
	String GET_UPDATE_EMPLOYEE = "select * from Employee where EID = ?";

}
