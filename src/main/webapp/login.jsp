<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login- Quickcart</title>
<%@include file="Components/Common_CSS_JS.jsp"%>
<style>
  /* Set background image for the whole page */
  body {
    background-image: url('image/login.jpeg');
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
						<h3>Login here</h3>
					</div>
					<div class="card-body">
					<!-- including message bootstrap to show the lagin failed in message only instead of opening servlet -->
					<%@include file="Components/Message.jsp" %>
					<!-- telling by action to  go to login page  -->
						<form action="LoginServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> 
									<!--  giving name=email so as to fetch in servlet -->
									<input name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<!--  giving name=password so as to fetch in servlet -->
								<input name="password" type="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<!-- Href will direct to the register page -->
							<a href="register.jsp">Don't have an account? Register</a>
							<!-- taking button in class so as we can align it to center -->
							<div class="container text-center">
								<button type="submit" class="btn btn-primary border-0 custom-bg">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>