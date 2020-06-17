package com.javalec.ex.service;

import java.sql.JDBCType;
import java.util.List;

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

public interface UserEventService {



	/*
	 * [사용자]
	 * 이벤트
	 * */
	
	//이벤트 전체 리스트 가져오기
	List<AllDto> getAllEvents();

	//이벤트 1개 불러오기
	AllDto getEventBoard(EventDto eventDto);

	//해당 이벤트 댓글 전체 리스트 불러오기
	List<AllDto> getTheEComments(EventDto eventDto);

	//댓글 pw 체크
	int checkECommentPW(E_CommentDto e_CommentDto);

}
