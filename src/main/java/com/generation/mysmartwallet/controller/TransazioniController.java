package com.generation.mysmartwallet.controller;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.generation.mysmartwallet.dao.DaoTransazioni;
import com.generation.mysmartwallet.entity.Conto;

@Controller
@RequestMapping("/transazioni")
public class TransazioniController {
	
	@Autowired
	private DaoTransazioni daoTransazione;
	
	@Autowired
	private ApplicationContext context;
	
	//TODO: aggiungere un if ed eventualmente mandare un errore in frontend
	@GetMapping("/elimina")
	public String eliminaTransazione(@RequestParam("id") int idTransazione, @RequestParam("pagina") String pagina, HttpSession session) {
		int idUtente = Integer.parseInt(((Map<String, String>) session.getAttribute("user")).get("id"));
		// Rimuovo dal database
		if(daoTransazione.delete(idTransazione)) {
			// Rimuovo dal Bean Conto
			Conto conto = context.getBean(Conto.class, idUtente);
			conto.getTransazioni().removeIf(t -> t.getId() == idTransazione);
		}
		// Redireziono alla giusta pagina
		switch(pagina.toLowerCase()) {
		case "home":
			return "redirect:/";
		default:
			return "redirect:/transazioni/listaTransazioni";
		}
	}
		
	@GetMapping("/listaTransazioni")
	public String listaTransazioni(Model model, HttpSession session) {
		int idUtente = Integer.parseInt(((Map<String, String>) session.getAttribute("user")).get("id"));
		model.addAttribute("transazioni", context.getBean(Conto.class, idUtente).getTransazioni());
		return "listaTransazioni.jsp";
	}
	
	
	
}
