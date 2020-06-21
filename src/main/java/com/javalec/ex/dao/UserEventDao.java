package com.javalec.ex.dao;

import java.sql.JDBCType;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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

@Repository
public interface UserEventDao {



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
	E_CommentDto checkECommentPW(E_CommentDto e_CommentDto);

	//댓글 새로 등록
	int insertEComment(E_CommentDto e_CommentDto);

	//회원 로그인 사용자 댓글 1개 수정
	int modifyEComment(E_CommentDto e_CommentDto);

	//회원 로그인 댓글 1개 삭제
	int deleteUserEcomment(int ec_num);
	

	
}
