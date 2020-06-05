package com.javalec.ex.service;

import java.util.List;

import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.MemberDto;

public interface MP1Service {
	
	// 회원 보유 쿠폰 수 카운트
	int getCouponCount(int m_num); 

	// 회원 보유 포인트 불러오기
	MemberDto getMemInfo(int m_num);
	
	// 회원 주문건수 카운트
	int getOrderCount(int m_num);
	
	// 장바구니 제품 list 불러오기
	List<CartDto> getAllCart(int m_num);
	
	// 장바구니에서 제품 삭제
	int cart_del(int p_num, int m_num);

	// 장바구니 업데이트 
	int cartUpdate(int m_num, int p_num, int p_amt);
	
	// 주문하기로 넘어가는 제품 payment_cart_tb에 삽입 
	int paymentCart(int m_num, int p_num, int p_amt);
	
	//  payment_cart_tb 비우기
	int delPaymentCart(int m_num);
}
