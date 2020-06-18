package com.javalec.ex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.service.PayService;

@Controller
public class PayController {

	@Autowired
	private PayService payService;
	
	// 주문/결제 페이지로 장바구니에 포함된 제품 전체 정보 & 회원 정보  불러오기 
	@RequestMapping("payment")
	public String payment(HttpServletRequest request, Model model) {
		
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		
		MemberDto memberDto = payService.getMemInfo1(m_num);
				
		//email 분리
		String email = memberDto.getM_email();
		int index = email.indexOf("@");
		model.addAttribute("email_id", email.substring(0, index));
		model.addAttribute("email_domain", email.substring(index+1));
		
		//휴대전화번호 분리
		String phoneSet = memberDto.getM_phone();
		String[] phone = phoneSet.split("-");
		for(int i=0; i<phone.length; i++) {
			model.addAttribute("phone"+(i+1), phone[i]);
		}
		
		//유션전화 분리
		String telSet = memberDto.getM_tel();
		String[] tel = telSet.split("-");
		for(int i=0; i<tel.length; i++) {
			model.addAttribute("tel"+(i+1), tel[i]);
		}
		
		model.addAttribute("cartlist", payService.getAllCart1(m_num));
		model.addAttribute("memDto", memberDto);
		model.addAttribute("p_couponCount", payService.p_couponCount(m_num));
		model.addAttribute("c_couponCount", payService.c_couponCount(m_num));
		model.addAttribute("d_couponCount", payService.d_couponCount(m_num));
		model.addAttribute("cartCoupon", payService.getCartCou(m_num));
		model.addAttribute("deliveryCoupon", payService.getDeliveryCou(m_num));
		
		return "payment/payment";
	}
	
	// 쿠폰 정보 불러오기 (자식창 용)
	@RequestMapping("coupon_list")
	public String coupon_list(HttpServletRequest request, Model model) {
		
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		
		model.addAttribute("cartlist", payService.getAllCart1(m_num));
		model.addAttribute("memDto", payService.getMemInfo1(m_num));
		model.addAttribute("couponlist", payService.getAllCou(m_num));
		
		return "payment/coupon_list";
	}

	// 주문자 회원정보 수정 
	@ResponseBody
	@RequestMapping("changeInfo")
	public int changeInfo(MemberDto memberDto, Model model) {
		int success=payService.changeInfo(memberDto);
		return success;
	}
	
	
	
}
