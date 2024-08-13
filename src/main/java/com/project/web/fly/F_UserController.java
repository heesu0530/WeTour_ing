package com.project.web.fly;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class F_UserController {
  
  //관리자 항공 상품등록 List 컨트롤러
  @GetMapping ( "/fly" )
  public String fly ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/fly/FlyList";
    
    return page;
  }
  
  //관리자 항공 상품등록 Reg 컨트롤러
  @GetMapping ( "/flyReg" )
  public String flyReg ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/fly/FlyDetail";
    
    return page;
  }
}
