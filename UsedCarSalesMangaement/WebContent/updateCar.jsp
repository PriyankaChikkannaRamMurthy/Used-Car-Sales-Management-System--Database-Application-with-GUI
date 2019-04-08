<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:if test="${Car_List.size() eq null }">
		<h3>Sorry! The List is empty</h3>
</c:if>
<fieldset>
	<legend>Car Details</legend>
<form action="updateCar.do">
	<table class="table table-bordered">
	<c:forEach items="${Car_List}" var="car">
	<tr>
	<th>VIN</th>
	<td><input type="text"  name="vin" style="width: 300px;" value = ${car.getVIN() } readonly>
	
		<tr>
		<th>Make</th>
		<td><input type="text"  name="make" style="width: 300px;" value = ${car.getMake() }>
		</tr>
	<tr>
		<th>Model</th>
		<td><input type="text"  name="model" style="width: 300px;" value = ${car.getModel() }>
	</tr>
	<tr>
		<th>Mileage</th>
		<td><input type="text"  name="mileage" style="width: 300px;" value = ${car.getMileage() }>
	</tr>
	<tr>
		<th>Engine Capacity</th>
		<td><input type="text"  name="ecapacity" style="width: 300px;" value = ${car.getEngineCapacity() }>
	</tr>
	<tr>
		<th>Color</th>
		<td><input type="text"  name="color" style="width: 300px;" value = ${car.getColor() }>
	</tr>
	<tr>
		<th>Year</th>
		<td><input type="text" name="year" style="width: 300px;" value = ${car.getYear() }>
	</tr>
	<tr>
		<th>MSRP</th>
		<td><input type="text" id = "box" name="msrp" style="width: 300px;" value = ${car.getMSRP() }>
	</tr>
	</c:forEach>
	
	</table>
	<input type="submit" value="Update Car" style="width: 300px;">
	<input type="reset" value="Clear" style="width: 300px;">

</form>

</fieldset>

</body>
</html>