package com.javalec.ex.service;

import java.sql.JDBCType;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.AdminCouponDao;
import com.javalec.ex.dao.UserCustomerDao;
import com.javalec.ex.dao.UserEventDao;
import com.javalec.ex.dao.UserMemberDao;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.E_CommentDto;
import com.javalec.ex.dto.EventDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;

@Service
public class UserEventServiceImp implements UserEventService {

	/*
	 * [사용자]
	 * 이벤트
	 * */
	
	@Autowired
	UserEventDao edao;

	//이벤트 전체리스트 가져오기
	public List<AllDto> getAllEvents() {
		return edao.getAllEvents();
	}

	//이벤트 1개 불러오기
	public AllDto getEventBoard(EventDto eventDto) {
		return edao.getEventBoard(eventDto);
	}

	//해당 이벤트 댓글 전체 리스트 불러오기
	public List<AllDto> getTheEComments(EventDto eventDto) {
		return edao.getTheEComments(eventDto);
	}

	//댓글 pw 체크
	public int checkECommentPW(E_CommentDto e_CommentDto) {
		int success = 0;
		 E_CommentDto edto =edao.checkECommentPW(e_CommentDto);
		 System.out.println(edto.getEc_pw());
		 if(!(edto.getEc_pw().equals("-"))) {
			 //비밀번호 일치
			 success=1;
		 }
		return success;
	}

	//댓글 새로 등록
	public int insertEComment(E_CommentDto e_CommentDto) {
		return edao.insertEComment(e_CommentDto);
	}

	


	
}
