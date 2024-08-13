package com.project.web.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class UserController {
  
  //관리자 고객 List 컨트롤러
  @GetMapping("/adminUserList")
  public String adminUserList (HttpServletRequest request, HttpServletResponse response) {
    
    String page = null;
    
    page = "/admin/user/userList";
    
    return page;
  }

//관리자 고객 Reg 컨트롤러
  @GetMapping("/adminUserRegForm")
  public String adminUserRegForm (HttpServletRequest request, HttpServletResponse response) {
    
    String page = null;
    
    page = "/admin/user/userRegForm";
    
    return page;
  }
}
