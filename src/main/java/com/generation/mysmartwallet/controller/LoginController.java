package com.generation.mysmartwallet.controller;


import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.generation.mysmartwallet.dao.DaoUtente;
import com.generation.mysmartwallet.entity.Conto;
import com.generation.mysmartwallet.entity.User;
import com.generation.mysmartwallet.util.PasswordEncoder;

@Controller
public class LoginController {

	
	@Autowired
	private ApplicationContext context;
	
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

	@PostMapping("/loginProcess")
	public String loginProcess(HttpSession session, @RequestParam("username") String username, 
			@RequestParam("password") String password, Model model) {

		// Cerco l'utente nel DB in base all'username
		User utenteRegistrato = daoUtente.trovaPerUsername(username);
		// Se lo trovo (!= null) e la password corrisponde
		if(utenteRegistrato != null && encoder.matches(password, utenteRegistrato.getPassword())) {
			// Creo l'oggetto conto
			// Devo caricare tutti i dati del conto (transazioni, budget, obiettivi, saldo)
			Conto contoUtente = context.getBean(Conto.class, utenteRegistrato.getId());
			//TODO: qui o nel context?
			contoUtente.setUtente(utenteRegistrato);
			// creo una mappa e la salvo in sessione
			Map<String, String> user = utenteRegistrato.toMap();
			user.remove("password");
			session.setAttribute("user", user);
			model.addAttribute("conto", contoUtente);
			return "redirect:/";
		}

		return "redirect:login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// Invalida la sessione e distrugge tutti gli oggetti collegati alla ad essa
		session.invalidate();
		return "redirect:/";
	}

}
