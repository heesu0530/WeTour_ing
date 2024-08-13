package com.project.web.userTopMenu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {
  
  @GetMapping("/cart")
  public String cart () {
    
    String page = null;
    page = "/cart_wishlist/Cart";
    
    return page;
  }
}
