package com.webtools.Final_Project.DAO;

import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import org.springframework.stereotype.Component;

import com.webtools.Final_Project.Model.User;

@Component
public class UserDAO extends DAO{

    public UserDAO() {
    }

	public void saveUser(User user) {
		// TODO Auto-generated method stub
		try {
	        begin(); //inherited from super class DAO
	        getSession().save(user);
	        commit();
	        } catch(Exception e) {
	            rollback();
	            System.out.println("Exception: " + e.getMessage());
	        }
	}
	public User get(String emailId, String password) throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("from User where emailId = :emailId and password = :password");
			q.setParameter("emailId", emailId);
			q.setParameter("password", password);			
			User user = (User) q.uniqueResult();
			commit();
			close();
			return user;
		} 
		catch (HibernateException e) {
			rollback();
			throw new Exception("Could not get user with email ID:  " + emailId, e);
		}
	}
	public User uniqueCustomer(String emailId) throws  Exception{
		try {
			begin();
			Query q = getSession().createQuery("from User where emailId = :emailId");
			q.setParameter("emailId", emailId);
			//q.setString("password", password);			
			User customer = (User) q.uniqueResult();
			commit();
			close();
			return customer;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Could not get user with email ID:  " + emailId, e);
		}
	}
    
}
