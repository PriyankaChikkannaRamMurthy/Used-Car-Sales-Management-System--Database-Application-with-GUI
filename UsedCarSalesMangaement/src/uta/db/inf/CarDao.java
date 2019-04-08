package uta.db.inf;

import java.util.List;
import uta.db.pojo.Car;
import uta.db.pojo.Dealer;
import uta.db.pojo.Employee;

public interface CarDao {
	public boolean addCar(Car car);
	public List<Car> viewall();
	public boolean deleteCar(String VIN);
	public  List<Car> getCar(String VIN);
	public boolean updateCar(Car car);
	public List<Employee> viewallEmp();
	public Dealer getDealer(String DealerId);
	public List<Employee> getEmployee(String EID);


}
