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
			DAO.close();
			
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Exception while placing order: " + e.getMessage());
		}
	}
	
	public List<Cart> allOrderDetails(){
		Query q = getSession().createQuery("from Cart");
		List<Cart> orderList = q.list();
		return orderList;
	}
	public List<Cart> allUserOrderDetails(User user){
		String hql = "FROM Cart c WHERE c.user = :user";
		List<Cart> carts = getSession().createQuery(hql, Cart.class)
		                          .setParameter("user", user)
		                          .getResultList();
		return carts;
	}
	public OrderItem findItem(String name,List<OrderItem> orderItemList ) {
        for (OrderItem item : orderItemList) {
            if (name.equals(item.getItemName())) {
                return item;
            }
        }
        return null;
    }
    
   
    
    public void deleteItem(OrderItem item,List<OrderItem> orderItemList,Cart cart) {
    	orderItemList.remove(item);
    	cart.getOrderItemList().remove(item);
    }
    
    public void deleteItem(String name,List<OrderItem> orderItemList,Cart cart) {
        OrderItem item = findItem(name, orderItemList);
        if (item != null)
            deleteItem(item,orderItemList, cart);
    }

}
