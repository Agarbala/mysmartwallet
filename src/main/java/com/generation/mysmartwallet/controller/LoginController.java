package com.generation.mysmartwallet.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.generation.mysmartwallet.util.PasswordEncoder;

@Controller
public class LoginController {
	
	@Autowired
	private PasswordEncoder encoder;
	
	@GetMapping("/login")
	public String login(HttpSession session) {
		if(session.getAttribute("user") != null) {
			return "redirect:/";
		}
		return "login.html";
	}
	
	//TODO: Deve effettivamente controllare che l'utente sia presente nel Database
	@RequestMapping(value = "/loginProcess", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String loginProcess(HttpSession session, @RequestParam("username") String username, 
								@RequestParam("password") String password) {
		
		
			if(username.equalsIgnoreCase("123")&& encoder.matches(password,encoder.encode("123"))) {
				Map<String, String> user=new HashMap<String,String>();
				user.put("username", username);
				user.put("nome", "Marco");
				user.put("cognome", "Cane di Giorgia");
				user.put("datadinascita", "1987-11-19");
				user.put("password", encoder.encode(password));
				session.setAttribute("user", user);
				return "redirect:/";
			}
		 
		return "redirect:login";
	}
	
}
