package com.project.web.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class H_UserController {
  
  //호텔 프로모션
  @GetMapping ( "/hotel" )
  public String hotel ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/hotel/hotelList";
    
    return page;
  }
  
  //호텔 상세페이지
  @GetMapping ( "/detail" )
  public String hotelDetail ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/hotel/hotelDetail";
    
    return page;
  }
}
