package com.project.web.domestic;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 국내여행 컨트롤러
@Controller
public class D_UserController {
  //국내여행 List 컨트롤러
  @GetMapping ( "/domesticTravel" )
  public String domesticTravel ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/domestic/DomesticList";
    
    return page;
  }
  
  //국내여행 Reg 컨트롤러
  @GetMapping ( "/domesticTravelDetail" )
  public String domesticTravelReg ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/domestic/DomesticDetail";
    
    return page;
  }
}
