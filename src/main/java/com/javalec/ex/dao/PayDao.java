package com.javalec.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.MemberDto;

@Repository
public interface PayDao {
	
	// 회원 정보 불러오기
	MemberDto getMemInfo1(int m_num);

	// 주문 예정 list 불러오기
	List<CartDto> getAllCart1(int m_num);
	

}
