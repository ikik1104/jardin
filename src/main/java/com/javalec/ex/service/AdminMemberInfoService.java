package com.javalec.ex.service;

import java.util.List;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.MemberDto;

public interface AdminMemberInfoService {

	/*
 	[관리자]
	회원정보
	*/	
	
	//회원 전체 리스트 불러오기
	List<AllDto> getAllMembers();
	
	//회원 1명 정보 불러오기
	AllDto getMember(MemberDto memberDto);
	
	//회원 1명 정보 수정
	int modifyMember(MemberDto memberDto);
	
	//회원 1명 탈퇴 처리
	int deleteMember(int m_num);
	
	//휴면 회원 전체 불러오기(회원 일괄 휴면<->가입 전환)
	List<AllDto> getAllSleepMembers();
	
	//휴면 회원 정보 1개 불러오기
	AllDto getSleepMember(MemberDto memberDto);
	
}
