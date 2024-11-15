//DAO is just used to simplify the database connectivity also used for the code sepration purpose.

package com.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.User;


public class UserDAO {
private SessionFactory factory;

public UserDAO(SessionFactory factory) {
	super();
	this.factory = factory;
}
//Create method to get user by email and password
public User getUserByEmailAndPassword (String email, String password) {
	User user=null;
	try {
		String query="from User where userEmail =: e and userPassword =: p";
		Session session=this.factory.openSession();
		Query q=session.createQuery(query);
		q.setParameter("e", email);
		q.setParameter("p", password);
		user= (User)  q.uniqueResult();
		session.close();
		
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	
	return user ;
}
}
