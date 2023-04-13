package com.generation.mysmartwallet.controller;

import com.generation.mysmartwallet.dao.DaoObiettivo;
import com.generation.mysmartwallet.entity.Conto;
import com.generation.mysmartwallet.entity.Obiettivo;
import com.generation.mysmartwallet.entity.Transazione;
import com.generation.mysmartwallet.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/obiettivi")
public class ObiettiviController extends SessionUtil {

    @Autowired
    private ApplicationContext context;

    @Autowired
    private DaoObiettivo daoObiettivo;

    @GetMapping("/elimina")
    public String eliminaObiettivo(@RequestParam("id") int idObiettivo, HttpSession session) {
        // Delete dal database
        if (daoObiettivo.delete(idObiettivo)) {
            // Delete dal Bean Conto
            Conto conto = context.getBean(Conto.class, SessionUtil.idFromSession(session));
            conto.getObiettivi().removeIf(o -> o.getId() == idObiettivo);
        }
        return "redirect:/obiettivi/listaObiettivi";
    }

    @GetMapping("/listaObiettivi")
    public String listaObiettivi(Model model, HttpSession session) {
        model.addAttribute("obiettivi",
                context.getBean(Conto.class, SessionUtil.idFromSession(session)).getObiettivi());
        model.addAttribute("risparmiato", getRisparmiatoPerObiettivo(session));
        return "listaObiettivi.jsp";
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

    @GetMapping("/aggiungi")
    public String aggiungiObiettivo(@RequestParam Map<String, String> obiettivoMap, HttpSession session) {
        Obiettivo o = context.getBean(Obiettivo.class, obiettivoMap);
        if (daoObiettivo.create(o)) {
            Conto conto = context.getBean(Conto.class, SessionUtil.idFromSession(session));
            conto.setObiettivi((ArrayList<Obiettivo>) daoObiettivo.tuttiPerUtente(conto.getId()));
        }
        switch (obiettivoMap.get("pagina").toLowerCase()) {
            case "home":
                return "redirect:/";
            default:
                return "redirect:/obiettivi/listaObiettivi";
        }
    }

    @GetMapping("/modifica")
    public String modificaObiettivo(@RequestParam Map<String, String> obiettivoMap, HttpSession session) {
        Obiettivo o = context.getBean(Obiettivo.class, obiettivoMap);
        if (daoObiettivo.update(o)) {
            Conto conto = context.getBean(Conto.class, SessionUtil.idFromSession(session));
            conto.setObiettivi((ArrayList<Obiettivo>) daoObiettivo.tuttiPerUtente(conto.getId()));
        }
        return "redirect:/obiettivi/listaObiettivi";
    }

    @PostMapping("/getObiettivo")
    @ResponseBody
    public Map<String, String> getObiettivo(@RequestParam int id, HttpSession session) {
        Conto c = context.getBean(Conto.class, SessionUtil.idFromSession(session));
        return c.getObiettivi().stream().filter(o -> o.getId() == id).findFirst().get().toMap();
    }
}
