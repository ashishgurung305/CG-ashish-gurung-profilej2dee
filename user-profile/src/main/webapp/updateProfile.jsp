<%
	if(session.getAttribute("name") == null){
		response.sendRedirect("login.jsp");
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Delta Airlines | Update Profile</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
<link rel="stylesheet" href="path/to/bootstrap.min.css">
    <style>
          .form-container {
            max-width: 300px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input[type="text"],
        .form-group input[type="email"] {
            width: 100%; /* Make input fields full width */
            padding: 5px;
        }
    </style>
</head>
<body id="page-top">
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
			id="mainNav">
			<div class="container">
					<figure>
						<a href="login"><img class="logo-img" src="images/logo.png" alt="sing up image"></a>
					</figure>
				<button
					class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					Menu <i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="updateProfile">Update Profile</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="changePassword">Change Password</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link logout py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href=""><%=session.getAttribute("name") %></a></li>
					
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead no-pad">
		
	</header>
	
	<section class="page-section" id="contact">
		<div class="container form-modal text-center mt-5">
		<div class="title-head">
        <h2>Update Profile</h2>
        </div>
        <!-- Add more user details here as needed -->
        <div class="row justify-content-center">
            <div class="col-md-8">
                <form action="updateProfile" method="post">
                    <!-- Add Bootstrap classes to style the form -->
                    <input type="hidden" name="id" value="${sessionScope.uid}">
                    <div class="form-group row">
                        <label for="firstName" class="col-md-4 col-form-label">First Name:</label>
                        <div class="col-md-8">
                            <input type="text" id="firstName" name="firstName" class="form-control" value="${sessionScope.name}" placeholder="First Name">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="lastName" class="col-md-4 col-form-label">Last Name:</label>
                        <div class="col-md-8">
                            <input type="text" id="lastName" name="lastName" class="form-control" value="${sessionScope.l_name}" placeholder="Last Name">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="email" class="col-md-4 col-form-label">Email:</label>
                        <div class="col-md-8">
                            <input type="email" id="email" name="email" class="form-control" value="${sessionScope.email}" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="phone" class="col-md-4 col-form-label">Phone:</label>
                        <div class="col-md-8">
                            <input type="text" id="phone" name="phone" class="form-control" value="${sessionScope.ph}" placeholder="Phone Number">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="email" class="col-md-4 col-form-label">Date of Birth: </label>
                        <div class="col-md-8">
                            <input type="date" id="dob" name="dob" class="form-control" value="" placeholder="DOB">
                        </div>
                    </div>
                    <!-- Add more input fields for other user attributes with similar structure -->
                    <div class="form-group row">
                        <div class="col-md-12 text-center">
                            <button type="submit" class="btn btn-primary">Update Profile</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

	</section>
	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						2215 John Daniel Drive <br /> Clark, MO 65243
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">About Delta Airlines</h4>
					<p class="lead mb-0">
						The best flight experience by <a href="http://startbootstrap.com">Delta
							Airlines</a> ..
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your Website 2021</small>
		</div>
	</div>
	<script>
    // Get a reference to the date input element
    var dateInput = document.getElementById("dob");

    // Set the default date (e.g., today's date) as a string in the "YYYY-MM-DD" format
    var defaultDate = "${sessionScope.date}"; // Change this to your desired default date

    // Set the value of the date input field to the default date
    dateInput.value = defaultDate;
</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	
	var status = document.getElementById("status").value;
	if(status == "success"){
		swal("Profile Updated", "User's profile has been updated successfully","success");	
	}
	</script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
