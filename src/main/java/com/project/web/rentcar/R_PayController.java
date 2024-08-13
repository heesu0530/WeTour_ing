package com.project.web.rentcar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class R_PayController {
  //관리자 렌트카 결제 List 컨트롤러
  @GetMapping ( "/adminPayRentcarList" )
  public String adminPayRentcarList ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/pay/rentcar/PayRentcarList";
    
    return page;
  }
  
  //관리자 렌트카 결제 Reg 컨트롤러
  @GetMapping ( "/adminPayRentcarRegForm" )
  public String adminPayRentcarRegForm ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/pay/rentcar/PayRentcarRegForm";
    
    return page;
  }
}
