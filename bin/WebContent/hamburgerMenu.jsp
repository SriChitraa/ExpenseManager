<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style>
body
{
  margin: 0;
  padding: 0;
  background: #232323;
  color: #cdcdcd;
  font-family: "Avenir Next", "Avenir", sans-serif;
}

#menuToggle
{
  display: block;
  position: relative;
  top: 50px;
  left: 50px;
  
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
  width: 300px;
  margin: -100px 0 0 -50px;
  padding: 50px;
  padding-top: 125px;
  list-style-type: none;
  background: #ededed;
  transform-origin: 0% 0%;
  transform: translate(-100%, 0);  
  transition: transform 0.5s cubic-bezier(0.77,0.2,0.05,1.0);
}

#menu li
{
  padding: 10px 0;
  font-size: 22px;
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
      <a href="expenses"><li>View  Expense</li></a>
      <a href="dashboard.jsp"><li>DashBoard</li></a>
      
    </ul>
  </div>
</nav>
</body>
</html>