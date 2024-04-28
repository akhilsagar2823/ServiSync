<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<style type="text/css">
		.navbar-light .navbar-nav .nav-link {
 		 color: black;
		}
	</style>
	<title>Navbar</title>
	
</head>
<body>
	<script>
		function logout(){
			$("#nav-placeholder").load("logout.jsp");
		}
	</script>
	<header>
		<nav class="navbar navbar-expand-lg fixed-top bg-black navbar-dark">
		    <a class="navbar-brand" style="padding-left:30px" href="Home.jsp">
		      <img
		        id=""
		        src="resources/Logo.png"
		        alt="ServiSync Logo"
		        draggable="false"
		        height="70"
		    	/>
		    </a>
		    <button
		      class="navbar-toggler"
		      type="button"
		      data-mdb-toggle="collapse"
		      data-mdb-target="#navbarSupportedContent"
		      aria-controls="navbarSupportedContent"
		      aria-expanded="false"
		      aria-label="Toggle navigation"
		    >
			<i class="fa fa-bars" aria-hidden="true"></i>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav ms-auto align-items-center">
		        <li class="nav-item">
		          <a class="nav-link mx-2" href="ProviderForm.html"><i class="fa-solid fa-id-card-clip"></i> Become a Provider</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link mx-2" href="contactUs.html"><i class="fa-solid fa-rectangle-ad"></i> Advertise</a>
		        </li>
		        <%
					String firstName = (String)session.getAttribute("firstName");
					if (firstName != null && !firstName.trim().equals(""))
					{%>
				<li class="nav-item">
		          <a class="nav-link mx-2" ><i class="fa-solid fa-user"></i> Hi, <%=firstName%></a>
		        </li>
		        <li class="nav-item">
		          		<a class="nav-link mx-2" onclick="logout()" id="logout"><i class="fa-solid fa-right-from-bracket"></i></a>
		        </li>
					<%}
				%>
		      </ul>
		    </div>
		</nav>
	</header>
</body>
</html>