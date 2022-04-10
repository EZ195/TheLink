package com.ezone.link.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@GetMapping("/signup_view")
	public String signupView() {
		
		return "/user/signup";
	}
	
	@GetMapping("/signin_view")
	public String signinView() {
		return "/user/signin";
	}
	
	@GetMapping("/sign_out")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userLoginEmail");
		session.removeAttribute("nickname");
		
		return "redirect:/user/signin_view";
	}

}
