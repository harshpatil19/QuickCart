package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.CategoryDAO;
import com.DAO.ProductDAO;
import com.entities.Category;
import com.entities.Product;
import com.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated c onstructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		//Here in One single servlet we will be doing 2 backend process of ADD CATEGORY and ADD PRODUCT
		//In ADD CATEGORY we have mention in input name="Operation" so we will be fetching operation here so we will be doing that with if-else block
		//if operation under MODAL is add category then it will fetch ADD CATEGORY Object orelse it will fetch ADD PRODUCT Details.
		
		String op=request.getParameter("operation");
		if(op.trim().equals("addcategory"))
		{
			//FETCHING DATA FROM MODAL
			String title = request.getParameter("catTitle");
			String description = request.getParameter("catDescription");
			
			Category category=new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(description);
			
			//Now we will save the value to the Database using hibernate in DAO class we can also create JDBC in dao to access or save in DB its our choice
			//call the constructor 
			CategoryDAO categoryDao= new CategoryDAO(FactoryProvider.getFactory());
			int  catId= categoryDao.saveCategory(category);
			//out.println("Category Saved Successfully");
			HttpSession httpsession=request.getSession();
			httpsession.setAttribute("message", "Category added successfully");
			response.sendRedirect("admin.jsp");
			return;
			
		}else if(op.trim().equals("addproduct"))
		{
			
			String  pName=request.getParameter("pName");
			String  pDescription=request.getParameter("pDesc");
			int  pPrice= Integer.parseInt( request.getParameter("pPrice"));
			int  pDiscount= Integer.parseInt( request.getParameter("pDiscount"));
			int  pQuantity= Integer.parseInt( request.getParameter("pQuantity"));
			int  catId= Integer.parseInt( request.getParameter("catId"));
			Part part = request.getPart("pPic");
		
			Product p = new Product();
			p.setpName(pName);
			p.setpDesc(pDescription);
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuantity(pQuantity);
			//We dont have name of photo so we will take that FILE NAME at run time
			p.setpPhoto(part.getSubmittedFileName());
			
			//Get category by ID
			CategoryDAO cdao= new CategoryDAO(FactoryProvider.getFactory());
			Category category= cdao.getCategoryById(catId);
		
			p.setCategory(category);
			
			//SAVE PRODUCT in Database so we will require NEW PRODUCT DAO
			ProductDAO pdao= new ProductDAO(FactoryProvider.getFactory());
		    pdao.saveProduct(p);
			
			//PIC UPLOAD
			//Here we will upload the category or product photo 
			String path = request.getRealPath("image")+File.separator+"Products"+File.separator+part.getSubmittedFileName();
			System.out.println(path);
			//Uploading Code on the path to store image
			FileOutputStream fos= new FileOutputStream(path);
			InputStream is= part.getInputStream();
			//Reading Data
			byte [ ] data= new byte [is.available()];
			is.read(data);
			//Write data
			fos.write(data);
			fos.close();
			
			
		out.println("Product Saved Successfully");
			
			// make session and fetch message object  to show message In NOTIFICATION POP-UP!
			HttpSession httpsession=request.getSession();
			httpsession.setAttribute("message", "Product added successfully");
			response.sendRedirect("admin.jsp");
			return;
		}
		


	}

}
