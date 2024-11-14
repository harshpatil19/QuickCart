<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.DAO.CategoryDAO"%>
<%@page import="com.entities.User"%>
<%
//here we will be using current-user object we created in LoginServlet inside a session and in that session object we created as "user" we will use that object for authentication by if-else loop
User user = (User) session.getAttribute("Current-user");
if (user == null) {
	session.setAttribute("message", "You have not Logged-In!!! Please Login First");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "Only Admin Can login to this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@include file="Components/admin.jsp"%>
</head>
<body>
	<!-- We have included navbar inside this panel also that meanse header -->
	<%@include file="Components/Navbar.jsp"%>
	<div class="container  admin">
		<div class="container-fluid mt-3">
			<%@include file="Components/Message.jsp"%>
		</div>
		<!--  admin class for .admin CSS -->
		<!-- FIRST ROW -->
		<div class="row mt-3">
			<!-- When ever we create any class a ROW is created and inside that row 12 GRIDS are also created  so we divided those  into 3 columns -->
			<!-- FIRST ROW-FIRST COLUMN -->
			<div class="col-md-4">
				<!-- FIRST BOX -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid"
								src="image/Users.png" alt="user_icon">
						</div>
						<h1 class="text-uppercase  text-muted">Users</h1>
						<!-- To uppercase the text use class -->
					</div>
				</div>
			</div>

			<!-- FIRST ROW-SECOND COLUMN -->
			<div class="col-md-4">
				<!-- SECOND BOX -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid"
								src="image/List.png" alt="user_icon">
						</div>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>

			<!-- FIRST ROW-THIRD COLUMN -->
			<div class="col-md-4">
				<!-- THIRD BOX -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid"
								src="image/Product.png" alt="user_icon">
						</div>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>

		<!-- SECOND ROW -->
		<div class="row mt-3">
			<!-- SECOND ROW -FIRST COLUMN-->
			<div class="col-md-6">
				<!-- md= mobile devices means it will open on mobile also -->
				<!-- FIRST BOX -->
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid"
								src="image/Add.png" alt="user_icon">
						</div>
						<p class="mt-2">Click here to Add new Category</p>
						<h1 class="text-uppercase text-muted">Add Products</h1>
					</div>
				</div>
			</div>

			<!-- SECOND ROW -SECOND COLUMN-->
			<div class="col-md-6">
				<!-- md= mobile devices means it will open on mobile also -->
				<!-- SECOND BOX -->
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid"
								src="image/calculator.png" alt="user_icon">
						</div>
						<p class="mt-2">Click here to Add new Category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ADD CATEGORY MODAL -->
	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<!-- *custom-bg text-white* this indicates that toggle header will be the same as PAGE HEADER-->
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
						<!--  we have given action to this form so it will go to the servlet to perform BACKEND -->
						<input type="hidden" name="operation" value="addcategory">
						<!-- HIDDEN FORM FIELD -->
						<div class="form-group mb-3">
							Title <input type="text" class="form-control" name="catTitle"
								required />
						</div>

						<div class="form-group mb-3">
							Description
							<textarea style="height: 300px;" class="form-control"
								name="catDescription" required> </textarea>
						</div>
						<div class="container text-center">
							<!-- Container just to align button in the center -->
							<button class="btn btn-success">Add Category</button>
							<button type="button" class="btn btn-primary"
								data-bs-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- ADD PRODUCT  MODAL -->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<!-- modal-lg to make modal LARGE than its regur -->
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- ACTION to let this form to perform on Servlet for backend -->
					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addproduct" />
						<!-- PRODUCT TITLE  ENTITY -->
						<div class="form-group mb-3">
							Title <input type="text" class="form-control" name="pName"
								required />
						</div>
						<!-- PRODUCT DESCRIPTION ENTITY -->
						<div class="form-group mb-3">
							Description
							<textarea style="height: 150px;" class="form-control"
								name="pDesc"></textarea>
						</div>
						<!-- PRODUCT PRICE  ENTITY -->
						<div class="form-group mb-3">
							Price <input type="number" class="form-control" name="pPrice">
						</div>
						<!-- PRODUCT DISCOUNT ENTITY -->
						<div class="form-group mb-3">
							Discount <input type="number" class="form-control"
								name="pDiscount">
						</div>
						<!-- PRODUCT QUANTITY ENTITY -->
						<div class="form-group mb-3">
							Quantity <input type="number" class="form-control"
								name="pQuantity">
						</div>

						<%
						CategoryDAO cdao = new CategoryDAO(FactoryProvider.getFactory());
						List<Category> list = cdao.getCategories();
						%>
						<!-- PRODUCT CATEGOR ENTITY -->
						<!-- This is relationship from category class so we will fetch from that -->
						<div class="form-group mb-3">
							Category <select name="catId" id="" class="form-control">
								<%
								for (Category c : list) {
								%>
								<!-- WE will need to have dynamic value. Means the value we will enter  in category table it should also get entered here-->
								<!-- OPTION tag will create dropdown -->
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
								<%
								}
								%>
							</select>
						</div>
						<!-- PRODUCT IMAGE ENTITY -->
						<!-- To upload image we have to provide CHOOSE FILE BUTTON option so we have taken  type=file -->
						<div class="form-group mb-3">
							<label for="pPic">Product Image</label> <br> <input
								type="file" name="pPic" required />
						</div>

						<!-- SUBMIT BUTTON -->
						<div class="container text-center">
							<button class="btn btn-success">Add product</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="Components/Common_Modal.jsp"%>
</body>
</html>