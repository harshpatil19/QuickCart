package com.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Product;

public class ProductDAO {
	private SessionFactory factory;

	public ProductDAO(SessionFactory factory) {
		this.factory = factory;
	}
	
	public boolean saveProduct (Product product) {
		boolean f= false;
		try {
			
			Session session=this.factory.openSession();
			Transaction tx=session.beginTransaction();
			
			session.save(product);
			tx.commit();
			session.close();
			f=true;
			
		}catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
	}
	
	public List <Product> getAllProducts()
	{
		Session s= this.factory.openSession();
		Query query= s.createQuery("from Product");
		List <Product> list= query.list();
		return list;
		
	}
	
	public List <Product> getAllProductsById(int cid)
	{
		Session s= this.factory.openSession();
		Query query= s.createQuery("from Product as p where p.category.categoryId= :id ");
		query.setParameter("id",cid);
		List <Product> list= query.list();
		s.close();
		return list;
		
	}


}
