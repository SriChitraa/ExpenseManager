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
<link href="css/login.css" type="text/css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>

<%
if(request.getAttribute("username")!=null){
request.setAttribute("username",null);
}
%>
	<div class="container jumbotron" style="background-color: lightgrey">
		<div class="row" style="background-color: lightgrey">
			<div class="col-sm-offset-4 col-sm-4"style="background-color: white; padding: 0px">
				<div class="box"><h4 style="text-align: center; font-size: x-large; color: white"><strong>Money Manager</strong></h4><br />
				</div>
				<form class="form-inline" style="padding: 10px" name="form" action="login" method="post">
					<input type="text" name="username" id="uname" placeholder="User Name" required /> 
					<input type="password" name="password" id="password" placeholder="Password" required />
					<p style="text-align: right; font-size: x-small; color: lightgray">	Forgot <a href="#" style="color: gray; text-align: right"><strong>Password?</strong></a></p><br />
				    <input type="submit" class="btn btn-default" value="LOG IN" /> 
					<label class="control-label">Don't	have an account?<a href="#" style="color: gray"><strong>Sign up</strong></a></label>
				</form>
			</div>
		</div>
	</div>
</body>
</html>