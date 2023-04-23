package com.webtools.Final_Project.Util;

import java.util.Properties;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;
import org.springframework.stereotype.Component;
import com.webtools.Final_Project.Model.User;
import com.webtools.Final_Project.Model.Product;
import com.webtools.Final_Project.Model.Cart;
import com.webtools.Final_Project.Model.OrderItem;
import com.webtools.Final_Project.Model.ChargeRequest;

@Component
public class HibernateUtil {
	
	  private static SessionFactory sessionFactory;
	    public static SessionFactory getSessionFactory() {
	        if (sessionFactory == null) {
	            try {
	                Configuration configuration = new Configuration();

	                // Hibernate settings equivalent to hibernate.cfg.xml's properties
	                Properties settings = new Properties();
	                settings.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
	                settings.put(Environment.URL, "jdbc:mysql://localhost/webtools?createDatabaseIfNotExist=true");
	                settings.put(Environment.USER, "root");
	                settings.put(Environment.PASS, "bhavya1234");
	                settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");

	                settings.put(Environment.SHOW_SQL, "true");

	                settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

	                settings.put(Environment.HBM2DDL_AUTO, "update");

	                configuration.setProperties(settings);

	                configuration.addAnnotatedClass(User.class);
	                configuration.addAnnotatedClass(Product.class);
	                configuration.addAnnotatedClass(Cart.class);
	                configuration.addAnnotatedClass(OrderItem.class);
	                configuration.addAnnotatedClass(ChargeRequest.class);
	                
	                ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
	                    .applySettings(configuration.getProperties()).build();

	                sessionFactory = configuration.buildSessionFactory(serviceRegistry);
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        return sessionFactory;
	    }
}
