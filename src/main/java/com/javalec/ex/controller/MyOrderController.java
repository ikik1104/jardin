package com.javalec.ex.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
	public int cancel_order(@RequestBody int ol_order_num) {
		int success = ocService.deleteOrder(ol_order_num);
		return success;
	}
	
//	//입금완료 - 취소
//	@ResponseBody
//	@RequestMapping("refund_req")
//	public int refund_req(@RequestBody int ol_order_num) {
//		int success = ocService.requestRefund(ol_order_num);
//		return success;
//	}
	
	//반품
	@RequestMapping("takeback_deli")
	public String takeback_del(Model model, HttpSession session, HttpServletRequest request) {
		int ol_order_num = Integer.parseInt(request.getParameter("ol_order_num"));
		List<Map<String, String>> list = ocService.getOneSetOrder(ol_order_num);
		model.addAttribute("list", list);
		return "mypage/return";
	}
	
	//개별반품 - 반품사유
	@RequestMapping("takeback_reason")
	public String takeback_reaon(Model model, HttpServletRequest request) {
		int ol_num = Integer.parseInt(request.getParameter("ol_num"));
		int ol_amt = Integer.parseInt(request.getParameter("ol_amt"));
		int ol_price = Integer.parseInt(request.getParameter("ol_price"));
		HashMap<String, String> map = ocService.getReturnPro(ol_num);
		model.addAttribute("ol_amt", ol_amt);
		model.addAttribute("ol_price", ol_price);
		model.addAttribute("map", map);
		return "mypage/takeback_delivery";
	}
	
	@RequestMapping("takeback_reason2")
	public String takeback_reason2(HttpServletRequest request) {
		String[] array = request.getParameterValues("array");
		for(int i=0; i<array.length; i++) {
			System.out.println(array[i]);
		}
		
		return "mypage/takeback_delivery";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
