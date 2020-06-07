package com.javalec.ex.dao;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.MemberDto;

@Repository
public interface ChangeInfoDao {

	MemberDto getOneInfo(int m_num); //회원정보 가져오기
//	String // 기존비번 일치체크
	
	
}
