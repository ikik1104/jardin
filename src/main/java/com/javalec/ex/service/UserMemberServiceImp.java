package com.javalec.ex.service;

import java.sql.JDBCType;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.AdminCouponDao;
import com.javalec.ex.dao.UserMemberDao;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;

@Service
public class UserMemberServiceImp implements UserMemberService {

	@Autowired
	UserMemberDao mdao;

	//회원 로그인
	public AllDto memberLogin(MemberDto memberDto) {
		AllDto id_fromDB = mdao.checkID(memberDto);
		if(id_fromDB.getMemberdto().getM_id().equals("-")) {
			//아이디 불일치
			return id_fromDB;
		}
		AllDto pw_fromDB = mdao.checkPW(memberDto);
		id_fromDB.getMemberdto().setM_pw(pw_fromDB.getMemberdto().getM_pw());
		return id_fromDB;
		
	}

	
	public ReceiverDto nonmemberLogin(ReceiverDto receiverDto) {
		//주문번호 체크
		ReceiverDto dto_forReturn = mdao.checkNum(receiverDto);
		if(dto_forReturn.getOl_order_num().equals("-")) {
			//주문번호 불일치할 경우
			return dto_forReturn;
		}
		System.out.println("주문번호 일치");
		
		ReceiverDto dto_forName = mdao.checkName(receiverDto);
		dto_forReturn.setM_name(dto_forName.getM_name());
		
		 return dto_forReturn;
	}


	//회원가입
	public int memberJoin(MemberDto memberDto) {
		return mdao.memberJoin(memberDto);
	}

	//아이디 찾기
	public MemberDto searchID(MemberDto memberDto) {
		return mdao.searchID(memberDto);
	}

	//비밀번호 찾기
	public MemberDto searchPW(MemberDto memberDto) {
		return mdao.searchPW(memberDto);
	}


	//회원가입 아이디 중복 체크
	public AllDto checkID(MemberDto memberDto) {
		return mdao.checkID(memberDto);
	}


	//비밀번호를 임시 비번으로 변경
	@Override
	public int updateMailPw(MemberDto memberDto) {
		return mdao.updateMailPw(memberDto);
	}

	



	
}
