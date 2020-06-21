package com.javalec.ex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.CartDto;
import com.javalec.ex.service.MP1Service;


@Controller
public class MP1Controller {

	@Autowired
	private MP1Service mp1Service;
	
	// 장바구니 페이지 
	@RequestMapping("cart")
	public String cart(HttpSession session, Model model) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		int m_num = (Integer)session.getAttribute("userNum");
		
		mp1Service.delPaymentCart(m_num);
		
		mypageInfo(session, model);
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
	
	// 나의 쿠폰 페이지
	@RequestMapping("mycoupon")
	public String mycoupon(HttpSession session, Model model) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		int m_num = (Integer)session.getAttribute("userNum");
		
		mypageInfo(session, model);
		
		// 사용 가능  쿠폰 list 불러오기
		model.addAttribute("couponlist", mp1Service.getAllCou(m_num));
		
		// 쿠폰 사용 내역 list 불러오기 
		model.addAttribute("usedlist", mp1Service.getUsedCou(m_num));
		
		return "mypage/coupon";
	}
	
	// 나의 포인트 페이지
	@RequestMapping("mypoint")
	public String mypoint(HttpSession session, Model model) {
		
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		int m_num = (Integer)session.getAttribute("userNum");
		
		mypageInfo(session, model);
		
		// 적립 포인트 총 합
		model.addAttribute("totalSavePoint", mp1Service.totalSavePoint(m_num));
		// 포인트 적립 내역 list 가져오기
		model.addAttribute("savePoint", mp1Service.getSavePoint(m_num));
		// 사용 포인트 총 합
		model.addAttribute("totalUsedPoint", mp1Service.totalUsedPoint(m_num));
		// 포인트 사용 내역 list 가져오기
		model.addAttribute("usedPoint", mp1Service.getUsedPoint(m_num));
		
		return "mypage/point";
	}
	
	// 위시리스트 페이지
	@RequestMapping("wishlist")
	public String wishlist(HttpSession session, Model model) {
			
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		int m_num = (Integer)session.getAttribute("userNum");
		
		mypageInfo(session, model);
			
		model.addAttribute("allWishlist", mp1Service.getAllWish(m_num));
			
		return "mypage/wishlist";
	}	
		
	// 위시리스트 상품 삭제
	@ResponseBody
	@RequestMapping("del_wishlist")
	public int del_wishlist(@RequestBody int[] arr, Model model) {
			
		int success = mp1Service.del_wl(arr[0],arr[1]);
			
		return success;
	}
	
	// 위시리스트에서 선택한 상품을 장바구니로 이동
	@ResponseBody
	@RequestMapping("go_cart")
	public int go_cart(@RequestBody int[] arr, Model model) {
			
		// 장바구니 제품 list 불러오기
		List<CartDto> cDto = mp1Service.getAllCart(arr[0]);
		
		int success=0;
		int count=0;
		
		for(int i=0; i<cDto.size(); i++) {
			int p_num = cDto.get(i).getP_num();
			if(p_num==arr[1]) {
				count+=1; 
			}
		}
		
		if(count==0) {
			success = mp1Service.add_cart(arr[0],arr[1]);
		}else {
			success= 1;
		}
		
		mp1Service.del_wl(arr[1],arr[0]);

		return success;
	}
			
	
	// 마이페이지 상단 공통 정보
	public void mypageInfo(HttpSession session, Model model) {
		int m_num = (Integer)session.getAttribute("userNum");
		String m_id = (String)session.getAttribute("userID");
		
		// 회원 아이디
		model.addAttribute("m_id", m_id);
		// 회원 보유 쿠폰 수 카운트
		model.addAttribute("coupon", mp1Service.getCouponCount(m_num));
		// 회원 보유 포인트 불러오기
		model.addAttribute("memDto", mp1Service.getMemInfo(m_num));
		// 회원 주문건수 카운트
		model.addAttribute("order", mp1Service.getOrderCount(m_num));
	}
	
}
