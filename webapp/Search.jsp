<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*, db.JdbcConnector"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Search Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.8.2.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
<script type="text/javascript">
	$(function() {
		$("#nav-placeholder").load("NavBar.jsp");
	});
</script>
<style type="text/css">
.component1 {
	display: inline-flex;
	flex-direction: column;
	align-items: flex-start;
	gap: 10px;
}

.name {
	position: absolute;
	right: 79px;
	top: 42px;
	color: #000;
	font-family: Poppins;
	font-size: 34px;
	font-style: normal;
	font-weight: 600;
	line-height: normal;
}
.btn1 {
	border: 0.5% solid black;
	outline: none;
	font-size: x-large;
	height: 100%;
	width: 100%;
	color: black;
	border-radius: 4px;
	font-weight: bold;
		}
.btn{
	height: 100%;
	width: 100%;
	text-align: center;
	 color: #F6F2F2; 
	 font-size: 20px; 
	 font-family: Poppins; 
	 font-weight: 700; 
	 word-wrap: break-word
}		
.btn:hover
        {
            background: white;
            border: 1px solid;
        	font-size: 20px;
            color: black
        }
.rating {
	display: flex;
	align-items: flex-start;
	gap: 5px;
	position: absolute;
	right: 137px;
	top: 101px;
}

.star {
	width: 30px;
	height: 30px;
	fill: #FAFF00;
}

.address {
	position: absolute;
	right: 66px;
	top: 141px;
	color: #727272;
	font-family: Poppins;
	font-size: 17px;
	font-style: normal;
	font-weight: 500;
	line-height: normal;
}

.commentIcon {
	width: 21px;
	height: 21px;
	position: absolute;
	right: 285px;
	bottom: 124px;
}

.commentText {
	position: absolute;
	right: 135px;
	bottom: 122px;
	color: #000;
	font-family: Poppins;
	font-size: 17px;
	font-style: normal;
	font-weight: 500;
	line-height: normal;
}

.reviewCount {
	position: absolute;
	right: 15px;
	bottom: 122px;
	color: #727272;
	font-family: Poppins;
	font-size: 17px;
	font-style: normal;
	font-weight: 500;
	line-height: normal;
}

.enquireButton {
	position: absolute;
	right: 176px;
	bottom: 53px;
	border-radius: 15px;
	background: linear-gradient(249deg, #00FFF0 -19.88%, #FF00E6 109.54%);
	display: flex;
	width: 131px;
	height: 49px;
	padding: 10px;
	justify-content: center;
	align-items: center;
	gap: 10px;
}

.wpButton {
	display: flex;
	height: 49px;
	padding: 0px 10px;
	align-items: center;
	gap: 7px;
	position: absolute;
	right: 29px;
	bottom: 53px;
	border-radius: 15px;
	background: #00BB07;
}
</style>
</head>
<body>
	<%
		String emailId = (String)session.getAttribute("emailId");
		if (emailId == null || emailId.trim().equals("") || emailId.isEmpty())
		{
			response.sendRedirect("login.html");
		}

	%>
	<div class="container vh-100">
		<header>
			<div id="nav-placeholder" class="pb-3"></div>
		</header>
		<%
			String zipcode = request.getParameter("zipcode");
			String service = request.getParameter("service");
		%>
		<div class="v-100">
			<form action="Search.jsp">
				<div class="row mt-5 pt-5">
					<div class="col-sm-3 mb-4 pb-2">

						<div class="form-outline form-white">
							<input type="text" id="form3Examplea4" name="zipcode" value = "<%=zipcode%>"
								class="form-control form-control-lg" placeholder="Enter Pincode" />
						</div>

					</div>
					<div class="col-sm-5 mb-4 pb-2">

						<div class="form-outline form-white">
							<input type="text" id="form3Examplea5" name="service"
								class="form-control form-control-lg" value= "<%=service%>"
								placeholder = "Search for Services" />
						</div>

					</div>
					<div class="col-sm-1 mb-4 pb-2">

						<div class="form-outline form-white"></div>
						<button type="submit" class="btn1">
							<i class="fa fa-search"></i>
						</button>

					</div>

				</div>
			</form>
		</div>
		
		<%
		 try
        {
            Connection con = JdbcConnector.getConnection();
            System.out.println("Connected to the database");

            
            String query =  "SELECT Name, address_l1, city, ZipCode, phone, service, rating, no_of_rating FROM Provider_Info pi JOIN Provider p"
            		+ " ON pi.provider_id = p.provider_id WHERE ZipCode LIKE '%"+zipcode+"%' AND service LIKE '%"+service+"%';";
            System.out.println("query " + query);

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next())
            {      

		%>
		<div class="component1 m-3"
			style="width: 30%; marginleft: 10%, height: 100%; background: #F6F2F2; border-radius: 40px; padding-left: 4%; padding-top: 2%; padding-bottom: 2%;">
			<div
				style="width: 90%; height: 5%; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: inline-flex">


				<div
					style="color: black; font-size: 30px; font-family: Poppins; font-weight: 600; word-wrap: break-word"><%=rs.getString(1)%></div>
				<div
					style="justify-content: flex-start; align-items: flex-start; gap: 5px; display: inline-flex"></div>
				<div
					style="color: #727272; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word"><i class="fa fa-map-marker"></i> <%=rs.getString(2)%>, <%=rs.getString(3)%></div>
				<div
					style="color: #727272; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word"><%=rs.getString(4)%></div>
				
				<div
					style="color: black; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word"><%= rs.getString(6) %>
					Service</div>
				<div
					style="color: #727272; font-size: 17px; font-family: Poppins; font-weight: 500; word-wrap: break-word">
					Rating: <%=rs.getString(7)%><i class="fa fa-star"></i>, <%= rs.getString(8) %> reviews</div>

				<div
					style="width: 50%; height: 40px; background: linear-gradient(249deg, #00FFF0 0%, #FF00E6 100%); border-radius: 15px; justify-content: center; align-items: center; display: inline-flex">
					<button class="btn"> <%= rs.getString(5)%> <i class="fas fa-phone"></i></button>
				</div>
				<div
					style="height: 9%; background: #00BB07; border-radius: 15px; justify-content: flex-start; align-items: center; gap: 7px; display: inline-flex">
					
					<a class="btn" href="https://wa.me/91<%= rs.getString(5)%>" target="_blank">Chat <i class='fa fa-comments' ></i></a>
				</div>
			</div>
		</div>
		<%
            }
            rs.close();
            st.close();

        } catch (SQLException e)
        {
            e.printStackTrace();
        }
		%>
	</div>

</body>
</html>