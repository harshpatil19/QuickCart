package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.entities.User;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("user_name");
        String userEmail = request.getParameter("user_email");
        String userPassword = request.getParameter("user_password");
        String userPhone = request.getParameter("user_phone");
        String userAddress = request.getParameter("user_address");
        String userType = request.getParameter("user_type");

        // Load the Hibernate configuration
        Configuration cfg = new Configuration();
        cfg.configure("hibernate.cfg.xml");

        // Create a session factory and open a new session
        SessionFactory sessionFactory = cfg.buildSessionFactory();
        Session session = sessionFactory.openSession();

        // Begin a transaction
        Transaction tx = session.beginTransaction();

        // Step 1: Check if the email already exists in the database
        Query<User> query = session.createQuery("FROM User WHERE userEmail = :email", User.class);
        query.setParameter("email", userEmail);
        User existingUser = query.uniqueResult();

        if (existingUser != null) {
            // Step 2: If email already exists, set error message and redirect to registration page
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Email already registered. Please use a different email.");
            response.sendRedirect("register.jsp");
        } else {
            // Step 3: If email does not exist, save the new user
            User user = new User();
            user.setUserName(userName);
            user.setUserEmail(userEmail);
            user.setUserPassword(userPassword);
            user.setUserPhone(userPhone);
            user.setUserAddress(userAddress);
            user.setUserType("normal"); // default user type

            session.save(user);
            tx.commit();

            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "User Registered Successfully");
            response.sendRedirect("register.jsp");
        }

        // Close the session
        session.close();
        sessionFactory.close();
    }
}
