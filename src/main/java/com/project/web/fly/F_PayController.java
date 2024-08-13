package com.project.web.fly;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class F_PayController {
  //관리자 항공 결제 List 컨트롤러
  @GetMapping ( "/adminPayFlyList" )
  public String adminPayFlyList ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/pay/fly/PayFlyList";
    
    return page;
  }
  
  //관리자 항공 결제 Reg 컨트롤러
  @GetMapping ( "/adminPayRegForm" )
  public String adminPayRegForm ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/pay/fly/PayFlyRegForm";
    
    return page;
  }
}
