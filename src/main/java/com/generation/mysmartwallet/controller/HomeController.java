package com.generation.mysmartwallet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.generation.mysmartwallet.entity.Conto;
import com.generation.mysmartwallet.util.SessionUtil;


@Controller
public class HomeController {

	
	@Autowired
	private ApplicationContext context;
	
	@GetMapping("/")
	public String dashboard(Model model, HttpSession session) {
		 model.addAttribute("conto", context.getBean(Conto.class, SessionUtil.idFromSession(session)).getId());
		 	
		 
		 
		 return "dashboard.jsp";
	}
	
	
	
	
	
}
