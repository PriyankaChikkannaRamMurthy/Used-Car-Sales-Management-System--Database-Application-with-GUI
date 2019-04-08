<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report File</title>
<script type="text/javascript" src="js/jquery-1.12.0.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script>
	$(function(){
		$("#report1").click(function(){
			$.get("getReport1.do",show);
		});
		function show(data){
			$("#content").html(data);	
		}
	});
	$(function(){
		$("#viewReport2").click(function(){
			$.get("viewReport2.do",show);
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

<style>
.button{
	width:10em;
	height:25px;
	color:blue;
}
</style>
</head>
<body>
		 <button id="report1" class="button ">Report 1</button>
		 <button id="report2" class="button ">Report 2</button>
		 <button id="report3" class="button ">Report 3</button>
		 <button id="report4" class="button ">Report 4</button>
		 <button id="report5" class="button ">Report 5</button>
<div class="col-md-9">	 
		<div id="content"></div>
 </div>
</body>
</html>