<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"></link>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

<%@ include file = "header.jsp" %>
<title>Insert title here</title>
<script>
$(document).ready(function() {
    $('#example').DataTable( {
        "ajax": "http://localhost:8081/ExpenseManager/expenses?category=All&startDate=2020-07-01&endDate=2020-07-31",
        "columns": [
        	{ "data": "date" },
        	{ "data": "time" },
        	{ "data": "category" },
            { "data": "amount" },
            { "data": "content" }
        ]
    } );
} );

</script>
</head>
<body>
<table id="example" class="display" cellspacing="0" width="75%">
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
</body>
</html>