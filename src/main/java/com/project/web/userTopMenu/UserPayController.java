package com.project.web.userTopMenu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class UserPayController {
  
  // 사용자 페이지 페이 컨트롤러
  @GetMapping("/userMyPay")
  public String userMyPay (HttpServletRequest request, HttpServletResponse response) {
    
    String page = null;
    page = "/pay/UserMyPay";
    return page;
  }
  
}
