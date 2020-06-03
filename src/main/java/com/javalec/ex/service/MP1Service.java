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
	
}
