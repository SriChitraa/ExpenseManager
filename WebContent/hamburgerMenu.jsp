<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}
.topnav {
  overflow: hidden;
  background-color: #333;
  position: relative;
}

.topnav #myLinks {
  display: none;
}

.topnav a {
  color: white;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  display: block;
}

.topnav a.icon {
  background: black;
  display: block;
  position: absolute;
  right: 0;
  top: 0;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}
</style>
<script>
function myFunction() {
  var x = document.getElementById("myLinks");
  if (x.style.display === "block") {
    x.style.display = "none";
  } else {
    x.style.display = "block";
  }
}
</script>
</head>
<body>
	<div class="topnav">
	 <a href="#home" class="active">Logo</a>
		<div id="myLinks">
			<a href="addExpense.jsp">Add Expense</a> 
			<a href="expenses">View Expense</a> 
			<a href="dashboard.jsp">Dashboard</a>
		</div>
		 <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
	</div>
</body>
</html>