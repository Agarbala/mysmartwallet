package com.generation.mysmartwallet.controller;

import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.generation.mysmartwallet.dao.DaoBudget;
import com.generation.mysmartwallet.entity.Budget;
import com.generation.mysmartwallet.entity.Conto;
import com.generation.mysmartwallet.entity.Transazione;
import com.generation.mysmartwallet.util.SessionUtil;

@Controller
@RequestMapping("/budget")
public class BudgetController {
	
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private DaoBudget daoBudget;
	
	@GetMapping("/modifica")
	public String modificaBudget(@RequestParam Map<String, String> budgetMap, HttpSession session) {
		Budget b = context.getBean(Budget.class, budgetMap);
		if(daoBudget.update(b)){
			Conto conto = context.getBean(Conto.class, SessionUtil.idFromSession(session));
			conto.setBudgets((ArrayList<Budget>) daoBudget.tuttiPerUtente(conto.getId()));
		}
		return "redirect:/budget/listaBudget.jsp";
	}
	
	@GetMapping("/aggiungi")
	public String aggiungiBudget(@RequestParam Map<String, String> budgetMap, HttpSession session) {
		Budget b = context.getBean(Budget.class, budgetMap);
		if(daoBudget.create(b)) {
			Conto conto = context.getBean(Conto.class, SessionUtil.idFromSession(session));
			conto.setBudgets((ArrayList<Budget>) daoBudget.tuttiPerUtente(conto.getId()));
		}
		return "redirect:/budget/listaBudget.jsp";
	}
	
	@GetMapping("/listaBudget")
	public String listaBudget(Model model, HttpSession session) {
		model.addAttribute("budget", context.getBean(Budget.class, SessionUtil.idFromSession(session)).getBudget());
		return "listaBudget.jsp";
	}
	

}
