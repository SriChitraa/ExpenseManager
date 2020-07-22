<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/header.css" type="text/css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
	<nav role="navigation">
		<div id="menuToggle">
			<input type="checkbox" /> 
			 <span></span>
			 <span></span> 
			 <span></span>
			<ul id="menu">
				<a href="addExpense.jsp"><li>Add Expense</li></a>
				<a href="viewExpense.jsp"><li>View Expense</li></a>
				<a href="dashboard.jsp"><li>DashBoard</li></a>
			</ul>
		</div>
	</nav>
	<div class="container jumbotron"
		style="margin: 0px; width: 100%; padding: 0px">
		<div class="row" style="background-color: white; margin: 0px">
			<h2 id="header">
				<strong>MONEY MANAGER</strong>
			</h2>

			<div id="menuToggle">
				<input type="checkbox" /> <span></span> <span></span> <span></span>
				<ul id="menu">
					<a href="addExpense.jsp"><li>Add Expense</li></a>
					<a href="viewExpense.jsp"><li>View Expense</li></a>
					<a href="dashboard.jsp"><li>DashBoard</li></a>

				</ul>

			</div>
		</div>
	</div>
</body>
</html>