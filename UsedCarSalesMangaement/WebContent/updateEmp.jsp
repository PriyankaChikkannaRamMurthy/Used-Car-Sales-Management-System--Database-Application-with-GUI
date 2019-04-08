<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Employee</title>
</head>
<body>
<c:if test="${Emp_List.size() eq null }">
		<h3>Sorry! The List is empty</h3>
</c:if>
<fieldset>
	<legend>Employee Details</legend>
<form action="updateEmp.do">
	<table class="table table-bordered">
	<c:forEach items="${Emp_List}" var="emp">
	<tr>
	<th>EID</th>
	<td><input type="text"  name="eid" style="width: 300px;" value = ${emp.getEId() } readonly>
	<tr>
	<th>First Name</th>
	<td><input type="text"  name="fname" style="width: 300px;" value = ${emp.getFirstName() }>
	</tr>
	<tr>
	<th>Last Name</th>
	<td><input type="text"  name="lname" style="width: 300px;" value = ${emp.getLastName() }>
	</tr>
	<tr>
	<th>DOB</th>
	<td><input type="text"  name="dob" style="width: 300px;" value = ${emp.getDOB() }>
	</tr>
	<tr>
	<th>Address</th>
	<td><input type="text"  name="address" style="width: 300px;" value = ${emp.getAddress() }>
	</tr>
	<tr>
	<th>Salary</th>
	<td><input type="text"  name="salary" style="width: 300px;" value = ${emp.getSalary() }>
	</tr>
	<tr>
	<th>Join Date</th>
	<td><input type="text"  name="fname" style="width: 300px;" value = ${emp.getJoinDate() }>
	</tr>
	<tr>
	</c:forEach>
	</table>
	<input type="submit" value="Update Employee" style="width: 300px;">
	<input type="reset" value="Clear" style="width: 300px;">
</form>
</fieldset>

</body>
</html>