<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%> 
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.expensemanager.model.Expense"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<link href="css/expense.css" type="text/css" rel="stylesheet" />
<title>Insert title here</title>
<script>
	function checkDates() {	
	
		var startDate = Date.parse(document.getElementById("startDate").value);
		var category = document.getElementById("category");
		var endDate = Date.parse(document.getElementById("endDate").value);
		if (startDate > endDate) {
			alert("Check End Date");
		}
		if(category = "Select"){
			alert("Please select a category!");
		}
	}
</script>
<%@ include file = "header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h2></h2>
<form class="form-inline" action = "expenses">
<div class="form-group">
<% 
Object filter = request.getAttribute("filter");
ArrayList<String> filters = new ArrayList<>();
filters = (ArrayList<String>)filter;

String category = filters.get(0);
String startDate = filters.get(1);
String endDate = filters.get(2);
%>
      <label class="sr-only" for="email">Email:</label>
      <div class="drop-down">
<select name="category" class="form-control"  style="width: 160px" id="category" required>
<option>Select</option>
<option <%if("All".equals(category)) {%> selected <%} %>  >All</option>
<option <%if("Investment".equals(category)) {%> selected <%} %>  >Investment</option>
<option <%if("HouseRent".equals(category)) {%> selected <%} %>  >HouseRent</option>
<option <%if("Recreation".equals(category)) {%> selected <%} %>  >Recreation</option>
<option<%if("Food".equals(category)) {%> selected <%} %> >Food</option>
<option<%if("Household".equals(category)) {%> selected <%} %> >Household</option>
<option<%if("Education".equals(category)) {%> selected <%} %> >Education</option>
<option<%if("Transportation".equals(category)) {%> selected <%} %> >Transportation</option>
<option<%if("Loan".equals(category)) {%> selected <%} %> >Loan</option>
<option<%if("Gift".equals(category)) {%> selected <%} %> >Gift</option>
<option<%if("Others".equals(category)) {%> selected <%} %> >Others</option>
</select>
</div>
</div>
<div class="form-group">
      <input type="date" class="form-control" id="startDate" style="width: 160px" value="<%=startDate %>"  placeholder="Start Date" name="startDate" required>
    </div>
    <div class="form-group">
     <input type="date" class="form-control" id="endDate" style="width: 160px" value="<%=endDate %>" placeholder="End Date" name="endDate" required>
    </div>
    <button onclick="checkDates()" style="width: 160px" class="btn btn-default" >Search</button>
<h2></h2>		
<table  border = "1" style = "text-align:center">
<tr>
<th>Date</th>
<th>Time</th>
<th>Category</th>
<th>Amount</th>
<th>Content</th>
</tr>
<% 
Object expense = request.getAttribute("expenses");
ArrayList<Expense> expenses = new ArrayList<Expense>();
expenses = (ArrayList<Expense>)expense;
for(Expense data:expenses) {
%>
<tr>
<td><%= data.getDate()%></td>
<td><%=data.getTime() %></td>
<td><%=data.getCategory() %></td>
<td><%=data.getAmount() %></td>
<td><%=data.getContent() %></td>
</tr>
<%}
%>
</table>
<h2></h2>
<button type="submit" style="width: 200px" class="btn btn-default"  name="action" onclick="form.action='addExpense.jsp';">Add Expense</button>
 

</form>
</div>
</body>
</html>