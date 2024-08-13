package com.project.web.rentcar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class R_ProductController {
  //관리자 렌트카 상품등록 List 컨트롤러
  @GetMapping ( "/adminProductRentcarList" )
  public String adminProductRentcarList ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/productREG/rentcar/ProductRentcarList";
    
    return page;
  }
  
  //관리자 렌트카 상품등록 Reg 컨트롤러
  @GetMapping ( "/adminProductRentcarRegForm" )
  public String adminProductRentcarRegForm ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/productREG/rentcar/ProductRentcarRegForm";
    
    return page;
  }
}
