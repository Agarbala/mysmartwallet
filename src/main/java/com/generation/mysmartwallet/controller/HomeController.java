package com.generation.mysmartwallet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

	@GetMapping("/login")
	@ResponseBody
	public String login() {
		return "pagina di login";
	}
}
