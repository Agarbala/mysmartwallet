package com.generation.mysmartwallet.util;

import javax.servlet.http.HttpSession;
import java.util.Map;

public abstract class SessionUtil {

    @SuppressWarnings("unchecked")
    public static int idFromSession(HttpSession session) {
        return Integer.parseInt(((Map<String, String>) session.getAttribute("user")).get("id"));
    }
}
