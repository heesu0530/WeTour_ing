package com.project.web.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class H_ProductController {
  //관리자 호텔 상품등록 List 컨트롤러
  @GetMapping ( "/adminProductHotelList" )
  public String adminProductHotelList ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/productREG/hotel/ProductHotelList";
    
    return page;
  }
  
  //관리자 호텔 상품등록 Reg 컨트롤러
  @GetMapping ( "/adminProductHotelRegForm" )
  public String adminProductRegForm ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/productREG/hotel/ProductHotelRegForm";
    
    return page;
  }
}
