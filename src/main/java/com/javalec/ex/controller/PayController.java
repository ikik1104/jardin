package com.javalec.ex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.javalec.ex.service.PayService;

@Controller
public class PayController {

	@Autowired
	PayService payService;
	
	
	// 주문/결제 페이지로 장바구니에 포함된 제품 전체 정보 & 회원 정보  불러오기 
	@RequestMapping("payment")
	public String payment(HttpServletRequest request, Model model) {
		
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		
		model.addAttribute("cartlist", payService.getAllCart1(m_num));
		model.addAttribute("memDto", payService.getMemInfo1(m_num));
		model.addAttribute("p_couponCount", payService.p_couponCount(m_num));
		model.addAttribute("c_couponCount", payService.c_couponCount(m_num));
		model.addAttribute("d_couponCount", payService.d_couponCount(m_num));
		model.addAttribute("cartCoupon", payService.getCartCou(m_num));
		model.addAttribute("deliveryCoupon", payService.getDeliveryCou(m_num));
		
		return "payment/payment";
	}
	
	// 
	@RequestMapping("coupon_list")
	public String coupon_list(HttpServletRequest request, Model model) {
		
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		
		model.addAttribute("cartlist", payService.getAllCart1(m_num));
		model.addAttribute("memDto", payService.getMemInfo1(m_num));
		model.addAttribute("couponlist", payService.getAllCou(m_num));
		
		return "payment/coupon_list";
	}
	
}
