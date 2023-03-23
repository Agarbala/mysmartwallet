package com.generation.mysmartwallet.controller;

import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.generation.mysmartwallet.dao.DaoUtente;
import com.generation.mysmartwallet.entity.User;
import com.generation.mysmartwallet.util.PasswordEncoder;

@Controller
public class SignupController {

	@Autowired
	private ApplicationContext context;

	@Autowired
	private DaoUtente daoUtente;

	@Autowired
	private PasswordEncoder encoder;

	@GetMapping("/signup")
	public String signup() {
		return "signup.html";
	}

	@PostMapping("/isUsernameDisponibile")
	@ResponseBody
	public boolean isUsernameDisponibile(@RequestParam String username) {
		return !daoUtente.isUsernameEsistente(username);
	}
	
	@PostMapping("/signupProcess")
	public String signupProcess(HttpSession session, @RequestParam Map<String, String> user) {
		// Controllo che non esista già un utente con lo stesso username nel database
		if(!daoUtente.isUsernameEsistente(user.get("username"))) {
			// Se non esiste, creo un nuovo oggetto User dai parametri della request
			User newUser = context.getBean(User.class, user);
			// Cripto la password
			newUser.setPassword(encoder.encode(user.get("password")));
			// Provo ad aggiungerlo
			if(daoUtente.create(newUser)) {
				Map<String, String> userMap = newUser.toMap();
				userMap.remove("password");
				session.setAttribute("user", userMap);
				return "redirect:/";
			}
		}
		return "redirect:/signup";
	}
}
