package com.javalec.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.Cou_IssueDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.PointDto;
import com.javalec.ex.dto.WishListDto;

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
	
	// 장바구니에서 제품 삭제
	int cart_del(int p_num, int m_num);
	
	// 장바구니 업데이트 
	int cartUpdate(int m_num, int p_num, int p_amt);
	
	// 주문하기로 넘어가는 제품 payment_cart_tb에 삽입 
	int paymentCart(int m_num, int p_num, int p_amt);
	
	//  payment_cart_tb 비우기
	int delPaymentCart(int m_num);
	
	// 사용 가능  쿠폰 list 불러오기
	List<Cou_IssueDto> getAllCou(int m_num);
	
	// 쿠폰 사용 내역 list 불러오기 
	List<Cou_IssueDto> getUsedCou(int m_num);
	
	// 적립 포인트 총 합
	int totalSavePoint(int m_num);
	
	// 포인트 적립 내역 list 가져오기
	List<PointDto> getSavePoint(int m_num);
	
	// 사용 포인트 총 합
	int totalUsedPoint(int m_num);
	
	// 포인트 사용 내역 list 가져오기
	List<PointDto> getUsedPoint(int m_num);
	
	// 위시리스트에 저장된 상품 list 가져오기
	List<WishListDto> getAllWish(int m_num);
	
	// 위시리스트에서 제품 삭제
	int del_wl(int p_num, int m_num);
	
	// 위시리스트에서 선택한 상품 장바구니로 이동
	int add_cart(int m_num, int p_num);
	
}

