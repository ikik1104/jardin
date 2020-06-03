package com.javalec.ex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.ex.service.MtmService;

@Controller
public class My2Controller {
	@Autowired
	private MtmService mtmService;
	
	//1:1문의 리스트 페이지
	@RequestMapping("inquiry")
	public String inquiry(HttpServletRequest request, Model model) {
		int m_num = Integer.parseInt(request.getParameter("m_num"));
//		int m_num = 10001;
		model.addAttribute("inquiry", mtmService.getAllInquiry(m_num));
		return "mypage/inquiry";
	}
	
	//1:1문의 뷰 페이지
	public String inquiry_view(HttpServletRequest request, Model model) {
		int iu_num = Integer.parseInt(request.getParameter("iu_num"));
		int iu_rownum = Integer.parseInt(request.getParameter("iu_rownum"));
		//질문글 불러오기
		model.addAttribute("inq_view", mtmService.getOneInquiry(iu_num));
		//답변글 불러오기
		model.addAttribute("ans_view", mtmService.getOneAnswer(iu_num));
		//이전글 제목 불러오기
		model.addAttribute("pre_title", mtmService.getPreTitle(iu_rownum));
		//다음글 제목 불러오기
		model.addAttribute("next_title", mtmService.getPreTitle(iu_rownum));
		return "mypage/inquiry_view";
	}
	
	//1:1문의 작성 페이지
	@RequestMapping("inquiry_write")
	public String inquiry_write(Model model) {
		return "mypage/inquiry_write";
	}
	
	
	
	
}
