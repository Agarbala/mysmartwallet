package com.generation.mysmartwallet.util;

import java.util.Map;

import javax.servlet.http.HttpSession;

public abstract class SessionUtil {
	
	@SuppressWarnings("unchecked")
	public static int idFromSession(HttpSession session) {
		return Integer.parseInt(((Map<String, String>) session.getAttribute("user")).get("id"));
	}
}
