package com.generation.mysmartwallet.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordEncoder {

  public String encode(String password) {
    String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
    return hashedPassword;
  }

  public boolean matches(String password, String hashedPassword) {
    boolean matched = BCrypt.checkpw(password, hashedPassword);
    return matched;
  }

}