<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Car</title>
</head>
<body>
<fieldset>
	<legend>Car Details</legend>
<form action="addCar.do">
	<table class="table table-bordered">
	<tr>
	<th>VIN</th>
	<td><input type="text"  name="vin" style="width: 300px;">
	
		<tr>
		<th>Make</th>
		<td><input type="text"  name="make" style="width: 300px;">
		</tr>
	<tr>
		<th>Model</th>
		<td><input type="text"  name="model" style="width: 300px;">
	</tr>
	<tr>
		<th>Mileage</th>
		<td><input type="text"  name="mileage" style="width: 300px;">
	</tr>
	<tr>
		<th>Engine Capacity</th>
		<td><input type="text"  name="ecapacity" style="width: 300px;">
	</tr>
	<tr>
		<th>Color</th>
		<td><input type="text"  name="color" style="width: 300px;">
	</tr>
	<tr>
		<th>Year</th>
		<td><input type="text" name="year" style="width: 300px;">
	</tr>
	<tr>
		<th>MSRP</th>
		<td><input type="text" id = "box" name="msrp" style="width: 300px;">
	</tr>
	
	
	</table>
	<input type="submit" value="Add Car" style="width: 300px;">
	<input type="reset" value="Clear" style="width: 300px;">

</form>

</fieldset>

</body>
</html>