<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User - Quickcart</title>
<%@include file="Components/Common_CSS_JS.jsp"%>
<style>
  /* Set background image for the whole page */
  body {
    background-image: url('image/register.jpg');
    background-size:  cover;
    background-position: center center;
    background-attachment: fixed;
    margin: 0;
    padding: 0;
  }

  .container-fluid {
    background-color: rgba(255, 255, 255, 0.5); /* Optional: Light overlay for better readability */
    border-radius: 10px;
    padding: 20px;
  }
</style>
</head>
<body>
	<%@include file="Components/Navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header custom-bg text-black">
						<h3>Sign Up</h3>
					</div>
					<div class="card-body">
					<!-- including message bootstrap to show any alerts like success/failure -->
					<%@include file="Components/Message.jsp"%>
						<form action="RegisterServlet" method="post">
							<div class="mb-3">
								<label for="name" class="form-label">User Name</label>
								<input name="user_name" type="text" class="form-control" id="name" placeholder="Enter your name" required>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email Address</label>
								<input name="user_email" type="email" class="form-control" id="email" placeholder="Enter your email" required>
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label>
								<input name="user_password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
							</div>
							<div class="mb-3">
								<label for="phone" class="form-label">Phone Number</label>
								<input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter your phone number" required>
							</div>
							<div class="mb-3">
								<label for="address" class="form-label">Address</label>
								<textarea name="user_address" id="address" class="form-control" placeholder="Enter your address" rows="4" required></textarea>
							</div>
							<!-- Text for login link -->
							<div class="mb-3 text-center">
								<p>Already have an account? <a href="login.jsp">Login here</a></p>
							</div>
							<!-- Submit and Reset buttons -->
							<div class="container text-center">
								<button type="submit" class="btn btn-success">Register</button>
								<button type="reset" class="btn btn-secondary">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
