package com.webtools.Final_Project.Model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Component
@Entity
	public class User {
	    
		@Id
	    @GeneratedValue(strategy=GenerationType.IDENTITY)
		private int userid;
	    private String firstName;
	    private String lastName;
	    private String emailId;
	    private String password;
	    private String phoneNumber;
	    
	    public User(){}

	    public int getUserid() {
			return userid;
		}

	    public String getFirstName() {
	        return firstName;
	    }

	    public void setFirstName(String firstName) {
	        this.firstName = firstName;
	    }

	    public String getLastName() {
	        return lastName;
	    }

	    public void setLastName(String lastName) {
	        this.lastName = lastName;
	    }

	    public String getEmailId() {
	        return emailId;
	    }

	    public void setEmailId(String emailId) {
	        this.emailId = emailId;
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }

	    public String getPhoneNumber() {
	        return phoneNumber;
	    }

	    public void setPhoneNumber(String phoneNumber) {
	        this.phoneNumber = phoneNumber;
	    }

		@Override
		public String toString() {
			return "User [userid=" + userid + ", firstName=" + firstName + ", lastName=" + lastName + ", emailId="
					+ emailId + ", password=" + password + ", phoneNumber=" + phoneNumber + "]";
		}
	    
	    
	}

