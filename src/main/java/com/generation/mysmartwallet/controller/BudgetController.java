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
import com.generation.mysmartwallet.dao.DaoBudget;
import com.generation.mysmartwallet.entity.Budget;
import com.generation.mysmartwallet.util.SessionUtil;

@Controller
@RequestMapping("/budget")
public class BudgetController {
	
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private DaoBudget daoBudget;
	
	@GetMapping("/modifica")
	public String modificaBudget(@RequestParam Map<String, String> budgetMap) {
		Budget b = context.getBean(Budget.class, budgetMap);
		daoBudget.update(b);
		return "redirect:/budget/listaBudget.jsp";
	}
	
	@GetMapping("/aggiungi")
	public String aggiungiBudget(@RequestParam Map<String, String> budgetMap) {
		Budget b = context.getBean(Budget.class, budgetMap);
		daoBudget.create(b);
		return "redirect:/budget/listaBudget.jsp";
	}
	
	@GetMapping("/listaBudget")
	public String listaBudget(Model model, HttpSession session) {
		model.addAttribute("budget", context.getBean(Budget.class, SessionUtil.idFromSession(session)).getBudget());
		return "listaBudget.jsp";
	}
	

}
