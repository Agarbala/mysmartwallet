package com.generation.mysmartwallet.controller;

import java.time.LocalDate;
import java.time.Month;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.generation.mysmartwallet.dao.DaoBudget;
import com.generation.mysmartwallet.entity.Budget;
import com.generation.mysmartwallet.entity.Conto;
import com.generation.mysmartwallet.entity.Transazione;
import com.generation.mysmartwallet.enums.Categoria;
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
	
	@PostMapping("/aggiungi")
	@ResponseBody
	public boolean aggiungiBudget(@RequestBody Map<String, String> budget, HttpSession session) {
		Budget b = context.getBean(Budget.class, budget);
		System.out.println(b);
		if(daoBudget.create(b)) {
			Conto conto = context.getBean(Conto.class, SessionUtil.idFromSession(session));
			conto.setBudgets((ArrayList<Budget>) daoBudget.tuttiPerUtente(conto.getId()));
			return true;
		}
		return false;
	}
	
	@PostMapping("/getIdPerCategoria")
	@ResponseBody
	public String getId(@RequestBody String categoria) {
		return daoBudget.getIdPerCategoria(categoria);
	}
	
	@GetMapping("/listaBudget")
	public String listaBudget(Model model, HttpSession session) {
		model.addAttribute("budget", context.getBean(Conto.class, SessionUtil.idFromSession(session)).getBudgets());
		model.addAttribute("budgetPerCategoria", budgetPerCategoria(session));
		model.addAttribute("speseCategoria",spesaCategoria(session));
		return "listaBudget.jsp";
	}
	
	private Map<String,Double> spesaCategoria(HttpSession session){
		YearMonth dataCorrente = YearMonth.from(LocalDate.now());
		Map<String,Double> speseCat = new HashMap<String, Double>();
		for(Categoria c:Categoria.values()) {
			speseCat.put(c.getLabel(), 0.0);
		}
		Conto conto = context.getBean(Conto.class, SessionUtil.idFromSession(session));
		for(Transazione t:conto.getTransazioni()) {
			if(YearMonth.from(t.getDatatransazione()).equals(dataCorrente) && t.getTipo().equalsIgnoreCase("uscita")) {
					speseCat.put(t.getCategoria(),speseCat.get(t.getCategoria())+t.getImporto());
			}
		}
		return speseCat;
		
	}
	
	private Map<String, Double> budgetPerCategoria(HttpSession session) {
		Map<String,Double> bpc = new HashMap<String, Double>();
		for(Categoria c:Categoria.values()) {
			bpc.put(c.getLabel(), 0.0);
		}
		Conto conto = context.getBean(Conto.class, SessionUtil.idFromSession(session));
		for(Budget b : conto.getBudgets()) {
			bpc.put(b.getNome(), b.getBudget());
		}
		
		return bpc;
		
	}
	

}
