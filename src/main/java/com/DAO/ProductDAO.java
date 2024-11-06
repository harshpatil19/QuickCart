package com.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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

}
