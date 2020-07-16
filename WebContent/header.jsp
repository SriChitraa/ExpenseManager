<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<style>
body
{
  margin: 0;
  padding: 0;
  
  font-family: "Avenir Next", "Avenir", sans-serif;
}
#header{
text-align: center;
padding:30px;
font-size: x-large; 
color: white;
margin:0px;
background-color:#073b4c;
}
#menuToggle
{
  position: relative;
  top: -60px;
  left: 50px;
  width: fit-content;
}

#menuToggle a
{
  text-decoration: none;
  color: #232323;
  
  transition: color 0.3s ease;
}

#menuToggle li:hover
{
   background-color: black;
  color: #ddd;
}


#menuToggle input
{
  display: block;
  width: 40px;
  height: 32px;
  position: absolute;
  top: -7px;
  left: -5px;
  
  cursor: pointer;
  
  opacity: 0;
  z-index: 2; 
  
  -webkit-touch-callout: none;
}


#menuToggle span
{
  display: block;
  width: 33px;
  height: 4px;
  margin-bottom: 5px;
  position: relative;  
  background: #cdcdcd;
  border-radius: 3px;
  
  z-index: 1;
  
}

#menu
{

  position: absolute;
  width: 180px;
  margin: 33px 0 0 -50px;
  padding: 30px;
  list-style-type: none;
  background: #ededed;
  transform-origin: 0% 0%;
  transform: translate(-100%, 0);  
  transition: transform 0.5s cubic-bezier(0.77,0.2,0.05,1.0);
}

#menu li
{
  padding: 10px 0;
  font-size: 15px;
}


#menuToggle input:checked ~ ul
{
  transform: none;
}


</style>
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
					<a href="expenses"><li>View Expense</li></a>
					<a href="dashboard.jsp"><li>DashBoard</li></a>
    </ul>
  </div>
</nav>
	<div class="container jumbotron" style="margin:0px;width: 100%;padding: 0px">
		<div class="row" style="background-color: white;margin: 0px">
			<h2 id="header"><strong>MONEY MANAGER</strong></h2>

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