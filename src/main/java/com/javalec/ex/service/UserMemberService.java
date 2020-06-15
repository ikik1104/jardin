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

	ReceiverDto nonmemberLogin(ReceiverDto receiverDto);



}
