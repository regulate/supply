package org.crud.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.crud.entity.User;
import org.crud.exceptions.InvalidUserInputException;
import org.crud.exceptions.NoSuchPasswordException;
import org.crud.exceptions.UserExistException;
import org.crud.service.AdminService;
import org.crud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	public static final Logger log = Logger.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	
	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String redirectToLogin() {
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView getSignUpPage(@RequestParam(value = "error", required = false) String error){
		ModelAndView model = new ModelAndView("signup");
		if(error!=null){
			if (error.equals("user_exists")) {
				model.addObject("error", "user_exists");
			} else if(error.equals("invalid_input")){
				model.addObject("error", "invalid_input");
			}
		}
		return model;
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signUp(@ModelAttribute("user") User user) {
		try {
			userService.createUser(user);
		} catch (UserExistException e) {
			log.info(e);
			return "redirect:/signup?error=user_exists";
		} catch (InvalidUserInputException e) {
			log.info(e);
			return "redirect:/signup?error=invalid_input";
		}
		return "redirect:/login?success";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value = "success", required = false) String success){
		ModelAndView model = new ModelAndView("index");
		if (error != null) {
			model.addObject("error", "error");
		}else if (logout != null) {
			model.addObject("logout", "logout");
		}else if (success!=null) {
			model.addObject("success", "created");
		}
		return model;
	}
	
	@RequestMapping(value = "/admin/", method = RequestMethod.GET)
	public ModelAndView getAdminPage(){
		//TODO:implement logic below
		/*if AUTHORIZED:
		 * 	return "admin"
		 *else:
		 *	return "redirect:/login-admin/"
		 */
		List<User> users = userService.findAllUsers();
		return new ModelAndView("admin").addObject("users", users);
	}
	
	//TODO:make review page for admins
	@RequestMapping(value = "/admin/new", method = RequestMethod.POST)
	public String registerNewAdmin(@ModelAttribute("admin") User user){
		try {
			adminService.createAdmin(user);
		} catch (InvalidUserInputException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/admin/";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView getUsersProfile(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "success", required = false) String success){
		ModelAndView model = new ModelAndView("profile");
		
		if(error!=null){
			if (error.equals("invalid_input")) {
				model.addObject("error", "invalid_input");
			} else if(error.equals("incorrect_password")){
				model.addObject("error", "incorrect_password");
			}
		} else if(success!=null){
			model.addObject("success", "success");
		}
		
		String email = SecurityContextHolder.getContext().getAuthentication().getName();
		model.addObject("profile", userService.findUserByEmail(email));
		return model;
	}
	
	@RequestMapping(value="/profile/pass/change", method = RequestMethod.POST)
	public String changeUserPass(@RequestParam String curPass, @RequestParam String newPass, 
			@RequestParam String passToCompare){
		User user = userService.findUserByEmail(
				SecurityContextHolder.getContext().getAuthentication().getName());
		try {
			userService.changeUsersPassword(user, curPass, newPass, passToCompare);
		} catch (InvalidUserInputException e) {
			log.info(e);
			return "redirect:/profile?error=invalid_input";
		} catch (NoSuchPasswordException e) {
			log.info(e);
			return "redirect:/profile?error=incorrect_password";
		}
		return "redirect:/profile?success";
	}

}