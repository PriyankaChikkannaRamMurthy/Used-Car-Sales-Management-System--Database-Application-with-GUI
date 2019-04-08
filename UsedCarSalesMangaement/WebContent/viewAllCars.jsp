<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>List of Cars</title>

<script type="text/javascript" src="js/jquery-1.12.0.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script> 

<script>
$(document).ready(function(){
    $('#mytable').DataTable();
});
</script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
<link rel = "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel = "stylesheet" href = "https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
</head>
<body>
<c:if test="${Car_List.size() eq null }">
		<h3>Sorry! The List is empty</h3>
</c:if>

<table class="table table-bordered" id = "mytable">
<c:if test="${Car_List.size() ne null }">
	<thead class="thead-inverse">
		<tr style="font-weight:bold">
		<td>Make</td>
		<td>Model</td>
		<td>Mileage</td>
		<td>Engine Capacity</td>
		<td>Color</td>
		<td>Year</td>
		<td>MSRP</td>
		<td>Edit</td>
		<td>Delete</td>
		</tr>
	</thead>
<tbody>
	<c:forEach items="${Car_List}" var="car">
		<tr>
		<td >${car.getMake() }</td>
		<td>${car.getModel() }</td>
		<td>${car.getMileage() }</td>	
		<td>${car.getEngineCapacity() }</td>	
		<td>${car.getColor() }</td>
		<td>${car.getYear() }</td>
		<td>${car.getMSRP() }</td>	
		<td><a href="editcar.do?vin=${car.getVIN() }" ><span class="glyphicon glyphicon-pencil"></span></a></td>	
		<td><a href="deletecar.do?vin=${car.getVIN() } " onclick="return confirm('Are you sure you want delete')"><span class="glyphicon glyphicon-trash"></span></a></td>  			
	</c:forEach>
</tbody>
</c:if> 
</table>

</body>
</html>