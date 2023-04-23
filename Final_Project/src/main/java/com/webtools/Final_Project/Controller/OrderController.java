package com.webtools.Final_Project.Controller;


import java.util.List;
import java.util.Map;
import java.util.Date;
import java.util.HashMap;

import java.text.SimpleDateFormat;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import com.webtools.Final_Project.DAO.OrderDAO;
import com.webtools.Final_Project.Model.Cart;
import com.webtools.Final_Project.Model.ChargeRequest;
import com.webtools.Final_Project.Model.ChargeRequest.Currency;
import com.webtools.Final_Project.Model.OrderItem;
import com.webtools.Final_Project.Model.User;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class OrderController {
	
	public OrderController() {}
	
	@Autowired
	OrderDAO orderDao;
	@Value("${STRIPE_PUBLIC_KEY}")
	private String stripePublicKey;
	@Value("${STRIPE_SECRERT_KEY}")
	private String secretKey;
	
	SimpleDateFormat ddMMMyyFormat = new SimpleDateFormat("dd-MMM-yy");
	
	@RequestMapping(value="addtocart", method = RequestMethod.POST)
	public String cartUpdate(HttpServletRequest request){
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if (cart == null) {
	            cart = new Cart();
	    }
		User user = (User)request.getSession().getAttribute("user");
		long productID = Long.parseLong(request.getParameter("productID"));
		String field  = "purchaseQty"+String.valueOf(productID);
		int purchaseQty = Integer.parseInt(request.getParameter(field));
		List<OrderItem> orderItemList = orderDao.cartProcess(productID, purchaseQty, user,cart);
		for(OrderItem oi:orderItemList){
			System.out.println("Printing order items name: "+oi.getItemName());
			System.out.println("Printing order object:"+oi.getCart());
		}
		request.getSession().setAttribute("orderItemList", orderItemList);
		request.getSession().setAttribute("cart", cart);
		return "userDashboard";
	}
	@RequestMapping(value="cart", method = RequestMethod.POST)
	public String cart(HttpServletRequest request){
		

		return "viewCart";
	}
	@RequestMapping(value="delivery", method = RequestMethod.POST)
	public String delivery(HttpServletRequest request, ModelMap model){
		
		float totalOrderWorth = 0;
		List<OrderItem> myList = (List<OrderItem>)request.getSession().getAttribute("orderItemList");
			for(OrderItem oi : myList){
			
			totalOrderWorth = totalOrderWorth+(oi.getPurchaseQuantity()*oi.getItemPrice());
		}
		Cart cart = myList.get(0).getCart();
		cart.setOrderTotalValue(totalOrderWorth);
		model.addAttribute("totalOrderWorth",totalOrderWorth);
		System.out.println(totalOrderWorth);
		return "delivery";
	}
	
	@RequestMapping(value="payment", method = RequestMethod.POST)
	public String payment(HttpServletRequest request,ModelMap model){
		List<OrderItem> myList = (List<OrderItem>)request.getSession().getAttribute("orderItemList");

		Cart cart = myList.get(0).getCart();
		
		cart.setBuyerName(request.getParameter("fullname"));
		cart.setBuyerEmail(request.getParameter("email"));
		cart.setBuyerPhone(request.getParameter("contact"));
		cart.setDeliveryAddress1(request.getParameter("address1"));
		cart.setDeliveryAddress2(request.getParameter("address2"));
		cart.setZip(request.getParameter("zip"));
		cart.setCity(request.getParameter("city"));
		cart.setState(request.getParameter("state"));
		model.addAttribute("totalOrderWorth",request.getParameter("amount"));
		model.addAttribute("stripePublicKey", stripePublicKey);
        model.addAttribute("currency", Currency.USD);
		return "payment";
	}
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String paymentCompleted() {
	    // Display payment completion message to the user
	   
	    return "userDashboard";
	}
	
	@RequestMapping(value="charge", method = RequestMethod.POST)
	    public String charge(ModelMap model,HttpServletRequest request)
	      throws Exception  {
	       
		    try {
		    ChargeRequest chargeRequest = new ChargeRequest();	
		    System.out.println(chargeRequest+"1");
		    chargeRequest.setDescription("Example charge");
		    System.out.println(chargeRequest+"2"+request.getParameter("amount").split("\\.")[0]);
		    
	        chargeRequest.setAmount(Integer.valueOf(request.getParameter("amount").split("\\.")[0]));
	        chargeRequest.setCurrency(Currency.USD);
	        chargeRequest.setStripeToken(request.getParameter("stripeToken"));
	        chargeRequest.setStripeEmail(request.getParameter("stripeEmail"));
	       
	        System.out.println(chargeRequest+"3");
	        Map<String, Object> chargeParams = new HashMap<>();
	        System.out.println(chargeRequest+"4");
	        chargeParams.put("amount", chargeRequest.getAmount());
	        System.out.println(chargeRequest+"5");
	        chargeParams.put("currency", chargeRequest.getCurrency());
	        System.out.println(chargeRequest+"6");
	        chargeParams.put("description", chargeRequest.getDescription());
	        System.out.println(chargeRequest+"7");
	        chargeParams.put("source", chargeRequest.getStripeToken());
	        System.out.println(chargeRequest+"8");
	        Stripe.apiKey = secretKey;
	        Charge charge=Charge.create(chargeParams);
	        System.out.println(chargeRequest+"9");
	        model.addAttribute("id", charge.getId());
	        System.out.println(chargeRequest+"10");
	        model.addAttribute("status", charge.getStatus());
	        System.out.println(chargeRequest+"11");
	        model.addAttribute("chargeId", charge.getId());
	        System.out.println(chargeRequest+"12");
	        model.addAttribute("balance_transaction", charge.getBalanceTransaction());
	        System.out.println(chargeRequest+"13");
	        List<OrderItem> myList = (List<OrderItem>)request.getSession().getAttribute("orderItemList");
	        Cart cart = myList.get(0).getCart();
	        cart.setOrderDate(ddMMMyyFormat.format(new Date()));
	        long ltime = new Date().getTime()+8*24*60*60*1000;
	        cart.setDeliveryDate(ddMMMyyFormat.format(new Date(ltime)));
	        cart.setUser((User)request.getSession().getAttribute("user"));
	        cart.setChargeRequest(chargeRequest);
	        System.out.println((Cart)request.getSession().getAttribute("cart"));
	        System.out.println(myList.get(0).getCart());
	        orderDao.saveOrder(cart);
	        return "confirmation";
		    }
		    catch(StripeException e  ) {
		    	System.out.println("Error"+e.getMessage());
		    	model.addAttribute("error", e.getMessage());
		    	
		    	return "confirmation";
		    }
	    }
	 
	    

}
