package com.javalec.ex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.PageDto;
import com.javalec.ex.service.OrderCheckService;

@Controller
public class MyOrderController {

	@Autowired
	private OrderCheckService ocService;
	
	//전체 주문리스트 불러오기
	@RequestMapping("ordercheck")
	public String ordercheck(PageDto pageDto, HttpSession session, HttpServletRequest request, Model model) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		
		String m_id = (String) session.getAttribute("userID");//페이징, 주문리스트 가져오기에 m_id를 넘겨줘야 하므로 세션에서 가져옴 
		int total = ocService.countOrder(m_id);//m_id 회원의 주문 개수 
		int cntPerPage = 10; // 한 페이지당 최대 노출 주문개수
		String page = request.getParameter("page"); //현재페이지..(목적 페이지)
		if(page == null) { page = "1"; } //page 가 null이면 무조건 1페이지로 세팅
		pageDto = new PageDto(total, Integer.parseInt(page), cntPerPage); // 페이징 처리
		List<Map<String, String>> orderlist = ocService.getAllOrder(m_id, pageDto);
		model.addAttribute("paging", pageDto); //페이지 담기
		model.addAttribute("orderlist", orderlist); //주문리스트 담기
		
		return "mypage/ordercheck";
	}
	
	//입금대기중 - 취소
	@ResponseBody
	@RequestMapping("cancel_order")
	public String cancel_order() {
		
	}
	
	
	
	
}
