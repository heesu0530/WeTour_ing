package com.project.web.notice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.service.notice.NoticeService;
import com.project.vo.member.MemberVo;
import com.project.vo.notice.NoticeVo;
import com.project.vo.page.PageVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	// 공지사항 List 컨트롤러
	@GetMapping("/BoardNoticeList")
	public String getBoardNoticeList(HttpServletRequest request, HttpServletResponse response, NoticeVo nvo, Model model,
			PageVo pgvo) {

		String page = null;
		String contentJsp = null;
		HttpSession session = request.getSession();
		MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		Map<String, Object> reSet = noticeService.getNoticies(nvo, pgvo);

		page = "/admin/board/notice/BoardNoticeList";
		if (ssKey != null) {
			if (ssKey.getMem_role().equals("admin")) {
				contentJsp = "/notice/BoardNoticeList.jsp";
			} else {
				contentJsp = "/notice/BoardNoticeList.jsp";
			}
		} else {
			contentJsp = "/notice/NoticeList.jsp";
		}

		model.addAttribute("contentJsp", contentJsp);
		model.addAttribute("noticeTot", reSet.get("noticeTot"));
		model.addAttribute("pgvo", reSet.get("pgvo"));
		model.addAttribute("noticeList", reSet.get("notiList"));

		// 로그 추가
		//log.info("list==>" + reSet.get("notiList"));
		return page;
	}

	// 공지사항 Reg 컨트롤러
	@GetMapping("/BoardNoticeRegForm")
	public String NoticeRegForm(HttpServletRequest request, Model model, PageVo pgvo) {
		// 관리자만 (세션을 확인)
		HttpSession session = request.getSession();
		String msg = null;
		String url = null;
		String page = null;
		MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		if (ssKey != null && ssKey.getMem_role().equals("admin")) {
			model.addAttribute("contentJsp", "../admin/BoardNoticeRegForm.jsp");
			session.setAttribute("ssKey", ssKey);
			page = "/admin/board/notice/BoardNoticeRegForm";
		} else {
			msg = "로그인이 필요합니다.";
			url = "/login";
			page = "MsgPage";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
		}
		return page;
	}

//등록 페이지에서 데이터 등록 후 값 전송
	// BoardNoticeProc
	@PostMapping("/noticeProc")
	public String NoticeProc(HttpServletRequest request, NoticeVo nvo, Model model, PageVo pgvo) {
		HttpSession session = request.getSession();
		MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		String page = null;
		String url = null;
		String msg = null;

		if (ssKey != null && "admin".equals(ssKey.getMem_role())) {
			// Ensure WRITER is set
			nvo.setWriter(ssKey.getMem_id()); // Assuming `getMem_id` returns the member ID
			nvo.setModi_id(ssKey.getMem_id());
			// Log the NoticeVo object for debugging
			url = "/BoardNoticeRegForm";
			int result = noticeService.noticeProc(nvo);
			if (result > 0) {
				msg = "공지사항 등록 성공";
			} else {
				msg = "공지사항 등록 실패";
			}
			session.setAttribute("ssKey", ssKey);
		} else {
			msg = "로그인이 필요합니다.";
			url = "/signIn";
		}

		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		page = "MsgPage";
		return page;
	}

//등록된 데이터 상세 페이지
	@GetMapping("/noticeDetail")
	public String noticeDetail(HttpServletRequest request, PageVo pgvo, Model model, NoticeVo nvo) {
	    HttpSession session = request.getSession();
	    log.info(""+nvo);
	    MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
	    String page = null;
	    
	    // NoticeVo 객체 확인
	    System.out.println("Notice_No: " + nvo.getNotice_no());
	    
	    NoticeVo noti = noticeService.getNotice(nvo);
	    
	    if (ssKey != null && "admin".equals(ssKey.getMem_role())) {
	        session.setAttribute("ssKey", ssKey);
	        page = "/admin/board/notice/BoardNoticeShow";
	        model.addAttribute("contentJsp", "../notice/BoardNoticeShow.jsp");
	    } else {
	    	page = "/admin/board/notice/BoardNoticeShow";
	        model.addAttribute("contentJsp", "notice/NoticeShow.jsp");
	    }
	    
	    model.addAttribute("notice", noti);
	    log.info("notice789789"+noti);
	    return page;
	}

}
