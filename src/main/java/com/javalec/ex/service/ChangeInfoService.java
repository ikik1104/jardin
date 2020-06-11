package com.javalec.ex.service;

import com.javalec.ex.dto.MemberDto;

public interface ChangeInfoService {

	MemberDto getOneInfo(int m_num); // 회원정보 가져오기
	int pwChange(String pw_new, String m_id, String pw_ori); //비밀번호 업데이트
	int infoChange(MemberDto memberDto); // 회원정보 업데이트
	
}
