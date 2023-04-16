package com.webtools.Final_Project.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webtools.Final_Project.DAO.ProductDAO;
import com.webtools.Final_Project.Model.Product;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class ProductController {

	public ProductController() {
    }
	
	@Autowired
	ProductDAO productdao;
	
	@RequestMapping(value = "adminDashboard", method = RequestMethod.GET)
    protected String adminHome(ModelMap model) throws Exception {
      
    	model.addAttribute("product", new Product());
    	return "adminDashboard";

	}
	@RequestMapping(value = "addproduct", method = RequestMethod.POST)
	protected String addNewProduct(@ModelAttribute("product") Product product) throws Exception {
		    
            System.out.println("hello3");
            System.out.println(product);
            productdao.saveProduct(product);
            return "redirect:adminDashboard";
    }
	
	@RequestMapping(value="searchproduct", method = RequestMethod.GET)
	public String searchProduct(HttpServletRequest request,ModelMap model ){
		
		String searchWord = request.getParameter("category");
		List <Product> searchItemList = new ArrayList<>();
        try {
			
			searchItemList = (ArrayList<Product>) productdao.searchProducts(searchWord);
			model.addAttribute("searchItemList", searchItemList);
			System.out.println(searchItemList);
			return "userDashboard";
			
		} 
        catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
			return "redirect:userDashboard";
		}
	}
}
