package uta.db.service;

import java.util.ArrayList;
import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import uta.db.dao.DaoUtil;
import uta.db.dao.StringConstants;
import uta.db.inf.CarDao;
import uta.db.pojo.Car;
import uta.db.pojo.Dealer;
import uta.db.pojo.Employee;
import uta.db.servicecontroller.CarManagementInf;

public class CarDaoImp implements CarDao,StringConstants,CarManagementInf{
	private DaoUtil util=DaoUtil.getObject();

	@Override
	public boolean addCar(Car car) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = util.getConnection();
			pstmt =con.prepareStatement(ADD_CAR);
			pstmt.setString(1, car.getVIN());
			pstmt.setString(2, car.getMake());
			pstmt.setString(3, car.getModel());
			pstmt.setString(4, car.getMileage());
			pstmt.setString(5, car.getEngineCapacity());
			pstmt.setString(6, car.getColor());
			pstmt.setString(7, car.getYear());
			pstmt.setString(8, car.getMSRP());
			
			int i = pstmt.executeUpdate();
			if (i > 0)
				return true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			util.close(con, pstmt);
		}
		return false;
		
	}


	@Override
	public List<Car> viewall() {
		List<Car> list = new ArrayList<Car>();
		Car c = null;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = util.getConnection();
			pstmt = con.prepareStatement(GET_CAR);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				c=new Car();
				c.setVIN(rs.getString("vIN"));
				c.setMileage(rs.getString("mileage"));
				c.setModel(rs.getString("model"));
				c.setMake(rs.getString("make"));
				c.setEngineCapacity(rs.getString("engineCapacity"));
				c.setColor(rs.getString("color"));
				c.setYear(rs.getString("year"));
				c.setMSRP(rs.getString("msrp"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			util.close(con, pstmt, rs);
		}
		return list;
	}


	@Override
	public boolean deleteCar(String VIN) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = util.getConnection();
			pstmt =con.prepareStatement(DELETE_CAR);
			pstmt.setString(1, VIN);
			int i = pstmt.executeUpdate();
			if (i > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			util.close(con, pstmt);
		}
			
		return false;
	}


	@Override
	public  List<Car> getCar(String VIN) {
		List<Car> list = new ArrayList<Car>();
		Car c = null;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = util.getConnection();
			pstmt =con.prepareStatement(GET_UPDATE_CAR);
			pstmt.setString(1, VIN);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				c=new Car();
				c.setVIN(rs.getString("vIN"));
				c.setMileage(rs.getString("mileage"));
				c.setModel(rs.getString("model"));
				c.setMake(rs.getString("make"));
				c.setEngineCapacity(rs.getString("engineCapacity"));
				c.setColor(rs.getString("color"));
				c.setYear(rs.getString("year"));
				c.setMSRP(rs.getString("msrp"));
				list.add(c);
			}
			
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			util.close(con, pstmt);
		}
			return list;
	}


	@Override
	public boolean updateCar(Car car) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = util.getConnection();
			pstmt =con.prepareStatement(UPDATE_CAR);
			pstmt.setString(8, car.getVIN());
			pstmt.setString(1, car.getMake());
			pstmt.setString(2, car.getModel());
			pstmt.setString(3, car.getMileage());
			pstmt.setString(4, car.getEngineCapacity());
			pstmt.setString(5, car.getColor());
			pstmt.setString(6, car.getYear());
			pstmt.setString(7, car.getMSRP());
			int i = pstmt.executeUpdate();
			if (i > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			util.close(con, pstmt);
		}	
		return false;
	}


	@Override
	public List<Employee> viewallEmp() {
		List<Employee> list = new ArrayList<Employee>();
		Employee emp  = null;
		Dealer d = null;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = util.getConnection();
			pstmt = con.prepareStatement(GET_EMPLOYEE);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				emp=new Employee();
				d = new Dealer();
				emp.setEId(rs.getString("EId"));
				emp.setFirstName(rs.getString("FirstName"));
				emp.setLastName(rs.getString("LastName"));
				emp.setDOB(rs.getString("DOB"));
				emp.setAddress(rs.getString("Address"));
				emp.setSalary(rs.getFloat("Salary"));
				emp.setJoinDate(rs.getString("JoinDate"));
				String DealerId = rs.getString("Dealer_Id");
				System.out.println(DealerId);
				d = getDealer(DealerId);
				emp.setDealer(d);
				emp.getDealer();
				list.add(emp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			util.close(con, pstmt, rs);
		}
		return list;
	}


	@Override
	public Dealer getDealer(String DealerId) {
		
		Dealer d = null;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = util.getConnection();
			pstmt =con.prepareStatement(GET_DEALER);
			pstmt.setString(1, DealerId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				d = new Dealer();
				d.setDealerId(rs.getString("DealerId"));
				d.setLocation(rs.getString("Location"));
				d.setPhoneNo(rs.getString("PhoneNo"));
				//list.add(d);
			}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		util.close(con, pstmt, rs);
	}
	return d;
		
	}


	@Override
	public List<Employee> getEmployee(String EID) {
		List<Employee> list = new ArrayList<Employee>();
		Employee emp = null;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = util.getConnection();
			pstmt =con.prepareStatement(GET_UPDATE_EMPLOYEE);
			pstmt.setString(1, EID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				emp=new Employee();
				emp.setEId(rs.getString("EId"));
				emp.setFirstName(rs.getString("FirstName"));
				emp.setLastName(rs.getString("LastName"));
				emp.setDOB(rs.getString("DOB"));
				emp.setAddress(rs.getString("Address"));
				emp.setSalary(rs.getFloat("Salary"));
				emp.setJoinDate(rs.getString("JoinDate"));
				list.add(emp);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			util.close(con, pstmt);
		}
			return list;

	}


	

}
