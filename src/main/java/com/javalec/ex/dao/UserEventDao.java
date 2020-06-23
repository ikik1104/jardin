package com.javalec.ex.dao;

import java.sql.JDBCType;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.Cou_IssueDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.E_CommentDto;
import com.javalec.ex.dto.EventDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.dto.WinBoardDto;

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

	//진행중 이벤트에 쿠폰 가져오기
	AllDto getTheCoupon(EventDto eventDto);

	//삭제 예정
	List<E_CommentDto> comment_List();

	//삭제 예정2
	void comment_delete(int ec_num);
	
	//회원 사용자 쿠폰 발급내역 확인
	Cou_IssueDto checkUserCoupon(@Param("m_num") int m_num, @Param("co_num") int co_num);

	//회원 사용자 유효기간 쿠폰 다운로드
	int downloadExCoupon(@Param("m_num") int m_num, @Param("co_num") int co_num, @Param("co_expiry") int co_expiry);

	//회원 사용자 기간제 쿠폰 다운로드
	int downloadPeriodCoupon(@Param("m_num") int m_num, @Param("co_num") int co_num, @Param("co_start_day") String co_start_day, @Param("co_end_day") String co_end_day);

	//종료된 이벤트 전체 리스트 가져오기
	List<AllDto> getAllFinEvents();

	//종료된 이벤트 1개 불러오기
	AllDto getFinEventBoard(EventDto eventDto);

	//종료된 이벤트 쿠폰 가져오기
	AllDto getFinEventCoupon(EventDto eventDto);

	//당첨자 발표글 전체 리스트 불러오기
	List<AllDto> getAllWinBoard();

	//당첨자 발표글 1개 가져오기
	AllDto getTheWinboard(WinBoardDto winBoardDto);
	
	

	
}
