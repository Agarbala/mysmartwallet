package com.generation.mysmartwallet.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Component
public class LoginController {
	
	@GetMapping("/login")
	public String login(HttpSession session) {
		if(session.getAttribute("user") != null) {
			return "redirect:/";
		}
		return "login.html";
	}
	
	//TODO: Deve effettivamente controllare che l'utente sia presente nel Database
	@RequestMapping(value = "/loginProcess", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String loginProcess(HttpSession session, @RequestParam("username") Optional<String> username) {
		
		if(username.isPresent()) {
			if(username.get().equalsIgnoreCase("alessio")) {
				session.setAttribute("user", "Alessio");
				return "redirect:/";
			}
		} 
		return "redirect:login";
	}
	
}
