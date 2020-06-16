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
<title>Insert title here</title>
  <style>
      .form-inline{
      margin: 0 auto;
      display: table;
      max-width:100px;
      }
      
      .form-group{
      padding: 10px;
      }
      
      
      </style>
</head>
<body>
	<div class="container jumbotron"
		style="background-color: white; padding: 0px; margin: 0px; border: 0px">
		<div class="row" style="background-color: white">
			<div class="col-sm-offset-4 col-sm-4"
				style="background-color: white; padding: 0px">
				<form class="form-inline" style="padding: 10px" name="form"	action="ExpensesServlet" method="post">
					<p style="text-align: center">Expenses</p>
					<div class="form-group">
						<label class="control-label col-sm-6" style="text-align: left">Date:</label>
						<div class="col-sm-6"><input type="date" class="form-control" style="width: 200px"	name="date" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-6" style="text-align: left">Time:</label>
						<div class="col-sm-6"><input type="time" class="form-control" style="width: 200px" name="time" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-6" style="text-align: left">Category:</label>
						<div class="col-sm-6">
							<div class="drop-down">
								<select name="category" class="form-control"
									style="width: 200px" id="category">
									<option>Select</option>
									<option>Investment</option>
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
						<div class="col-sm-6"><input type="text" class="form-control" style="width: 200px" name="amount" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-6" style="text-align: left">Content:</label>
						<div class="col-sm-6"><input type="text" class="form-control" style="width: 200px" name="content" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-6 col-sm-6" style="text-align: left">
							<input type="submit" class="btn btn-default" id="submit" name="submit" value="save" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>