<!DOCTYPE html>
<%@page import="com.jsp.dto.UserDto"%>
<%@page import="com.mysql.cj.jdbc.Blob"%>
<%@page import="com.jsp.dao.UserDao"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
}

.navbar {
	background-color: #22222;;
	padding: 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	color: white;
}

.navbar-logo {
	display: flex;
	align-items: center;
}

.car-icon {
	width: 40px;
	height: 40px;
	margin-right: 10px;
}

.app-logo {
	height: 50px;
	/* width: 70px; */
	position: absolute;
	top: 12px;
}
/*
        @keyframes spin {
            0% { transform: rotate(0deg); }
            20%{ transform: rotate(180deg)}
            40%{ transform: rotate(360deg); }
            60%{ transform: rotate(0deg); }
            80%{ transform: rotate(-180deg); }
            100% { transform: rotate(-360deg); }
        } */
.navbar-title {
	font-size: 3.0em;
	position: absolute;
	left: 38%;
	font-family: monospace;
}

.login-register-btn {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	position: absolute;
	right: 10%;
}
 
.logout-btn {
	padding: 10px 20px;
	background-color: #228B22;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	position: absolute;
	right: 1%;
}

#car-ani {
	height: 90%;
	width: 90%;
	background-color: white;
}

#curr-usr {
	position: absolute;
	right: 10%;
	
	/* border: 2px solid red; */
}
/* h4{
	margin: 100px 0;
} */

#prof-img{
	height: 50px;
	width: 50px;
	border-radius: 50%;
	position:absolute;
	right: 50%;
	top: -20px;
}
.name{
	color: white;
	position: absolute;
	right: 10%;
	top: 6%;
}

</style>

</head>
<body>

	<%
	String flag = (String) request.getAttribute("username");
	UserDto dto = new UserDto();
	Blob img;

	HttpSession httpSession = request.getSession();
	String usr = (String) httpSession.getAttribute("SetUsername");
	%>
	<%
	if (flag != null) {
	%>
	<%
	img = dto.getPic();
	%>
	<%=img%>

	<%
	}
	%>

	<div class="navbar">
		<div class="navbar-logo">
			<div class="car-icon">
				<img alt="CAR_IMG" src="images/car-logo.png" class="app-logo">
			</div>
			<div class="navbar-title">CAR RENTAL APP</div>
			
			<div id="curr-usr">
				<img alt="current_User" src="displayUsr?username=<%= usr %>" id="prof-img">
				
			</div>
			<div class="name"><h4><%= usr %></h4></div>
		</div>
		<a href="logoutController" class="logout-btn" onclick="logout()">Logout</a>
	</div>

	<script>
		function logout() {
			// Add your logout logic here
			alert("Logout clicked! Add your logout logic.");
		}
	</script>

</body>
</html>
