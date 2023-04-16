package com.webtools.Final_Project.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.webtools.Final_Project.DAO.UserDAO;
import com.webtools.Final_Project.Model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class UserController {
    
    public UserController() {
    }
    
   
    @RequestMapping(value = "/", method = RequestMethod.GET)
    protected String goToHome(ModelMap model) throws Exception {
      
    	model.addAttribute("user", new User());
    	return "index";

	}
	@RequestMapping(value = "register", method = RequestMethod.POST)
	protected String registerNewUser(@ModelAttribute("user") User user,UserDAO userdao) throws Exception {
		    
            System.out.println("hello3");
            System.out.println(user);
            userdao.saveUser(user);
            return "redirect:/";
    }
	@RequestMapping(value = "login", method = RequestMethod.POST)
	protected String loginUser(HttpServletRequest request,HttpSession session,UserDAO userDAO,ModelMap model) throws Exception {
    
		try {

			String emailid = request.getParameter("emailid").replaceAll("<|>|;|,|=", "");
			String password = request.getParameter("password").replaceAll("<|>|;|,|=", "");
			System.out.println(emailid+password);
			User user = userDAO.get(emailid, password);
			
			
		    if(emailid.equals("admin@gmail.com") && password.equals("admin")) {
		    	
				return "redirect:adminDashboard";
				
			}
			else if(user != null){
				 session.setAttribute("user", user);
				 return "redirect:userDashboard";
			}
			else{
				System.out.println("UserName/Password does not exist");
				return "redirect:/";
			}
			
			

		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
			return "redirect:/";
		}
    }
	
	@RequestMapping(value = "userDashboard", method = RequestMethod.GET)
    protected String goToUserHome() throws Exception {
     
    	return "userDashboard";

	}
	
	
	
    
}
