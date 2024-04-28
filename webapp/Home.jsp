<%@page import="java.io.IOException"%>
<%@page import="dao.SendEmail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Home Page </title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.2.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />

	<script>
		$(function () {
			$("#nav-placeholder").load("NavBar.jsp");
		});
	</script>

</head>

<body>
	<%
		String emailId = (String)session.getAttribute("emailId");
	try {
		SendEmail.sendOTP("akhilprajapat28@gmail.com", "0000");
		System.out.println("Sent!!!!!!!!");
	} catch (IOException e) {
		e.printStackTrace();
	}
		if (emailId == null || emailId.trim().equals("") || emailId.isEmpty())
		{
			response.sendRedirect("login.html");
		}

	%>
	<style>
		.component1 {
			width: 100%;
			height: 100%;
			box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
			flex-direction: column;
			justify-content: flex-start;
			align-items: flex-start;
			display: inline-flex;
			position: relative;
			border-radius: 33px;
		}

		.component1:hover .overlay {
			background: linear-gradient(180deg, rgba(20, 16, 16, 0) 47%, #141010 100%);
		}

		.component1:hover .title,
		.component1:hover .subtitle {
			color: #F6F2F2;
		}

		/* img {
			width: 635px;
			height: 317px;
			border-radius: 33px;
		} */

		.overlay {
			width: 100%;
			height: 100%;
			position: absolute;
			background: linear-gradient(84deg, rgba(217, 217, 217, 0) 0%, black 100);
			border-radius: 33px;
			transition: all 0.5s ease-in-out;
		}

		.text-container {
			text-align: right;
			width: 90%;
			height: 10%;
			top: 70%;
			position: absolute;
		}

		.title {
			width: 100%;
			height: 70%;
			position: relative;
			font-size: 300%;
			font-family: Poppins;
			font-weight: 800;
			word-wrap: break-word;
			transition: color 0.3s;
		}

		.subtitle {

			position: relative;
			font-size: 150%;
			font-family: Poppins;
			font-weight: 400;
			word-wrap: break-word;
			transition: color 0.3s;
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

		.component {
			width: 100%;
			height: 100%;
			position: relative;
			box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
			border-radius: 33px;
			overflow: hidden;
		}

		.base-layer {
			width: 198px;
			height: 258px;
			left: 0px;
			top: 0px;
			position: absolute;
		}

		.gradient-layer {
			width: 198px;
			height: 258px;
			left: 0px;
			top: 0px;
			position: relative;
			border-radius: 33px;
			
		}

		.text-layer {
			width: 100%;
			top: 85%;
			position: absolute;
			text-align: center;
			color: black;
			font-size: 18px;
			font-family: Poppins;
			font-weight: 500;
			word-wrap: break-word;
			align-items: center;
		}

		.image-layer {
			width: 95%;
			justify-items: end;
			height: auto;
			max-height: 70%;
			top: 5%;
			left: 2.5%;
			position: absolute;
			align-items: center;
			transition: all 0.5s ease-in-out;
		}

		/* Hover effect */
		.component:hover .gradient-layer {
			transition: all 0.5s ease-in-out;
			background: linear-gradient(180deg, rgba(217, 217, 217, 0) 0%, black 100%);
		}

		.component:hover .text-layer {
			color: #F6F2F2;
			font-size: 19px;
		}

		.component:hover .image-layer {
			left: 0;
			top: 2.5%;
			width: 100%;
			max-height: 80%;

			top: 7px;
		}
	</style>
	<div class="container vh-100">
		<header>
			<div id="nav-placeholder" class="pb-3"></div>
		</header>
		<div class="v-100">
			<form action="Search.jsp">
				<div class="row mt-5 pt-5">
					<div class="col-sm-3 mb-4 pb-2">

						<div class="form-outline form-white">
							<input type="text" id="form3Examplea4" name="zipcode" class="form-control form-control-lg"
								placeholder="Enter Pincode"/>
						</div>

					</div>
					<div class="col-sm-5 mb-4 pb-2">

						<div class="form-outline form-white">
							<input type="text" id="form3Examplea5" name="service" class="form-control form-control-lg"
								placeholder="Search for Services" />

						</div>

					</div>
					<div class="col-sm-1 mb-4 pb-2">

						<div class="form-outline form-white">
						</div>
						<button type="submit" class="btn1"><i class="fa fa-search"></i></button>

					</div>

				</div>
			</form>
		</div>

		<div class="row">

			<div class="col-sm-6">
				<div class="component1">
					<img src="resources/plumber.png" style="width: 100%; height: 100%;" />
					<div class="overlay"></div>
					<div class="text-container">
						<div class="subtitle">Search for</div>
						<div class="title">Plumber</div>
					</div>
				</div>
			</div>

			<div class="col-sm-6">
				<div class="component1">
					<img src="resources/electrician.png" style="width: 100%; height: 100%;"/>
					<div class="overlay"></div>
					<div class="text-container">
						<div class="subtitle">Search for</div>
						<div class="title">Electrician</div>
					</div>
				</div>
			</div>

		</div>

		<div class="row my-5">
			<div class="col-sm-2">
				<div class="component">
					<div class="base-layer" style="background: #DCE8FF;"></div>
					<div class="gradient-layer"></div>
					<div class="text-layer">Conditonar Repair</div>
					<img class="image-layer" src="resources/ac.png" />
				</div>
			</div>
			<div class="col-sm-2">
				<div class="component">
					<div class="base-layer" style="background: #D4F4FF;"></div>
					<div class="gradient-layer"></div>
					<div class="text-layer">Mechanic</div>
					<img class="image-layer" src="resources/mechenic1.png" />
				</div>
			</div>
			<div class="col-sm-2">
				<div class="component">
					<div class="base-layer" style="background: #89DAED"></div>
					<div class="gradient-layer"></div>
					<div class="text-layer">Carpenter</div>
					<img class="image-layer" src="resources/carpenter.png" />
				</div>
			</div>
			<div class="col-sm-2">
				<div class="component">
					<div class="base-layer" style="background: #DCE8FF"></div>
					<div class="gradient-layer"></div>
					<div class="text-layer">Painter</div>
					<img class="image-layer" src="resources/painter.png" />
				</div>
			</div>
			<div class="col-sm-2">
				<div class="component">
					<div class="base-layer" style="background: #D2EBE8"></div>
					<div class="gradient-layer"></div>
					<div class="text-layer">Builder</div>
					<img class="image-layer" src="resources/builder.png" />
				</div>
			</div>
			<div class="col-sm-2">
				<div class="component">
					<div class="base-layer" style="background: #EDF7FF"></div>
					<div class="gradient-layer"></div>
					<div class="text-layer">Pest Control</div>
					<img class="image-layer" src="resources/pc.png" />
				</div>
			</div>

		</div>

		<div class="row mb-5">
			<div class="col-sm-2">
				<div class="component">
					<div class="base-layer" style="background: #C7DBE4"></div>
					<div class="gradient-layer"></div>
					<div class="text-layer">Scrap Buyers</div>
					<img class="image-layer" src="resources/sb.png" />
				</div>
			</div>
			<div class="col-sm-2">
				<div class="component">
					<div class="base-layer" style="background: #CEE7FB"></div>
					<div class="gradient-layer"></div>
					<div class="text-layer">Fabricator</div>
					<img class="image-layer" src="resources/fabricator.png" />
				</div>
			</div>
			<div class="col-sm-2">
				<div class="component">
					<div class="base-layer" style="background:#F6F4F5 "></div>
					<div class="gradient-layer"></div>
					<p class="text-layer">House Keeping</p>
					<img class="image-layer" src="resources/hk.png" />
				</div>
			</div>
			<div class="col-sm-2">
				<div class="component">
					<div class="base-layer" style="background: #E9EDF8"></div>
					<div class="gradient-layer"></div>
					<div class="text-layer">Nursing Survices</div>
					<img class="image-layer" src="resources/ns.png" />
				</div>
			</div>
			<div class="col-sm-2">
				<div class="component">
					<div class="base-layer" style="background:#96D9C8 "></div>
					<div class="gradient-layer"></div>
					<div class="text-layer">Transporter</div>
					<img class="image-layer" src="resources/transporter.png" />
				</div>
			</div>
			<div class="col-sm-2">
				<div class="component">
					<div class="base-layer" style="background: #E7F6FE"></div>
					<div class="gradient-layer"></div>
					<div class="text-layer">Security Guard</div>
					<img class="image-layer" src="resources/sg.png" />
				</div>
			</div>

		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>

</body>

</html>