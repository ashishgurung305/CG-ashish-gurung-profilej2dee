<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Delta Airlines | Sign Up</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<nav class="navbar">
		<img src="images/logo.png" alt="Logo" class="logo">
	</nav>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<div class="main signup-bg">
		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signup-image">
						<a href="login.jsp" class="signup-image-link">Already a
							member?</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign up</h2>
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="first_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="first_name" id="first_name"
									placeholder="First Name" required /> <span
									id="first_name_error" class="error"></span>
							</div>
							<div class="form-group">
								<label for="last_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="last_name" id="last_name"
									placeholder="Last Name" required /> <span id="last_name_error"
									class="error"></span>

							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email"
									required />
							</div>
							<span id="email_error" class="error"
															style="color: red; height: 20px;"> <%
							 String emailTakenError = (String) request.getAttribute("email_taken_error");
							 %> <%=emailTakenError != null ? emailTakenError : ""%>
							</span>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" required /> <span id="password_error"
									class="error"></span>
							</div>

							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-phone"></i></label> <input
									type="text" name="contact" id="contact"
									placeholder="Phone number" required /> <span
									id="contact_error" class="error"></span>
							</div>
							<span id="email_error" class="error"
															style="color: red; height: 20px;"> <%
							 String phoneTakenError = (String) request.getAttribute("phone_taken_error");
							 %> <%=phoneTakenError != null ?phoneTakenError : ""%>
							</span>
							<div class="form-group">
								<label for="dob"><i class="zmdi zmdi-calendar"></i></label> <input
									type="date" name="dob" id="dob" placeholder="Date of Birth"
									required /> <span id="dob_error" class="error"></span>
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" required /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>

					</div>
				</div>
			</div>
		</section>

	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Congrats", "Account has been created successfully", "success");
		}

		function validateForm() {
			var fields = [ "first_name", "last_name", "email", "password",
					"contact", "dob" ];
			var isValid = true;

			fields.forEach(function(field) {
				var input = document.getElementById(field);
				var error = document.getElementById(field + "_error");

				error.innerHTML = input.value.trim() === "" ? field.replace(
						'_', ' ')
						+ " is required" : "";
				isValid = isValid && input.value.trim() !== "";
			});

			return isValid;
		}
	</script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>