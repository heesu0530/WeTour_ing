package com.project.web.fly;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class F_ProductController {
  //관리자 항공 상품등록 List 컨트롤러
  @GetMapping ( "/adminProductFlyList" )
  public String adminProductFlyList ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/productREG/fly/ProductFlyList";
    
    return page;
  }
  
  //관리자 항공 상품등록 Reg 컨트롤러
  @GetMapping ( "/adminProductRegForm" )
  public String adminProductRegForm ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/productREG/fly/ProductFlyRegForm";
    
    return page;
  }
}
