package com.javalec.ex.service;

import java.util.List;

import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.Cou_IssueDto;
import com.javalec.ex.dto.MemberDto;

public interface PayService {

	// 회원 정보 불러오기
	MemberDto getMemInfo1(int m_num);
	
	// 주문 예정 list 불러오기
	List<CartDto> getAllCart1(int m_num);
	
	// 회원 보유 쿠폰 정보 불러오기
	List<Cou_IssueDto> getAllCou(int m_num);
	
	// 회원 보유한 장바구니 쿠폰 정보 불러오기
	List<Cou_IssueDto> getCartCou(int m_num);
	
	// 회원 보유한 장바구니 쿠폰 정보 불러오기
	List<Cou_IssueDto> getDeliveryCou(int m_num);
	
	// 보유한 제품 쿠폰 수 카운트
	int p_couponCount(int m_num);
	
	// 보유한 장바구니 쿠폰 수 카운트
	int c_couponCount(int m_num);
	
	// 보유한 배송무료 쿠폰 수 카운트
	int d_couponCount(int m_num);
}
