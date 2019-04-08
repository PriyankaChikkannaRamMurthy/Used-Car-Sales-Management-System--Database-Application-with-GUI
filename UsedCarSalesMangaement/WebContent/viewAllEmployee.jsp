<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee List</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
<script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="media/css/jquery.dataTables.css">

<script>
    $(document).ready(function () {
        $('#escalation').dataTable();
    });
</script>
<%--<script type="text/javascript" src="js/jquery-1.12.0.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>  --%>
</head>
<body>
<c:if test="${Employee_List.size() eq null }">
		<h3>Sorry! The List is empty</h3>
</c:if>
 <div class="table-responsive">
 <div class="table-responsive"> 

<table id = "escalation" class="table table-bordered" >
<c:if test="${Employee_List.size() ne null }">
	<thead class="thead-inverse">
		<tr style="font-weight:bold">
		<td>First Name</td>
		<td>Last Name</td>
		<td>DOB</td>
		<td>Address</td>
		<td>Salary</td>
		<td>Working Location</td>
		<td>Join Date</td>
		<td>Edit</td>
		</tr>
	</thead>
<tbody>
	<c:forEach items="${Employee_List}" var="emp">
	<tr>
		<td >${emp.getFirstName() }</td>
		<td>${emp.getLastName() }</td>
		<td>${emp.getDOB() }</td>
		<td>${emp.getAddress() }</td>	
		<td>${emp.getSalary() }</td>	
		<td>${emp.getDealer().getLocation() }</td>
		<td>${emp.getJoinDate() }</td>	
		<td><a href="editemp.do?EId=${emp.getEId() }"><span class="glyphicon glyphicon-pencil"></span></a></td>	  			
	</c:forEach>
</tbody>
</c:if> 
</table>
</div>
</div>
</body>
</html>