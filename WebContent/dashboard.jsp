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
Object expense = session.getAttribute("expenses");
String dp = (String)expense;
System.out.print(dp);
%>
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("category", "Health"); map.put("y", 35); list.add(map);
map = new HashMap<Object,Object>(); map.put("category", "Finance"); map.put("y", 20); list.add(map);
map = new HashMap<Object,Object>(); map.put("category", "Career"); map.put("y", 18); list.add(map);
map = new HashMap<Object,Object>(); map.put("category", "Education"); map.put("y", 15); list.add(map);
map = new HashMap<Object,Object>(); map.put("category", "Family"); map.put("y", 5); list.add(map);
map = new HashMap<Object,Object>(); map.put("category", "Real Estate"); map.put("y", 7); list.add(map);
 
String dataPoints = gsonObj.toJson(list);
System.out.print(dataPoints);
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
			dataPoints : <%out.print(dp);%>
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
<%int id=Integer.parseInt(request.getParameter("id")); %>
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