
<%
User user = (User) session.getAttribute("Current-user");
if (user == null) {
	session.setAttribute("message", "You have not Logged-In!!! Please Login First to access Checkout");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Checkout</title>
<%@include file="Components/Common_CSS_JS.jsp"%>
<style>

  /* Set background image for the whole page */
  body {
    background-image: url('image/Checkout.jpg');
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
		<div class="row mt-5">
			<!-- TOP MARGIN 5 -->
			<div class="col-md-6">
				<!-- CARD -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your Selected items</h3>
						<div class="cart-body">
							<!-- INCLUDING CART BODY FROM JAVASCRIPT -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<!-- FORM DETAILS -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">User Details</h3>
						<form action="#">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									value="<%=user.getUserEmail()%>" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="name">Name</label> <input
									value="<%=user.getUserName()%>" type="text"
									class="form-control" id="name" aria-describedby="emailHelp"
									placeholder="Enter name">
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Address 1</label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									placeholder="Enter your address" rows="3"></textarea>
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Address 2</label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									placeholder="Enter your address" rows="3"></textarea>
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input type="text"
										class="form-control" id="inputCity">
								</div>
								<div class="form-group ">
									<label for="inputState" >State</label> <select id="inputState"
										class="form-control">
										<option value="">Select state</option>
										<option value="AN">Andaman and Nicobar Islands</option>
										<option value="AP">Andhra Pradesh</option>
										<option value="AR">Arunachal Pradesh</option>
										<option value="AS">Assam</option>
										<option value="BR">Bihar</option>
										<option value="CH">Chandigarh</option>
										<option value="CT">Chhattisgarh</option>
										<option value="DN">Dadra and Nagar Haveli</option>
										<option value="DD">Daman and Diu</option>
										<option value="DL">Delhi</option>
										<option value="GA">Goa</option>
										<option value="GJ">Gujarat</option>
										<option value="HR">Haryana</option>
										<option value="HP">Himachal Pradesh</option>
										<option value="JK">Jammu and Kashmir</option>
										<option value="JH">Jharkhand</option>
										<option value="KA">Karnataka</option>
										<option value="KL">Kerala</option>
										<option value="LA">Ladakh</option>
										<option value="LD">Lakshadweep</option>
										<option value="MP">Madhya Pradesh</option>
										<option value="MH">Maharashtra</option>
										<option value="MN">Manipur</option>
										<option value="ML">Meghalaya</option>
										<option value="MZ">Mizoram</option>
										<option value="NL">Nagaland</option>
										<option value="OR">Odisha</option>
										<option value="PY">Puducherry</option>
										<option value="PB">Punjab</option>
										<option value="RJ">Rajasthan</option>
										<option value="SK">Sikkim</option>
										<option value="TN">Tamil Nadu</option>
										<option value="TG">Telangana</option>
										<option value="TR">Tripura</option>
										<option value="UP">Uttar Pradesh</option>
										<option value="UT">Uttarakhand</option>
										<option value="WB">West Bengal</option>
									</select>
									<div class="form-group ">
										<label for="inputZip">Zip</label> <input type="text"
											class="form-control" id="inputZip">
									</div>

								</div>
							</div>
							<div class="container text-center mt-3">
								<button class="btn btn-primary">Order Now</button>
								<button class="btn btn-success">Continue Shopping</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="Components/Common_Modal.jsp"%>
</body>

</html>