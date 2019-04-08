package uta.db.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import uta.db.inf.CarDao;
import uta.db.pojo.Car;
import uta.db.pojo.Employee;
import uta.db.service.CarDaoImp;

@WebServlet("*.do")

public class CarManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CarDao carService;
	
	public CarManagementController(){
		carService = new CarDaoImp();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
  }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	private void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.endsWith("addCar.do")){
			System.out.println("Enterting into add student servlet");
			Car c=new Car();
			c.setVIN(request.getParameter("vin"));
			c.setMake(request.getParameter("make"));
			c.setModel(request.getParameter("model"));
			c.setMileage(request.getParameter("mileage"));
			c.setEngineCapacity(request.getParameter("ecapacity"));
			c.setColor(request.getParameter("color"));
			c.setYear(request.getParameter("year"));
			c.setMSRP(request.getParameter("msrp"));
			if(carService.addCar(c)){
				System.out.println("Car added Successfully");
				//String success="Car Added successfully";
				JOptionPane.showMessageDialog(null, "Car Added Successfully!");
				//request.setAttribute("CAR_SUCCESS_MSG",success);	
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else{
				System.out.println("Car was not added");
				JOptionPane.showMessageDialog(null, "Car could not be added!");
				//String failure="Car was not added";
				//request.setAttribute("CAR_FAILURE_MSG", failure);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
		else if(uri.endsWith("viewall.do")) {
			System.out.println("Entering into display all Servlet");
			List<Car> cList=new ArrayList<>();
			cList=carService.viewall();
			System.out.println(cList);
			request.setAttribute("Car_List",cList);
			request.getRequestDispatcher("viewAllCars.jsp").include(request, response);
			
		}
		else if(uri.endsWith("editcar.do")){
			System.out.println("Entering into Edit Servlet");
			String Vin = request.getParameter("vin");
			System.out.println(Vin);
			List<Car> cList=new ArrayList<>();
			cList=carService.getCar(Vin);
			request.setAttribute("Car_List",cList);
			request.getRequestDispatcher("updateCar.jsp").include(request, response);
		}
		else if(uri.endsWith("deletecar.do")){
			System.out.println("Entering into Delete Servlet");
			String Vin = request.getParameter("vin");
			System.out.println(Vin);
			if(carService.deleteCar(Vin)){
				System.out.println("Deleted Successfully");
				JOptionPane.showMessageDialog(null, "Entry Deleted Successfully!");
			request.getRequestDispatcher("index.jsp").include(request, response);
			}
		}
		else if (uri.endsWith("updateCar.do")){
			System.out.println("Entering into Car Update Servlet");
			Car c=new Car();
			c.setVIN(request.getParameter("vin"));
			c.setMake(request.getParameter("make"));
			c.setModel(request.getParameter("model"));
			c.setMileage(request.getParameter("mileage"));
			c.setEngineCapacity(request.getParameter("ecapacity"));
			c.setColor(request.getParameter("color"));
			c.setYear(request.getParameter("year"));
			c.setMSRP(request.getParameter("msrp"));
			if (carService.updateCar(c)){
				System.out.println("Update Successfull");
				String success="Update successfull";
				request.setAttribute("CAR_UPDATE_MSG",success);
				request.getRequestDispatcher("Success.jsp").forward(request, response);
			}
		}else if(uri.endsWith("viewallEmp.do")) {
			System.out.println("Entering into display all Servlet");
			List<Employee> eList=new ArrayList<>();
			eList=carService.viewallEmp();
			System.out.println(eList);
			request.setAttribute("Employee_List",eList);
			request.getRequestDispatcher("viewAllEmployee.jsp").include(request, response);
			
		}else if(uri.endsWith("editemp.do")){
			System.out.println("Entering into Edit Employee Servlet");
			String EmpId = request.getParameter("EId");
			System.out.println(EmpId);
			List<Employee> eList=new ArrayList<>();
			eList=carService.getEmployee(EmpId);
			System.out.println(eList);
			request.setAttribute("Emp_List",eList);
			request.getRequestDispatcher("updateEmp.jsp").include(request, response);		
		}
		else if(uri.endsWith("updateEmp.do")){
			System.out.println("Entering into update Employee Servlet");
		}else if(uri.endsWith("getReport1.do")){
			System.out.println("Entering Report1 servlet");
		}
	}
}
	

	
