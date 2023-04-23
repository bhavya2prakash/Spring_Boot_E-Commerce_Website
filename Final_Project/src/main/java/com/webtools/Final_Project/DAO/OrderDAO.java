package com.webtools.Final_Project.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import org.springframework.stereotype.Component;

import com.webtools.Final_Project.Model.Cart;
import com.webtools.Final_Project.Model.OrderItem;
import com.webtools.Final_Project.Model.Product;
import com.webtools.Final_Project.Model.User;

@Component
public class OrderDAO extends DAO{
	
	public OrderDAO() {}
	
	public List<OrderItem> cartProcess(long id, int qty, User user,Cart cart){
			
			
			OrderItem oi = new OrderItem();
			Query q = getSession().createQuery("from Product");
			List<Product> productList = q.list();
			for(Product product:productList){
				if(product.getProductID()==id){
					oi.setItemBrand(product.getProductBrand());
					oi.setItemName(product.getProductName());
					oi.setItemDescription(product.getProductDescription());
					oi.setItemPrice(product.getPrice());
					oi.setPurchaseQuantity(qty);
					oi.setCart(cart);;
					cart.getOrderItemList().add(oi);
					
					
				}
			}
			return cart.getOrderItemList();
		}
	public void saveOrder(Cart cart) throws Exception{
		try {
			begin();
			getSession().save(cart);
			System.out.println("DAO222");
			commit();
			
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Exception while placing order: " + e.getMessage());
		}
	}

}
