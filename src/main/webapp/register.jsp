<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="Components/Common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="Components/Navbar.jsp"%>
	<!-- this gives the proper margin in the middle of the page. -->
	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col-md-6 offset-md-3">
				<!-- To provide all the input inside card(box) -->
				<div class="card">
				<%@include file="Components/Message.jsp"%>
					<div class="card-body px-5">
						<!-- by d-block we have taken that image to the center -->
						<img alt="" class="img-fluid  d-block mx-auto "
							style="max-width: 400px" src=" image/User.png">
						<h3 class="text-center my-3">Sign up here</h3>
						<form action="RegisterServlet"  method="post">
							<div class="mb-3">
								<label for="name" class="form-label">User Name</label> <input name="user_name"
									type="text" class="form-control" id="name"
									placeholder="Enter here" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">User Email</label> 
								<!-- we are giving name because we can fetch this data by its name in its respected servlets -->
								<input name="user_email"
									type="email" class="form-control" id="email"
									placeholder="Enter here" aria-describedby="emailHelp">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input name="user_password" type="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="mb-3">
								<!-- Here input will be number so as to register the phone number -->
								<label for="phone" class="form-label">User Phone</label> <input name="user_phone"
									type="number" class="form-control" id="phone"
									placeholder="Enter here" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="name" class="form-label">User Address</label>
								<!-- here instead of input we have given textarea so as to enter large characters for the address -->
								<textarea name="user_address" style="height: 200px;" class="form-control"
									placeholder="Enter your address"></textarea>
							</div>
							<div class="container text-center">
								<!-- this will take buttons to the center -->
								<button class="btn btn-outline-success">Register</button>
								<!-- btn-OUTLINE-success... this will give the color of danger and success only when we will hover on it -->
								<button class="btn btn-outline-warning">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>