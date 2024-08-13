package com.project.web.userTopMenu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class WishlistController {
  
  // 사용자 페이지 즐겨찾기 컨트롤러
  @GetMapping("/wishlist")
  public String wishlist (HttpServletRequest request, HttpServletResponse response) {
    
    String page = null;
    page = "/cart_wishlist/Wishlist";
    
    return page;
  }
}
