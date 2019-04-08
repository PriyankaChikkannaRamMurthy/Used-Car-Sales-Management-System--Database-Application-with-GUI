package uta.db.servicecontroller;

import java.util.List;

import uta.db.pojo.Car;
import uta.db.pojo.Dealer;
import uta.db.pojo.Employee;

public class CarManagementImp implements CarManagementInf{
	private CarManagementInf carmanagementInf;
	
	public  CarManagementImp() {
		carmanagementInf = new CarManagementImp();
	}

	@Override
	public boolean addCar(Car car) {
		
		return carmanagementInf.addCar(car);
	}

	@Override
	public List<Car> viewall() {
	
		return carmanagementInf.viewall();
	}

	@Override
	public boolean deleteCar(String VIN) {
		
		return carmanagementInf.deleteCar(VIN);
	}

	@Override
	public  List<Car> getCar(String VIN) {
		return carmanagementInf.getCar(VIN);
	}

	@Override
	public boolean updateCar(Car car) {
		return carmanagementInf.updateCar(car);
	}

	@Override
	public List<Employee> viewallEmp() {
		return carmanagementInf.viewallEmp();

	}

	@Override
	public Dealer getDealer(String DealerId) {
		return carmanagementInf.getDealer(DealerId);
	}

	@Override
	public List<Employee> getEmployee(String EID) {
		return carmanagementInf.getEmployee(EID);
	}

	
	

}
