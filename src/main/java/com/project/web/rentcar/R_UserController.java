package com.project.web.rentcar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class R_UserController {
  
  //호텔 프로모션
  @GetMapping ( "/rentcar" )
  public String rentcar ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/rentcar/RentcarList";
    
    return page;
  }
  
  //호텔 상세페이지
  @GetMapping ( "/rentcarDetail" )
  public String rentcarDetail ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/rentcar/RentcarDetail";
    
    return page;
  }
}
