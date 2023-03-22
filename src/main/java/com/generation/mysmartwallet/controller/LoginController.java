package com.generation.mysmartwallet.controller;


import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.generation.mysmartwallet.dao.DaoUtente;
import com.generation.mysmartwallet.entity.User;
import com.generation.mysmartwallet.util.PasswordEncoder;

@Controller
public class LoginController {

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private DaoUtente daoUtente;

	@GetMapping("/login")
	public String login(HttpSession session) {
		if(session.getAttribute("user") != null) {
			return "redirect:/";
		}
		return "login.html";
	}

	@GetMapping("/loginProcess")
	public String loginProcessGet() {
		return "redirect:/login";
	}

	@PostMapping("/loginProcess")
	public String loginProcess(HttpSession session, @RequestParam("username") String username, 
			@RequestParam("password") String password) {

		// Cerco l'utente nel DB in base all'username
		User utenteRegistrato = daoUtente.trovaPerUsername(username);
		// Se lo trovo (!= null) e la password corrisponde
		if(utenteRegistrato != null && encoder.matches(password, utenteRegistrato.getPassword())) {
			// creo una mappa e la salvo in sessione
			Map<String, String> user = utenteRegistrato.toMap();
			user.remove("password");
			session.setAttribute("user", user);
			return "redirect:/";
		}

		return "redirect:login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}

}
