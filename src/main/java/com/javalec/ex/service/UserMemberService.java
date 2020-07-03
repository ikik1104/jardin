package com.javalec.ex.service;

import java.sql.JDBCType;
import java.util.List;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;

public interface UserMemberService {


	/*
	 * [사용자]
	 * 회원
	 * */
	
	//회원 로그인
	AllDto memberLogin(MemberDto memberDto);

	//비회원 주문조회 로그인
	ReceiverDto nonmemberLogin(ReceiverDto receiverDto);

	//회원가입
	int memberJoin(MemberDto memberDto);

	//아이디 찾기
	MemberDto searchID(MemberDto memberDto);

	//비밀번호 찾기
	MemberDto searchPW(MemberDto memberDto);

	//회원가입 아이디 중복체크
	AllDto checkID(MemberDto memberDto);
	
	//비밀번호를 임시 비번으로 변경
	int updateMailPw(MemberDto memberDto);



}
