package com.webtools.Final_Project.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Component
@Entity
public class Product {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long productID;
	private String productBrand;
	private String productCategory;
	private String productName;
	private String productDescription;
	private int avlQuantity;
	private float price;
	
	
	
	public Product(){
		
	}
	
	
	public long getProductID() {
		return productID;
	}

	public void setProductID(long productID) {
		this.productID = productID;
	}

	public String getProductBrand() {
		return productBrand;
	}

	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public int getAvlQuantity() {
		return avlQuantity;
	}

	public void setAvlQuantity(int avlQuantity) {
		this.avlQuantity = avlQuantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}


	public String getProductCategory() {
		return productCategory;
	}


	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}


	@Override
	public String toString() {
		return "Product [productID=" + productID + ", productBrand=" + productBrand + ", productCategory="
				+ productCategory + ", productName=" + productName + ", productDescription=" + productDescription
				+ ", avlQuantity=" + avlQuantity + ", price=" + price + "]";
	}

	
	
}
