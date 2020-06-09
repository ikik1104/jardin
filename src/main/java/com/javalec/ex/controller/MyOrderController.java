package com.javalec.ex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.ex.dto.PageDto;
import com.javalec.ex.service.OrderCheckService;

@Controller
public class MyOrderController {

	@Autowired
	private OrderCheckService ocService;
	
	@RequestMapping("ordercheck")
	public String ordercheck(PageDto pageDto, HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		
		int m_num = (Integer)session.getAttribute("userNum"); //회원 아이디 변수에 담기
		int total = ocService.countOrder(m_num);
		int cntPerPage = 10;
		String page = request.getParameter("page");
		if(page == null) { page = "1"; }
		pageDto = new PageDto("orderlist", ocService.getAllOrder(m_num, pageDto));
		return "mypage/ordercheck";
	}
	
	
}
