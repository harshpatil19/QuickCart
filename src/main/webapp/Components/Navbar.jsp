<%@page import="com.DAO.CategoryDAO"%>
<%@page import="com.entities.Category"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.DAO.ProductDAO"%>
<%@page import="com.entities.User"%>
<%
//to fetch the user as admin or normal and tore that object inside user1 as we have already stored Current-user in object user so we will be using user1
User user1 = (User) session.getAttribute("Current-user");

CategoryDAO cdao1 = new CategoryDAO(FactoryProvider.getFactory());
List<Category> clist1 = cdao1.getCategories();
	
%>
<nav class="navbar navbar-expand-lg navbar-light custom-bg">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">QuickCart</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Categories
					</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<% for (Category c : clist1) { %>
							<li>
								<a href="index.jsp?category=<%=c.getCategoryId() %>" class="dropdown-item">
									<%=c.getCategoryTitle()%>
								</a>
							</li>
						<% } %>
					</ul>
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#cart">
						<i class="fas fa-cart-plus" style="font-size: 20px;"></i>
						<span class="ml-0 cart-items">(0)</span>
					</a>
				</li>
				<%
					if (user1 == null) {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
				<% } else { %>
				<li class="nav-item">
					<a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp" %>">
						<%=user1.getUserName()%>
					</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>
				<% } %>
			</ul>
		</div>
	</div>
</nav>

