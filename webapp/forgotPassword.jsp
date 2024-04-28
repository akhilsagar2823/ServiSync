<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.2.js"></script>
    <style>

        @import "https://fonts.googleapis.com/css?family=Raleway";
		page {
            padding:0;
            margin:0;
            box-sizing: border-box;
        }
        body
        {
			background: linear-gradient(84deg,  #0076E3 0%, #9A00E3 100%);
        }
        .btn1
        {
        	background: white;
            border: none;
            outline: none;
            height: 50px;
            width: 300%;
            color: black;
            border-radius: 4px;
            font-weight: bold;
            position: relative;
        }
        .btn1:hover
        {
            background: black;
            border: 1px solid white;
        	font-size: 20px;
            color: white
        }
        .form-label{
			font-size: 120%;
			font-weight: bold;
			color: #000000;
		
		}
        body
        {
		  background: linear-gradient(84deg,  #0076E3 0%, #9A00E3 100%);
          margin: 0;
          padding: 0;
          font-family: Raleway;
          text-transform: lowercase;
          font-size: 11px;
        }
        h1{ margin: 0; }
        #contact {
          -webkit-user-select: none; /* Chrome/Safari */
          -moz-user-select: none; /* Firefox */
          -ms-user-select: none; /* IE10+ */
          margin: 4em auto;
          width: 100px;
          height: 30px;
          line-height: 30px;
          background: teal;
          color: white;
          font-weight: 700;
          text-align: center;
          cursor: pointer;
          border: 1px solid white;
          position: absolute ;
          left: 158px;
          top: 92px;
        }
        #contact:active { background: #444; }


        #contactForm {
         display: none;
            border: 3px solid black;
            border-radius: 10px;
          padding: 2em;
          width: 400px;
          text-align: center;
          background: #fff;
          position: fixed;
          top:50%;
          left:50%;
          visibility : hidden;
          opacity : 0;
          transform: translate(-50%,-50%);
          -webkit-transform: translate(-50%,-50%)

        }

        input, textarea {
          margin: .8em auto;
          font-family: inherit;
          text-transform: inherit;
          font-size: inherit;

          display: block;
          width: 280px;
          padding: .4em;
        }
        textarea { height: 80px; resize: none; }

        .formBtn {
          width: 140px;
          display: inline-block;

          background: teal;
          color: #fff;
          font-weight: 100;
          font-size: 1.2em;
          border: none;
          height: 30px;
        }

        .row#blur.active
        {
            filter : blur(10px);
        }

        body {
            background-size: cover;
            font-family: "Rubik",Helvetica,Arial,sans-serif;
            font-size: 14px;
            font-weight: normal;
            line-height: 1.5;
            text-transform: none;
        }

        .forgot{
	        background-color: #fff;
            padding: 12px;
            border: 5px solid #dfdfdf;
        }

        .card-body{
            background-color: #fff;
            padding: 12px;
            border: 5px solid #dfdfdf;
        }

        .padding-bottom-3x {
            padding-bottom: 72px !important;
        }

        .card-footer{
	        background-color: #fff;
	        background-color: #fff;
            padding: 12px;
            border: 5px solid #dfdfdf;
        }

        .btn{
    	    font-size: 13px;
        }

        .form-control:focus {
            color: #495057;
            background-color: #fff;
            border-color: #76b7e9;
            outline: 0;
            box-shadow: 0 0 0 0px #28a745;
        }

        #contactForm.active
        {

            visibility : visible;
            opacity : 1;

        }

    </style>
    <script>
            function validateForm()
            {
                let a = document.forms["passwordForm"]["email"].value;
                	if (a == "" || a == null )
                    {
                        alert("email must be filled out");
                        return false;
                    }
                    else
                    {
                        alert("OTP sent successfully !!!\n"+"CLick Ok .");
                        }
            }
            $(function() {

              // contact form animations
              $('#contact').click(function() {
                $('#contactForm').fadeToggle();
              })
              $(document).mouseup(function (e) {
                var container = $("#contactForm");

                if (!container.is(e.target) // if the target of the click isn't the container...
                    && container.has(e.target).length === 0) // ... nor a descendant of the container
                {
                    container.fadeOut();
                }
              });

            });
            function toggle(){
                var blur =document.getElementById('blur');
                blur.classList.toggle('active');
                var popup =document.getElementById('contactForm');
                popup.classList.toggle('active');
            }
            $(function(){
          	  $("#nav-placeholder").load("NavBar.jsp");
          	});
      </script>

  </head>
  <body>
  <div id="nav-placeholder">

  </div>
<section class="vh-100 bg-image p-md-5" >
	<br>
     <div class="container padding-bottom-3x mt-5">
      <div class="row justify-content-center" id ="blur">
        <div class="col-lg-8 col-md-10">
          <div class="forgot">

          	<h2>Forgot your password?</h2>
          <p>Change your password in three easy steps. This will help you to secure your password!</p>
          <ol class="list-unstyled">
            <li><span class="text-primary text-medium">1. </span>Enter your email address below.</li>
            <li><span class="text-primary text-medium">2. </span>Our system will send you an OTP to your registered email address.</li>
            <li><span class="text-primary text-medium">3. </span>Use the OTP to reset your password through verify button.</li>
          </ol>

          </div>

          <form class="card mt-4" name = "passwordForm"  onsubmit="return validateForm()" action="ForgotPassword" method ="post">
            <div class="card-body">
              <div class="form-group">
                <label for="email-for-pass">Enter your email address</label>
                <input class="form-control" type="email" name = "email" id="email-for-pass" placeholder = "Enter Your Email Here" >
              </div>
            </div>
            <div class="card-footer">
            <div class="d-flex justify-content-center home mb-4">
            
              <button class="btn btn-success" type="submit">Get OTP</button>
              <div id="contact" class="btn1" onclick = "toggle()">Verify</div>
            </div>
            </div>
          </form>
        </div> 
      </div>
      <div id="contactForm">

                    <h1>Create New Password !</h1>

                    <form action="/UpdatePassword" method="post">
                      <input placeholder="OTP" name = "userOtp" type="text" required />
                      <input placeholder="New Password" name="password" id="password" type="password" />
                      <button class="formBtn" type="submit" >Submit</button>
                      <a href="#" onclick = "toggle()"><button class="formBtn">Close</button></a>

                    </form>
                  </div>
                  <br>
      <div class="d-flex justify-content-center home mb-4">
                        <a href="Home.jsp"><button type="submit" class="btn1">Home</button></a>
                  </div>
    </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    
</body>
</html>