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
import com.generation.mysmartwallet.entity.Transazione;
import com.generation.mysmartwallet.util.SessionUtil;

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
		// Rimuovo dal database
		if(daoTransazione.delete(idTransazione)) {
			// Rimuovo dal Bean Conto per "sincronizzarlo" con il Database
			Conto conto = context.getBean(Conto.class, SessionUtil.idFromSession(session));
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
		model.addAttribute("transazioni", context.getBean(Conto.class, SessionUtil.idFromSession(session)).getTransazioni());
		return "listaTransazioni.jsp";
	}
	
	@GetMapping("/aggiungi")
	public String aggiungiTransazione(@RequestParam Map<String, String> transazioneMap, HttpSession session) {
		Transazione t = context.getBean(Transazione.class, transazioneMap);
		if(daoTransazione.create(t)) {
			Conto c = context.getBean(Conto.class, SessionUtil.idFromSession(session));
			c.getTransazioni().add(t);
		}
		return "redirect:/transazioni/listaTransazioni";
	}
	
	
	@GetMapping("/modifica")
	public String modificaTransazione(@RequestParam Map<String, String> transazioneMap, HttpSession session) {
		Transazione t = context.getBean(Transazione.class, transazioneMap);
		if(daoTransazione.update(t)) {
			Conto c = context.getBean(Conto.class, SessionUtil.idFromSession(session));
			c.getTransazioni().removeIf(tr -> tr.getId() == t.getId());
			c.getTransazioni().add(t);
		}
		return "redirect:/transazioni/listaTransazioni";
	}
	
}
