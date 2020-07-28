<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.expensemanager.model.Expense"%>
<%@page import="com.expensemanager.datastore.LoginDS"%>
<%@page import="com.expensemanager.model.User"%>
<%@page import="java.util.*"%>   
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>  
<!DOCTYPE html>
<html>
<head>
<% 
Object expense = request.getAttribute("expenses");
String expenses = (String)expense;
%>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<link href="css/dashboard.css" type="text/css" rel="stylesheet" />
<%@ include file="header.jsp" %>
<title>Dashboard</title>
</head>
<body>
<% 
	String uname = (String)request.getAttribute("currentSessionUser");
	LoginDS loginDS = new LoginDS();
	User user = loginDS.getUser(uname);	
	if (user != null) {
		int userId = user.getId(); 
		System.out.print(userId);
		System.out.print(uname);
} %>
<script type="text/javascript" src="js/dashboard.js"></script>
<div id="chartContainer" style="height: 370px; margin-left:200px;margin-right:  200px"></div>
	<div class="container jumbotron" style="background-color: white">
		<div class="row" style="background-color: white">
			<div class="col-sm-offset-4 col-sm-4" style="background-color: white; padding: 0px">
				<form class="form-inline" name="form">
					<input type="submit" name="action" 	value="Add Expense" onclick="form.action='addExpense.jsp';"/>					
					<input	type="submit" name="action" id="btnSubmit" value="View Expenses" onclick="form.action='viewExpense.jsp';" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>