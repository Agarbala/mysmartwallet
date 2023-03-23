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
import com.generation.mysmartwallet.dao.DaoObiettivo;
import com.generation.mysmartwallet.entity.Conto;
import com.generation.mysmartwallet.entity.Obiettivo;
import com.generation.mysmartwallet.util.SessionUtil;

@Controller
@RequestMapping("/obiettivi")
public class ObiettiviController extends SessionUtil{
	
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private DaoObiettivo daoObiettivo;
	
	
	@GetMapping("/elimina")
	public String eliminaObiettivo(@RequestParam("id") int idObiettivo, HttpSession session) {
		// Delete dal database
		if(daoObiettivo.delete(idObiettivo)) {
		// Delete dal Bean Conto
			Conto conto = context.getBean(Conto.class, SessionUtil.idFromSession(session));
			conto.getObiettivi().removeIf(o -> o.getId() == idObiettivo);
		}
		return "redirect:/obiettivi/listaObiettivi";
	}
	
	@GetMapping("/listaObiettivi")
	public String listaObiettivi(Model model, HttpSession session) {
		model.addAttribute("obiettivi", context.getBean(Conto.class, SessionUtil.idFromSession(session)).getObiettivi());
		return "listaObiettivi.jsp";
	}
	
	@GetMapping("/aggiungi")
	public String aggiungiObiettivo(@RequestParam Map<String, String> obiettivoMap) {
		Obiettivo o = context.getBean(Obiettivo.class, obiettivoMap);
		daoObiettivo.create(o);
		return "redirect:/obiettivi/listaObiettivi";
	}
	
	@GetMapping("/modifica")
	public String modificaObiettivo(@RequestParam Map<String, String> obiettivoMap) {
		Obiettivo o = context.getBean(Obiettivo.class, obiettivoMap);
		daoObiettivo.update(o);
		return "redirect:/obiettivi/listaObiettivi";
	}
	
	

}
