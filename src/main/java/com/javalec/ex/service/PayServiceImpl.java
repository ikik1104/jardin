package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.PayDao;
import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.MemberDto;

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
	


}
