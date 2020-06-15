package com.javalec.ex.dao;

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

	//주문자명 체크
	AllDto checkOrderName(@Param("receiverDto") ReceiverDto receiverDto, @Param("memberDto") MemberDto memberDto);
	
	//주문번호 체크
	AllDto checkOrderNum(@Param("receiverDto") ReceiverDto receiverDto, @Param("memberDto") MemberDto memberDto);
	
}
