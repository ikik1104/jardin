package com.javalec.ex.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.service.MtmService;
import com.javalec.ex.service.SessionService;

@Controller
public class My2Controller {
	@Autowired
	private MtmService mtmService;
	@Autowired
	private SessionService sessionService;
	
	//로그인 세션용 임시 - 추후 삭제 요망
	@RequestMapping("inquiry_test")
	public String inquiry_test(HttpSession session) {
		session.setAttribute("userID","Hong1");
		//테스트
		String m_id = (String)session.getAttribute("userID");
		if(m_id != null) {
			System.out.println("성공한듯");
		} else {
			System.out.println("실패각..");
		}
		//
		session.setAttribute("userNum", sessionService.getMnum(m_id));
		return "mypage/inquiry_test";
	}
	
	@RequestMapping("inquiry_test2")
	public String inquiry_test2(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
	//1:1문의 리스트 페이지
	@RequestMapping("inquiry")
	public String inquiry(HttpServletRequest request, Model model, HttpSession session) {
		//세션체크
		if(session.getAttribute("userNum") == null) {return "home";}
		int m_num = (Integer)session.getAttribute("userNum");
		System.out.println(m_num);
		//세션체크끝
		model.addAttribute("inquiry", mtmService.getAllInquiry(m_num));
		return "mypage/inquiry";
	}
	
	//1:1문의 뷰 페이지
	@RequestMapping("inquiry_view")
	public String inquiry_view(HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크끝
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		int iu_num = Integer.parseInt(request.getParameter("iu_num"));
		int rownum = Integer.parseInt(request.getParameter("rownum"));
		model.addAttribute("rownum", rownum);
		model.addAttribute("inq_view", mtmService.getOneInquiry(iu_num)); //질문글 불러오기
		model.addAttribute("ans_view", mtmService.getOneAnswer(iu_num)); //답변글 불러오기
		model.addAttribute("pre_title", mtmService.getPreTitle(m_num, rownum)); //이전글 제목 불러오기
		model.addAttribute("next_title", mtmService.getNextTitle(m_num, rownum)); //다음글 제목 불러오기
		return "mypage/inquiry_view";
	}
	
	//1:1문의 작성 페이지
	@RequestMapping("inquiry_write")
	public String inquiry_write(Model model, HttpSession session) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크끝
		return "mypage/inquiry_write";
	}
	
	//1:1문의 작성 후 등록
	@RequestMapping("inquiry_write_regi")
	public String inquiry_write_regi(MtmUserDto mtmUserDto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("userNum") == null) {return "home";} //세션체크 끝
		mtmService.insertInquiry(mtmUserDto);
		return "redirect:inquiry";
	}
	
	//1:1문의 수정 보기
	@RequestMapping("inquiry_modify")
	public String inquiry_modify(HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("userNum") == null) { return "home";} //세션체크
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		int iu_num = Integer.parseInt(request.getParameter("iu_num"));
		int rownum = Integer.parseInt(request.getParameter("rownum"));
		model.addAttribute("modi_view", mtmService.modifyView(iu_num));
		model.addAttribute("iu_num", iu_num);
		model.addAttribute("rownum", rownum);
		return "mypage/inquiry_modify";
	}
	
	//1:1문의 수정 등록
	@RequestMapping("inquiry_modi_regi")
	public String inquiry_modi_regi(MtmUserDto mtmUserDto, HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("userNum") == null) { return "home";} //세션체크
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		int iu_num = Integer.parseInt(request.getParameter("iu_num"));
		int rownum = Integer.parseInt(request.getParameter("rownum"));
		mtmService.modifyInquiry(mtmUserDto);
		return "redirect:inquiry_view?m_num=" + m_num + "&iu_num=" + iu_num + "&rownum=" + rownum;
	}
	
	//1:1문의 삭제
	@ResponseBody
	@RequestMapping("inquiry_delete")
	public int inquiry_delete(@RequestBody int iu_num) {
		System.out.println("아작스"+ iu_num);
		int success = mtmService.deleteInquiry(iu_num);
		return success;
	}
	
	
	
	
	
}
