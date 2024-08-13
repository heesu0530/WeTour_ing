package com.project.web.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FAQController {
  //자주묻는 질문 List 컨트롤러
  @GetMapping ( "/adminBoardFAQList" )
  public String adminBoardFAQList ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/board/FAQ/BoardFAQList";
    
    return page;
  }
  
  //자주묻는 질문 Reg 컨트롤러
  @GetMapping ( "/adminBoardFAQRegForm" )
  public String adminBoardFAQRegForm ( HttpServletRequest request, HttpServletResponse response ) {
    
    String page = null;
    page = "/admin/board/FAQ/BoardFAQRegForm";
    
    return page;
  }
}
