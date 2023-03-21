package com.generation.mysmartwallet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			// L'utente non è autenticato, lo reindirizziamo alla pagina di login
			response.sendRedirect("/login");
			return false;
		} 
		
		// L'autenticazione è valida, l'utente può accedere alla risorsa richiesta
		return true;
	}

}

