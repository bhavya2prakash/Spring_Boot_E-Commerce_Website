package com.webtools.Final_Project.DAO;

import java.util.List;
import java.util.ArrayList;
import org.hibernate.query.Query;
import org.springframework.stereotype.Component;

import com.webtools.Final_Project.Model.Product;

@Component
public class ProductDAO extends DAO{
	 public ProductDAO() {
	    }

		public void saveProduct(Product product) {
			// TODO Auto-generated method stub
			try {
		        begin(); //inherited from super class DAO
		        getSession().save(product);
		        commit();
		        } catch(Exception e) {
		            rollback();
		            System.out.println("Exception: " + e.getMessage());
		        }
		}
		public List<Product> searchProducts(String category) {
			
			Query q = getSession().createQuery("from Product");
			List<Product> productList = q.list();
			List<Product> filteredList = new ArrayList<Product>();

			for(Product product : productList){
				
				if(product.getProductCategory().equals(category)){
					filteredList.add(product);
				}
			}
			
			return filteredList;
		}

}
