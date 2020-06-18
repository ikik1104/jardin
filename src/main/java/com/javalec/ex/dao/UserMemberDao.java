package com.javalec.ex.dao;

import java.sql.JDBCType;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;

@Repository
public interface UserMemberDao {


	/*
	 * [사용자]
	 * 회원
	 * */
	
	//아이디 체크
	AllDto checkID(MemberDto memberDto);
	
	//비밀번호 체크
	AllDto checkPW(MemberDto memberDto);

	//비회원 주문자명 비교
   ReceiverDto checkName(ReceiverDto receiverDto);

   //비회원 주문번호 비교
	ReceiverDto checkNum(ReceiverDto receiverDto);

	//회원가입
	int memberJoin(MemberDto memberDto);

	//아이디 찾기
	MemberDto searchID(MemberDto memberDto);

	//비밀번호 찾기
	MemberDto searchPW(MemberDto memberDto);	
	
	


	
}
