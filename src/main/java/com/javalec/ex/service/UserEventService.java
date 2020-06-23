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
	
	//진행중 이벤트 전체 리스트 가져오기
	List<AllDto> getAllEvents();

	//진행중 이벤트 1개 불러오기
	AllDto getEventBoard(EventDto eventDto);

	//해당 이벤트 댓글 전체 리스트 불러오기
	List<AllDto> getTheEComments(EventDto eventDto);

	//댓글 pw 체크
	int checkECommentPW(E_CommentDto e_CommentDto);

	//댓글 새로 등록
	int insertEComment(E_CommentDto e_CommentDto);

	//회원 로그인 사용자 댓글 1개 수정
	String modifyEComment(E_CommentDto e_CommentDto);
	
	//회원 로그인 사용자 댓글 1개 삭제
	int deleteUserEcomment(int ec_num);

	//진행중 이벤트에 쿠폰 있을 경우 쿠폰 가져오기
	AllDto getTheCoupon(EventDto eventDto);

	//회원 사용자 쿠폰 발급내역 확인
	int checkUserCoupon(int m_num, int co_num);
	
	//회원 사용자 유효기간 쿠폰 다운로드
	int downloadExCoupon(int m_num, int co_num, int co_expiry);
	
	//회원 사용자 기간제 쿠폰 다운로드
	int downloadPeriodCoupon(int m_num, int co_num, String co_start_day, String co_end_day);

	//종료된 이벤트 전체 리스트 가져오기
	List<AllDto> getAllFinEvents();

	//종료된 이벤트 1개 불러오기
	AllDto getFinEventBoard(EventDto eventDto);

	//종료된 이벤트에 쿠폰 있을 경우 쿠폰 가져오기
	AllDto getFinEventCoupon(EventDto eventDto);

	//당첨자 발표글 전체 리스트 불러오기
	List<AllDto> getAllWinBoard();	

}
