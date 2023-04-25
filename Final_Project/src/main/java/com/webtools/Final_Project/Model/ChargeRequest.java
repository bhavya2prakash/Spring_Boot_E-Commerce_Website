package com.webtools.Final_Project.Model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.springframework.stereotype.Component;

@Entity
@Component
public class ChargeRequest {
	
	public ChargeRequest() {}
	
	public enum Currency {
        EUR, USD;
    }
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int chargeRequestID;
    private String description;
    private int amount;
    private Currency currency;
    private String stripeEmail;
    private String stripeToken;
    @OneToOne(mappedBy="chargeRequest", cascade = CascadeType.ALL,orphanRemoval = true)
    Cart cart;
	
    public int getChargeRequestID() {
		return chargeRequestID;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Currency getCurrency() {
		return currency;
	}
	public void setCurrency(Currency currency) {
		this.currency = currency;
	}
	public String getStripeEmail() {
		return stripeEmail;
	}
	public void setStripeEmail(String stripeEmail) {
		this.stripeEmail = stripeEmail;
	}
	public String getStripeToken() {
		return stripeToken;
	}
	public void setStripeToken(String stripeToken) {
		this.stripeToken = stripeToken;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	@Override
	public String toString() {
		return "ChargeRequest [chargeRequestID=" + chargeRequestID + ", description=" + description + ", amount="
				+ amount + ", currency=" + currency + ", stripeEmail=" + stripeEmail + ", stripeToken=" + stripeToken
				+ ", cart="  + "]";
	}

	
	
    
    

}
