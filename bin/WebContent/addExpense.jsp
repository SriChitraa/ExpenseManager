<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="css/addExpense.css" type="text/css" rel="stylesheet" />
<title>Insert title here</title>
<script>
$(document).ready(function(){
	$("form").submit(function(){
		alert("Expense added!");
	});
});
</script>
<%@ include file="header.jsp" %>
</head>
<body>
	<div class="container jumbotron" style="background-color: white; padding: 0px; margin: 0px; border: 0px">
		<div class="row" style="background-color: white">
			<div class="col-sm-offset-5 col-sm-5"style="background-color: white; padding: 0px">
				<form class="form-inline" style="padding: 10px" name="form"	action="expenses" method="post">
					<div class="form-group">
						<label class="control-label col-sm-6" style="text-align: left">Date:</label>
						<div class="col-sm-6"><input type="date" class="form-control" style="width: 200px"	name="date" required/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-6" style="text-align: left">Time:</label>
						<div class="col-sm-6"><input type="time" class="form-control" style="width: 200px" name="time" required/>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-6" style="text-align: left">Category:</label>
						<div class="col-sm-6">
							<div class="drop-down">
								<select name="category" class="form-control"
									style="width: 200px" id="category" required>
									<option>Select</option>
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
					</div>
					<div class="form-group">
						<label class="control-label col-sm-6" style="text-align: left">Amount:</label>
						<div class="col-sm-6"><input type="number" class="form-control" style="width: 200px" name="amount" required />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-6" style="text-align: left">Content:</label>
						<div class="col-sm-6"><input type="text" class="form-control" style="width: 200px" maxlength="50" name="content" required />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-8 col-sm-8" style="text-align: left">
							<input type="submit" class="btn btn-default" id="submit" name="submit" value="Save" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-8 col-sm-8" style="text-align: left">
							<input type="reset" class="btn btn-default" id="reset" name="submit" value="Reset" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>