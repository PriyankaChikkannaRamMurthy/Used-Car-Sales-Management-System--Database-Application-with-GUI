<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report 1</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type = "text/javascript"  src = "js/dcalendar.picker.js"></script>
<script>
$(function() {
    $("#calendar").datepicker({
    	  inline: true,
          firstDay: 1,
          showOtherMonths: true,
          dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
    }).datepicker("show");
});
</script>
</head>
<body>
<p>Date: <input type="text" id="calendar"></p>
</body>
</html>