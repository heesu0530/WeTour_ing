package com.project.web.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class H_PaylController {
  //관리자 호텔 결제 List 컨트롤러
  @GetMapping ( "/adminPayHotelList" )
  public String adminPayHotelList ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/pay/hotel/PayHotelList";
    
    return page;
  }
  
  //관리자 호텔 결제 Reg 컨트롤러
  @GetMapping ( "/adminPayHotelRegForm" )
  public String adminPayRegForm ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/pay/hotel/PayHotelRegForm";
    
    return page;
  }
}
