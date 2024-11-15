<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.helper.Helper"%>
<%@page import="com.DAO.CategoryDAO"%>
<%@page import="com.entities.Category"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ProductDAO"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QuickCart - Home</title>
<%@include file="Components/Common_CSS_JS.jsp"%>
<style>
  /* Set background image for the whole page */
  body {
    background-image: url('image/index.jpg');
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
	<div class="container-fluid">
  
		<div class="row mt-3 mx-2">
			<!-- mt-3 and mt-2 provides the padding and margin from all the side to centre -->
			<!-- Inside ProductDAO we created a list of the product and we have stored it inside an object. That object we will be fetching here -->
			<%
			String cat= request.getParameter("category");
			
			ProductDAO dao = new ProductDAO(FactoryProvider.getFactory());
			List <Product> list= dao.getAllProducts();
	     if(cat !=null && cat.trim().equals("all"))
			{
				list=dao.getAllProducts();
			}else if(cat != null){
				int categoryId=Integer.parseInt(cat.trim());
				list=dao.getAllProductsById(categoryId);
			}
			
			%>
			<%
			CategoryDAO cdao = new CategoryDAO(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
			%>
			<!-- SHOW CATEGOREIS -->
			<div class="col-md-2">
				<div class="list-group mt-4">
					<a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true"> All Products </a>
					<%
					for (Category c : clist) {
					%>
					<a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
					<%
					}
					%>
				</div>
			</div>

			<!-- SHOW PRODUCTS -->
			<div class="col-md-10">
				<!-- ROW -->
				<div class="row mt-4">
					<!-- TRAVERSING PRODUCTS with for-each loop -->
					<%
					for (Product p : list) {
					%>
					<div class="col-md-4 mb-4">
						<!-- Each product card occupies 1/3rd of the row -->
						<div class="card  product-card" ><!-- PRODUCT CARD class inside CSS to modify the whole cards -->
						<div class= "container text-center">
							<img src="image/Products/<%=p.getpPhoto()%>" style="max-height: 200px ; max-width: 100%; width: auto" class="card-img-top m-2" alt="...">
						</div>
							<div class="card-body">
								<h5 class="card-title"><%=p.getpName()%></h5>
								<!-- This will get the Name of the product -->
								<p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
								<!-- This will get the DESCRIPTION of the product so that's why it is in paragraph and also helper class is called to print limited words -->
							</div>
							<div class="card-footer">
								<span class=" price-cut">MRP: &#8377; <%=p.getpPrice() %></span>
								<span class="text-secondary discount-label"><%= p.getpDiscount() %>% off</span>
								<br>
								<span class="price-label">QuickCart Price: &#8377; <%=p.getPriceAfterDiscount() %></span>
								<br>
								<button class="btn btn-outline-primary" onclick="add_to_cart(<%=p.getpId()%>,' <%=p.getpName()%>','<%=p.getpPrice()%>')">Add to Cart</button>
								
							</div>
						</div>
					</div>
					<%	}
					if (list.size() == 0){
						out.println("<h3>No item in this category</h3>");
					}
				
					%>
				</div>
			</div>
		</div>
	</div>
	
	       <%@ include file="Components/Common_Modal.jsp" %>
</body>
</html>