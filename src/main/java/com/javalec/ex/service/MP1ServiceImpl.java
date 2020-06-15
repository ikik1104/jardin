package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.MP1Dao;
import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.Cou_IssueDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.PointDto;

@Service
public class MP1ServiceImpl implements MP1Service {

	@Autowired
	MP1Dao mp1Dao;

	// 회원 보유 쿠폰 수 카운트
	@Override
	public int getCouponCount(int m_num) {
		return mp1Dao.getCouponCount(m_num);
	}
	
	// 회원 보유 포인트 불러오기
	@Override
	public MemberDto getMemInfo(int m_num) {
		return mp1Dao.getMemInfo(m_num);
	}
	
	// 회원 주문건수 카운트
	@Override
	public int getOrderCount(int m_num) {
		return mp1Dao.getOrderCount(m_num);
	}
	
	// 장바구니 제품 list 불러오기
	@Override
	public List<CartDto> getAllCart(int m_num) {
		return mp1Dao.getAllCart(m_num);
	}

	// 장바구니에서 제품 삭제
	@Override
	public int cart_del(int p_num, int m_num) {
		return mp1Dao.cart_del(p_num, m_num);
	}
	// 장바구니 업데이트 
	@Override
	public int cartUpdate(int m_num, int p_num, int p_amt) {
	
		return mp1Dao.cartUpdate(m_num, p_num, p_amt);
	}

	// 주문하기로 넘어가는 제품 payment_cart_tb에 삽입 
	@Override
	public int paymentCart(int m_num, int p_num, int p_amt) {
		
		return mp1Dao.paymentCart(m_num, p_num, p_amt);
		
	}
	
	//  payment_cart_tb 비우기
	@Override
	public int delPaymentCart(int m_num) {
		return mp1Dao.delPaymentCart(m_num);
	}

	// 사용 가능  쿠폰 list 불러오기
	@Override
	public List<Cou_IssueDto> getAllCou(int m_num) {
		return mp1Dao.getAllCou(m_num);
	}
	
	// 쿠폰 사용 내역 list 불러오기 
	@Override
	public List<Cou_IssueDto> getUsedCou(int m_num) {
		return mp1Dao.getUsedCou(m_num);
	}
	
	// 적립 포인트 총 합
	@Override
	public int totalSavePoint(int m_num) {
		return mp1Dao.totalSavePoint(m_num);
	}
	
	// 포인트 적립 내역 list 가져오기
	@Override
	public List<PointDto> getSavePoint(int m_num) {
		return mp1Dao.getSavePoint(m_num);
	}

	// 사용 포인트 총 합
	@Override
	public int totalUsedPoint(int m_num) {
		return mp1Dao.totalUsedPoint(m_num);
	}
	
	// 포인트 사용 내역 list 가져오기
	@Override
	public List<PointDto> getUsedPoint(int m_num) {
		return mp1Dao.getUsedPoint(m_num);
	}


	
}
