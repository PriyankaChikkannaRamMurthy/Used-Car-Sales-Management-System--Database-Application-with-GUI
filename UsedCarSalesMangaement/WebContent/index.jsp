<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Used Car Sales Management</title>
<script type="text/javascript" src="js/jquery-1.12.0.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script>
	$(function(){
		$("#addCar").click(function(){
			$.get("addCar.jsp",show);
		});
		function show(data){
			$("#content").html(data);	
		}
	});
	$(function(){
		$("#viewAllCars").click(function(){
			$.get("viewall.do",show);
		});
		function show(data){
			$("#content").html(data);	
		}
	});
	$(function(){
		$("#viewReport").click(function(){
			$.get("viewReport.jsp",show);
		});
		function show(data){
		$("#content").html(data);	
		}
	});
	
	$(function(){
		$("#viewEmployees").click(function(){
			$.get("viewallEmp.do",show);
		});
		function show(data){
			$("#content").html(data);	
		}
	});
	
	$(function(){
		$("#viewCustomers").click(function(){
			$.get("viewallCust.do",show);
		});
		function show(data){
			$("#content").html(data);	
		}
	});


</script>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<style>
.button{
	width:16em;
	height:25px;
	color:blue;
}
</style>
</head>
<body>
<div class="container-fluid" style="background-color:#0040ff" >
 	<div class="row">
		<div class="col-md-2">
			<img alt="logo" src="images/images.duckduckgo.com.jpg" height="100" width="150">
			</div>
		<div class="col-md-8">
			<h1 style="text-align: center"> Used Car Sales Management</h1>
		</div>
		 
	</div>
</div>
		<br>
		<br>
		
		<div class="container">
		<div class="col-md-3">
		<div class="panel panel-default">
		<div class="panel -heading" style="text-align: center">Menu</div>
		<div class="panel-body">
		<button id="addCar" class="button ">ADD CAR</button>
		<hr>
		<button id="viewAllCars"  class="button">VIEW ALL CARS</button>
		<hr>
		<button id="viewEmployees"  class="button">MANAGE EMPLOYEES</button>
		<hr>
		<button id="viewCustomers"  class="button">MANAGE CUSTOMERS</button>
		<hr>
		<button id="viewReport"  class="button">VIEW REPORT</button>
		</div>
		</div>
		</div>
		<div class="col-md-9">
		 
			<div id="content">
 </div>
		</div>
		</div>

</body>
</html>