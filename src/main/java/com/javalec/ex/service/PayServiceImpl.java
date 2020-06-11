package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.PayDao;
import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.Cou_IssueDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.OrderListDto;
import com.javalec.ex.dto.ReceiverDto;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	PayDao payDao;
	
	// 주문 예정 제품 모두 불러오기
	@Override
	public List<CartDto> getAllCart1(int m_num) {
		return payDao.getAllCart1(m_num);
	}

	// 회원 정보 불러오기
	@Override
	public MemberDto getMemInfo1(int m_num) {
		return payDao.getMemInfo1(m_num);
	}
	
	// 회원 보유 쿠폰 정보 불러오기
	@Override
	public List<Cou_IssueDto> getAllCou(int m_num) {
		return payDao.getAllCou(m_num);
	}
	
	// 회원 보유한 장바구니 쿠폰 정보 불러오기
	@Override
	public List<Cou_IssueDto> getCartCou(int m_num) {
		return payDao.getCartCou(m_num);
	}
	
	// 회원 보유한 배송비무료 쿠폰 정보 불러오기
	@Override
	public List<Cou_IssueDto> getDeliveryCou(int m_num) {
		return payDao.getDeliveryCou(m_num);
	}
	
	// 보유한 제품 쿠폰 수 카운트
	@Override
	public int p_couponCount(int m_num) {
		return payDao.p_couponCount(m_num);
	}

	// 보유한 장바구니 쿠폰 수 카운트
	@Override
	public int c_couponCount(int m_num) {
		return payDao.c_couponCount(m_num);
	}

	// 보유한 배송무료 쿠폰 수 카운트
	@Override
	public int d_couponCount(int m_num) {
		return payDao.d_couponCount(m_num);
	}
	
	// 주문하기에서 회원정보 업데이트
	@Override
	public int changeInfo(MemberDto memberDto) {
		return payDao.changeInfo(memberDto);
	}
	
	// 주문리스트(Orderlist) 등록
	@Override
	public int insertOrderList(OrderListDto olDto) {
		return payDao.insertOrderList(olDto);
	}
	
	// 주무자/수취자 정보 등록
	@Override
	public int insertOrReInfo(ReceiverDto reDto) {
		return payDao.insertOrReInfo(reDto);
	}



}
