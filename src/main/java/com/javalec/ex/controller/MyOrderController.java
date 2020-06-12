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
import org.springframework.web.bind.annotation.RequestParam;
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
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		int ol_order_num = Integer.parseInt(request.getParameter("ol_order_num"));
		List<Map<String, String>> list = ocService.getOneSetOrder(ol_order_num);
		model.addAttribute("list", list);
		return "mypage/return";
	}
	
	//개별반품 - 반품사유 페이지 열기
	@RequestMapping("takeback_reason")
	public String takeback_reaon(@RequestParam String array, Model model, HttpServletRequest request) {
		String[] info = array.split(",");
		System.out.println(info.length);
		model.addAttribute("ol_num", info[0]);
		model.addAttribute("rt_amt", info[1]);
		model.addAttribute("origin_amt", info[2]);
		model.addAttribute("ol_price", info[3]);
		model.addAttribute("p_name", info[4]);
		model.addAttribute("origin_price", info[5]);
		return "mypage/takeback_delivery";
	}
	
	//반품 접수
	@ResponseBody
	@RequestMapping("return_request")
	public int return_reqeust(@RequestBody String[] rtinfo) {
		//반품리스트 인서트
		int success = ocService.returnRq(rtinfo[0], rtinfo[1], rtinfo[2]);
		//주문리스트 수량, 제품최종결제금액(ol_final_price) 업데이트
		int ol_amt = Integer.parseInt(rtinfo[3]) - Integer.parseInt(rtinfo[1]);
		int ol_price = Integer.parseInt(rtinfo[5]) - Integer.parseInt(rtinfo[4]);
		System.out.println(ol_amt);
		if(ol_amt == 0) {
			ocService.deleteOrderOne(rtinfo[0]);
		} else {
			ocService.updateOrderAmount(rtinfo[0], ol_amt, ol_price);
		}
		return success;
	}
	
	//배송완료 상태에서 리뷰작성 버튼 클릭 시 - 구매확정 유도
	@RequestMapping("my_review_alert")
	public String my_review_alert(HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		int ol_order_num = Integer.parseInt(request.getParameter("ol_order_num"));
		model.addAttribute("ol_order_num", ol_order_num);
		return "mypage/my_review_alert";
	}
	
	@RequestMapping("my_review_list")
	public String my_review_list(HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		int ol_order_num = Integer.parseInt(request.getParameter("ol_order_num"));
		String order_status = "구매확정";
		//주문리스트에서 해당 주문 ol_status 구매확정으로 변경
		ocService.updateStatus(ol_order_num, order_status);
		//리뷰 작성 가능 상품들 가져오기
		List<Map<String, String>> list = ocService.reviewReadyList(ol_order_num);
		model.addAttribute("list", list);
		return "mypage/my_review_list";
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
