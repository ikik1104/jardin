package com.javalec.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.MemberDto;

@Repository
public interface MP1Dao {
	
	// 회원 보유 쿠폰 수 카운트
	int getCouponCount(int m_num); 

	// 회원 보유 포인트 불러오기
	MemberDto getMemInfo(int m_num);
	
	// 회원 주문건수 카운트
	int getOrderCount(int m_num);
	
	// 장바구니 제품 list 불러오기
	List<CartDto> getAllCart(int m_num);
	
}

