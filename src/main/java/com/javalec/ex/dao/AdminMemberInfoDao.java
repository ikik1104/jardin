package com.javalec.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.MemberDto;

@Repository
public interface AdminMemberInfoDao {

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
	
}
