package com.javalec.ex.service;

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

	//비회원 주문조회 로그인
	public ReceiverDto nonmemberLogin(ReceiverDto receiverDto) {
		String m_name =receiverDto.getM_name();System.out.println(m_name);
		String ol_order_num = receiverDto.getOl_order_num();		System.out.println(ol_order_num);
		
		ReceiverDto name_fromDB = mdao.checkOrderName(m_name, ol_order_num);
		System.out.println(name_fromDB.getM_name());		
		if(name_fromDB.getM_name().equals("-")) {
			//주문자명 불일치
			return name_fromDB;
		}
		System.out.println("주문자명 일치");
		ReceiverDto num_fromDB = mdao.checkOrderNum(m_name, ol_order_num);
		name_fromDB.setOl_order_num(num_fromDB.getOl_order_num());
		return name_fromDB;
		
	}



	
}
