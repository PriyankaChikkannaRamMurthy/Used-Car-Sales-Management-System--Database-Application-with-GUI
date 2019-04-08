package uta.db.pojo;

public class Employee {
	public String getEId() {
		return EId;
	}
	public void setEId(String eId) {
		EId = eId;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public float getSalary() {
		return Salary;
	}
	public void setSalary(float salary) {
		Salary = salary;
	}
	public String getJoinDate() {
		return JoinDate;
	}
	public void setJoinDate(String joinDate) {
		JoinDate = joinDate;
	}
	public Dealer getDealer() {
		return dealer;
	}
	public void setDealer(Dealer dealer) {
		this.dealer = dealer;
	}
	private String EId;
	private String FirstName;
	private String LastName;
	private String DOB;
	private String Address;
	private float Salary;
	private String JoinDate;
	Dealer dealer;

}
