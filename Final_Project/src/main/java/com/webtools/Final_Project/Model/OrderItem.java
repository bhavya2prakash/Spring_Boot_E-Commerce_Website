package com.webtools.Final_Project.Model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.stereotype.Component;

@Component
@Entity
public class OrderItem {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long itemID;
	private String itemBrand;
	private String itemName;
	private float itemPrice;
	private String itemDescription;
	private int purchaseQuantity; 
	
	@ManyToOne( cascade = CascadeType.ALL)
	@JoinColumn(name="fkorderId")
    private Cart cart;
	
	public OrderItem() {}

	public long getItemID() {
		return itemID;
	}

	public void setItemID(long itemID) {
		this.itemID = itemID;
	}

	public String getItemBrand() {
		return itemBrand;
	}

	public void setItemBrand(String itemBrand) {
		this.itemBrand = itemBrand;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public float getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(float itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public int getPurchaseQuantity() {
		return purchaseQuantity;
	}

	public void setPurchaseQuantity(int purchaseQuantity) {
		this.purchaseQuantity = purchaseQuantity;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	@Override
	public String toString() {
		return "OrderItem [itemID=" + itemID + ", itemBrand=" + itemBrand + ", itemName=" + itemName + ", itemPrice="
				+ itemPrice + ", itemDescription=" + itemDescription + ", purchaseQuantity=" + purchaseQuantity
				+ ", cart=]";
	}

	
	
	
}
