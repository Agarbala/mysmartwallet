package com.generation.mysmartwallet.controller;

import java.time.LocalDate;
import java.time.Month;
import java.time.format.TextStyle;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.generation.mysmartwallet.entity.Conto;
import com.generation.mysmartwallet.entity.Obiettivo;
import com.generation.mysmartwallet.entity.Transazione;
import com.generation.mysmartwallet.enums.TipoTransazione;
import com.generation.mysmartwallet.util.SessionUtil;

@Controller
public class HomeController {

	@Autowired
	private ApplicationContext context;

	@GetMapping("/")
	public String dashboard(Model model, HttpSession session) {
		Conto c = context.getBean(Conto.class, SessionUtil.idFromSession(session));
		LocalDate oggi = LocalDate.now();
		Month mese = oggi.getMonth();
		int anno = oggi.getYear();

		double entrate = 0;
		double uscite = 0;
		for (Transazione t : c.getTransazioni()) {
			if (t.getDatatransazione().getMonth() == mese && t.getDatatransazione().getYear() == anno) {
				if (t.getTipo().equalsIgnoreCase(TipoTransazione.ENTRATA.getLabel())) {
					entrate += t.getImporto();
				} else {
					uscite += t.getImporto();
				}
			}
		}

		model.addAttribute("risparmiato", getRisparmiatoPerObiettivo(session));
		model.addAttribute("conto", c);
		model.addAttribute("bilancioMensile", (entrate - uscite));
		model.addAttribute("entrate", entrate);
		model.addAttribute("uscite", uscite);
		model.addAttribute("mese", mese.getDisplayName(TextStyle.FULL, Locale.ITALIAN).toUpperCase());

		return "dashboard.jsp";
	}

	private Map<Integer, Double> getRisparmiatoPerObiettivo(HttpSession session) {
		Conto conto = context.getBean(Conto.class, SessionUtil.idFromSession(session));
		Map<Integer, Double> ris = new HashMap<>();
		for (Obiettivo o : conto.getObiettivi()) {
			double somma = 0;
			for (Transazione t : conto.getTransazioni()) {
				if (t.getObiettivoid() == o.getId()) {
					somma += t.getImporto();
				}
			}
			ris.put(o.getId(), somma);
		}
		return ris;
	}
}
