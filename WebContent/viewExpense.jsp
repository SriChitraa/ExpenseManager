<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"></link>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

<%@ include file="header.jsp"%>
<title>Insert title here</title>

<script>
$(document).ready(function() {  
	var category = "All";
	var date = new Date();
	var startDate = new Date(date.getFullYear(), date.getMonth(), 1);
	var endDate = new Date(date.getFullYear(), date.getMonth() + 1, 0);
	$("#startDate").val(formatDate(startDate));
	$("#endDate").val(formatDate(endDate));
	$("#category").val(category);
	loadDataTable(category,formatDate(startDate),formatDate(endDate));
	
	$("#search").click(function(e){
		e.preventDefault();
		search();
		return false;
	});

});
	
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}
function search(){
	var userId = "1";
	var category = $('#category').val();
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	loadDataTable(category,startDate,endDate);
}

function loadDataTable(category,startDate,endDate) {
	$('#example').DataTable({
        "ajax": "http://localhost:8081/ExpenseManager/expenses?category="+category+"&startDate="+startDate+"&endDate="+endDate+"",
        "columns": [
        	{ "data": "date" },
        	{ "data": "time" },
        	{ "data": "category" },
            { "data": "amount" },
            { "data": "content" }
        ],
        "bFilter": false,
        "bInfo": false,
        "destroy": true,
    });
}

</script>

<style>
label {
	margin-left: 80px;
}
</style>
</head>
<body>
	<div class="container">
		<h2></h2>
		<form class="form-inline" id="form">
			<div class="form-group">
				<div class="drop-down">
					<select name="category" class="form-control"
						style="width: 160px; margin-left: 80px" id="category" required>
						<option>Select</option>
						<option>All</option>
						<option>Investment</option>
						<option>HouseRent</option>
						<option>Recreation</option>
						<option>Food</option>
						<option>Household</option>
						<option>Education</option>
						<option>Transportation</option>
						<option>Loan</option>
						<option>Gift</option>
						<option>Others</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<input type="date" class="form-control" id="startDate"
					placeholder="Start Date" name="startDate" required>
			</div>
			<div class="form-group">
				<input type="date" class="form-control" id="endDate"
					placeholder="End Date" name="endDate" required>
			</div>

			<button  id="search" style="width: 160px"
				class="btn btn-default">Search</button>
			<h2></h2>
			<table id="example" class="display" cellspacing="0"
				style="margin-left: 80px" width="75%">
				<thead>
					<tr>
						<th>Date</th>
						<th>Time</th>
						<th>Category</th>
						<th>Amount</th>
						<th>Content</th>
					</tr>
				</thead>

			</table>
		</form>
</body>
</html>