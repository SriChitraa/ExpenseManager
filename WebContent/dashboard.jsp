<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.expensemanager.model.Expense"%>
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
<script>
window.onload = function() { 
	 
	var chart = new CanvasJS.Chart("chartContainer", {
		theme: "light2",
		animationEnabled: true,
		exportFileName: "New Year Resolutions",
		exportEnabled: true,
		title:{
			text: "Top Categories of New Year's Resolution"
		},
		data: [{
			type: "pie",
			showInLegend: true,
			legendText: "{category}",
			toolTipContent: "{category}: <strong>{y}</strong>",
			indexLabel: "{category} {y}",
			dataPoints : <%out.print(expenses);%>
		}]
	});
	 
	chart.render();
	 
	}
</script>
<style>
input[type=submit]{
color: white;
background-color: black;
border: hidden; 
width: 180px; 
border-radius: 40px;
}
</style>
<%@ include file="header.jsp" %>
<title>Dashboard</title>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<div class="container jumbotron" style="background-color: white">
		<div class="row" style="background-color: white">
			<div class="col-sm-offset-4 col-sm-4" style="background-color: white; padding: 0px">
				<form class="form-inline" name="form">
					<input type="submit" name="action" 	value="Add Expenses" onclick="form.action='addExpense.jsp';"/>					
					<input	type="submit" name="action"	 value="View Expenses" onclick="form.action='ExpenseServlet';" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>