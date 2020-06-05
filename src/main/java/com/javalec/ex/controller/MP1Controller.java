package com.javalec.ex.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.service.MP1Service;

@Controller
public class MP1Controller {

	@Autowired
	MP1Service mp1Service;
	
	// 장바구니 페이지 
	@RequestMapping("cart")
	public String cart(HttpServletRequest request, Model model) {
		
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		
//		if(session.getAttribute("m_num")==null) {
//			return "member/login";
//		}
		
		//  payment_cart_tb 비우기
		mp1Service.delPaymentCart(m_num);
		// 회원 보유 쿠폰 수 카운트
		model.addAttribute("coupon", mp1Service.getCouponCount(m_num));
		// 회원 보유 포인트 불러오기
		model.addAttribute("memDto", mp1Service.getMemInfo(m_num));
		// 회원 주문건수 카운트
		model.addAttribute("order", mp1Service.getOrderCount(m_num));
		// 장바구니 제품 list 불러오기
		model.addAttribute("cartlist", mp1Service.getAllCart(m_num));
		
		return "mypage/cart";
	}
	
	// 장바구니 제품  삭제처리
	@ResponseBody
	@RequestMapping("cart_del")
	public int cart_del(@RequestBody int[] aa, Model model) {
		
		int success = mp1Service.cart_del(aa[0],aa[1]);
		
		return success;
	}
	

	// 주문/결제 페이지로 장바구니에 포함된 제품 전체 정보 & 회원 정보  불러오기 
	@ResponseBody
	@RequestMapping("cartUpdate")
	public int cartUpdate(@RequestBody int[] info, Model model) {
		
		//  payment_cart_tb 비우기
		mp1Service.delPaymentCart(info[0]);
		// 장바구니 업데이트 
		int success = mp1Service.cartUpdate(info[0], info[1], info[2]);
		// 주문하기로 넘어가는 제품 payment_cart_tb에 삽입 
		mp1Service.paymentCart(info[0], info[1], info[2]);
		return success;
	}
	
}
