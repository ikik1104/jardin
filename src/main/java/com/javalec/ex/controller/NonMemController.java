package com.javalec.ex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.ex.service.NonMemService;
import com.javalec.ex.service.OrderCheckService;

@Controller
public class NonMemController {

	@Autowired
	NonMemService nmService;
	@Autowired
	OrderCheckService ocService;
	
	//로그인 비회원 조회 버튼
	@RequestMapping("nonmember_ordercheck")
	public String non_ordercheck(HttpServletRequest request, Model model) {
		String order_num = request.getParameter("orderNum");
		List<Map<String, String>> orderlist = nmService.getAllNonOrder(order_num);
		model.addAttribute("orderlist", orderlist);
		return "nonmember/ordercheck";
	}
	
	//주문상세조회 
	@RequestMapping("non_order_statement")
	public String non_order_statement(@RequestParam("ol_order_num") String ol_order_num, Model model) {
		List<Map<String, String>> plist = ocService.proInOneOrder(ol_order_num); //주문 상품 가져오기
		Map<String, String> ilist = ocService.orderInfoDetail(ol_order_num); //결제, 배송지 정보 가져오기
		List<Map<String, String>> clist = ocService.cancelInfoDetail(ol_order_num); //취소 상품 가져오기
		List<Map<String, String>> tflist = ocService.rtrfInfoDetail(ol_order_num); //반품 상품 가져오기
		model.addAttribute("plist", plist);
		model.addAttribute("ilist", ilist);
		model.addAttribute("clist", clist);
		model.addAttribute("tflist", tflist);
		return "nonmember/non_order_statement";
	}
	
	//비회원 반품신청 //입금완료 - 결제취소
	@RequestMapping("non_list_for_refund")
	public String list_for_refund(Model model, HttpSession session, @RequestParam("ol_order_num") String ol_order_num) {
		List<Map<String, String>> list = ocService.getOneSetOrder(ol_order_num);
		model.addAttribute("list", list);
		return "mypage/list_for_refund";
	}
	
	
}
