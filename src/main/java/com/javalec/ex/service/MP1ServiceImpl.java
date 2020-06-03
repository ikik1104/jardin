package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.MP1Dao;
import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.MemberDto;

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

}
