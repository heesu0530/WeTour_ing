package com.project.web.overseas;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 해외여행 컨트롤러
@Controller
public class O_UserController {
  //해외여행 List 컨트롤러
  @GetMapping ( "/overseasTravel" )
  public String overseasTravel ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/overseas/OverseasList";
    
    return page;
  }
  
  //해외여행 Reg 컨트롤러
  @GetMapping ( "/overseasTravelReg" )
  public String overseasTravelReg ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/overseas/OverseasDetail";
    
    return page;
  }
}
