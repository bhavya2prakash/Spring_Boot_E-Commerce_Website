package com.webtools.Final_Project.Model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Cart {
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private long orderId;
	private float orderTotalValue;
	private String buyerName;
	private String buyerEmail;
	private String buyerPhone;
	private String deliveryAddress1;
	private String deliveryAddress2;
	private String zip;
	private String city;
	private String state;
	private String deliveryDate;
	private String orderDate;
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="fkuser")
	private User user;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="fkchrge")
	private ChargeRequest chargeRequest;
	
	@OneToMany(mappedBy="cart" ,cascade = CascadeType.ALL,orphanRemoval = true)
	List<OrderItem> orderItemList = new ArrayList<>();
	
	public Cart() {}

	public long getOrderId() {
		return orderId;
	}


	public float getOrderTotalValue() {
		return orderTotalValue;
	}

	public void setOrderTotalValue(float orderTotalValue) {
		this.orderTotalValue = orderTotalValue;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getBuyerPhone() {
		return buyerPhone;
	}

	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}

	

	public String getDeliveryAddress1() {
		return deliveryAddress1;
	}

	public void setDeliveryAddress1(String deliveryAddress1) {
		this.deliveryAddress1 = deliveryAddress1;
	}

	public String getDeliveryAddress2() {
		return deliveryAddress2;
	}

	public void setDeliveryAddress2(String deliveryAddress2) {
		this.deliveryAddress2 = deliveryAddress2;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}



	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public ChargeRequest getChargeRequest() {
		return chargeRequest;
	}

	public void setChargeRequest(ChargeRequest chargeRequest) {
		this.chargeRequest = chargeRequest;
	}
	   
	

	@Override
	public String toString() {
		return "Cart [orderId=" + orderId + ", orderTotalValue=" + orderTotalValue + ", buyerName=" + buyerName
				+ ", buyerEmail=" + buyerEmail + ", buyerPhone=" + buyerPhone + ", deliveryAddress1=" + deliveryAddress1
				+ ", deliveryAddress2=" + deliveryAddress2 + ", zip=" + zip + ", city=" + city + ", state=" + state
				+ ", deliveryDate=" + deliveryDate + ", orderDate=" + orderDate + ", user=" + user + ", chargeRequest="
				+ chargeRequest + ", orderItemList=" + orderItemList + "]";
	}
	


}
