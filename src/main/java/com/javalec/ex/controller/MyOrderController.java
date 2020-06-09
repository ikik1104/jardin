package com.javalec.ex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.ex.service.OrderCheckService;

@Controller
public class MyOrderController {

	@Autowired
	private OrderCheckService ocService;
	
	@RequestMapping("ordercheck")
	public String ordercheck(HttpSession session) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		
		int m_num = (Integer)session.getAttribute("userNum"); //회원 아이디 변수에 담기
//		int total = ocService.countOrder(m_num);
		
		
		return "mypage/ordercheck";
	}
	
	
}
