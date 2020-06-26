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

@Service
public class UserEventServiceImp implements UserEventService {

	/*
	 * [사용자]
	 * 이벤트
	 * */
	
	@Autowired
	UserEventDao edao;

	//진행중 이벤트 전체리스트 가져오기
	public List<AllDto> getAllEvents() {
		return edao.getAllEvents();
	}

	//진행중 이벤트 1개 불러오기
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

	//회원 로그인 사용자 댓글 1개 수정
	public String modifyEComment(E_CommentDto e_CommentDto) {
		String result="";
		int success = edao.modifyEComment(e_CommentDto);//수정
		if(success==1) {
			result=e_CommentDto.getEc_content();
		} else {
			result=null;
		}
		return result;
	}

	//회원 로그인 댓글 1개 삭제
	public int deleteUserEcomment(int ec_num) {
		return edao.deleteUserEcomment(ec_num);
	}

	//진행중 이벤트에 쿠폰 있을 경우 쿠폰 정보 가져오기
	public AllDto getTheCoupon(EventDto eventDto) {
		return edao.getTheCoupon(eventDto);
	}
	//회원 사용자 쿠폰 발급내역 확인
	public int checkUserCoupon(int m_num, int co_num) {
		int success=0;
		Cou_IssueDto cidto = edao.checkUserCoupon(m_num, co_num);
		if(cidto.getCi_num()==-99) success=1;//발급받은 적 없는 경우 발급해도 좋다는 신호
		System.out.println(success);
		return success;
	}

	//회원 사용자 유효기간 쿠폰 다운로드
	public int downloadExCoupon(int m_num, int co_num, int co_expiry) {
		int success = checkUserCoupon(m_num, co_num);
		if(success==1) {
			//발급받은 적 없는 경우
			success = edao.downloadExCoupon(m_num,co_num, co_expiry);
			//발급 실패할 경우 success=0;
		} else if(success==0){
			//발급받은 적 있는 경우
			success=-1;
		}
		System.out.println(success);
		return success;
	}

	//회원 사용자 기간제 쿠폰 다운로드
	public int downloadPeriodCoupon(int m_num, int co_num, String co_start_day, String co_end_day) {
		int success = checkUserCoupon(m_num, co_num);		
		if(success==1) {
			//발급받은 적 없는 경우
			success = edao.downloadPeriodCoupon(m_num,co_num,co_start_day, co_end_day) ;
			//발급 실패할 경우 success=0;
		} else if(success==0) {
			//발급받은 적 있는 경우
			success=-1;
		}		
		System.out.println(success);
		return success;
	}

	//종료 이벤트 전체 리스트 가져오기
	public List<AllDto> getAllFinEvents() {
		return edao.getAllFinEvents();
	}

	//종료된 이벤트 1개 불러오기
	public AllDto getFinEventBoard(EventDto eventDto) {
		return edao.getFinEventBoard(eventDto);
	}

	//종료된 이벤트 쿠폰 가져오기
	public AllDto getFinEventCoupon(EventDto eventDto) {
		return edao.getFinEventCoupon(eventDto);
	}

	//당첨자 발표글 전체 리스트 불러오기
	public List<AllDto> getAllWinBoard() {
		return edao.getAllWinBoard();
	}

	//당첨자 발표글 1개 불러오기
	public AllDto getTheWinboard(WinBoardDto winBoardDto) {
		edao.updateWinHit(winBoardDto);//해당 글 조회수 높이기
		AllDto alldto = edao.getTheWinboard(winBoardDto);
		if(alldto.getWinboarddto().getWb_title()!=null) {
			//발표글이 잘 넘어왔을 경우
		} else {
			//발표글 잘 안 넘어왔을 경우 조회수 높인 거 취소
			edao.downWinHit(winBoardDto);//해당 글 조회수 높이기
		}
		return alldto;
	}

	


	
}
