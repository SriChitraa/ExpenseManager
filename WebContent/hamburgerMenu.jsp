<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style>
.dropdown-menu li:hover .sub-menu {
  visibility: visible;
}

.dropdown:hover .dropdown-menu {
  display: block;
}

.nav-tabs .dropdown-menu,
.nav-pills .dropdown-menu,
.navbar .dropdown-menu {
  margin-top: 0;
}
}
</style>
<script>
function myFunction() {
  var x = document.getElementById("myLinks");
  if (x.style.display === "block") {
    x.style.display = "none";
  } else {
    x.style.display = "block";
  }
}
</script>
</head>
<body>
	<div class="container">
		<div class="hamburger">
			<span class="icon"></span> <span class="icon"></span> <span
				class="icon"></span>
			<div class="nav-collapse">
				<ul class="dropdown-menu">
					<li><a href="#">2-level Dropdown <i
							class="icon-arrow-right"></i></a>
						<ul class="dropdown-menu sub-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="nav-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul>
						</ul>
			</div>
		</div>
		</div>
</body>
</html>