package com.javalec.ex.dao;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.MemberDto;

@Repository
public interface LeaveDao {

	int memberLeave(MemberDto memberDto); // 회원 탈퇴
	
}
