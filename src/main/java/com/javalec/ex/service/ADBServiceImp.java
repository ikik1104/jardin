package com.javalec.ex.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.ADBMtmDao;
import com.javalec.ex.dao.BDao;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.E_CommentDto;
import com.javalec.ex.dto.EventDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.dto.WinBoardDto;

@Service
public class ADBServiceImp implements ADBService {
	
	/*
	[관리자]
	1:1문의
	공지사항 
	이벤트(당첨자 게시글 포함)
	*/
	
	@Autowired
	ADBMtmDao adbmtmdao;

	//1:1문의 전체 리스트 불러오기
	@Override
	public List<AllDto> getAllBoards() {
		return adbmtmdao.getAllBoards();
	}
	
	//1:1문의 글 1개 삭제
	@Override
	public int deleteUserBoard(int iu_num) {
		int success = adbmtmdao.deleteUserBoard(iu_num);
		System.out.println(success);
		return success;
	}
	
	//1:1문의 글 1개 불러오기
	public AllDto getMtmUserBoard(MtmUserDto mtmUserDto) {
		return adbmtmdao.getMtmUserBoard(mtmUserDto) ;
	}
	
	//1:1 답변 1개 불러오기
	@Override
	public AllDto getAnswerBoard(int iu_num) {
		return adbmtmdao.getAnswerBoard(iu_num);		
	}

	//1:1 답변 1개 작성
	@Override
	public int insertAnswerBoard(MtmAnswerDto mtmAnswerDto) {
		int insert = adbmtmdao.insertAnswerBoard(mtmAnswerDto);//답변 등록
		int update = adbmtmdao.updateStatusFinish(mtmAnswerDto);//해당 1:1문의 '답변완료'로 변경
		int result=0;
		if(insert==1 & update==1) {
			result=1;
		} else {
			result=0;
		}
		return result;
	}

	//1:1 답변 1개 삭제
	public int deleteAnswerBoard(int ia_num, int iu_num){
		
		int delete = adbmtmdao.deleteAnswerBoard(ia_num);
		int update = adbmtmdao.updateStatusWait(iu_num);
		int result=0;
		if(delete==1 & update==1) {
			result=1;
		} else {
			result=0;
		}
		return result;
	}
	
	//1:1문의 답변 1개 수정
	public int modifyAnswerBoard(MtmAnswerDto mtmAnswerDto) {
		return adbmtmdao.modifyAnswerBoard(mtmAnswerDto);
	}

	//공지사항 전체 리스트 불러오기	
	@Override
	public List<AllDto> getAllNoticeBoards() {
		return adbmtmdao.getAllNoticeBoards();
	}

	//공지사항 새글 1개 등록
	@Override
	public int insertNoticeBoard(NoticeDto noticeDto) {
		return adbmtmdao.insertNoticeBoard(noticeDto);
	}

	//공지글 1개 불러오기
	@Override
	public AllDto getNoticeBoard(int no_num) {
		return adbmtmdao.getNoticeBoard(no_num);
	}

	//공지글 1개 수정
	@Override
	public int modifyNoticeBoard(NoticeDto noticeDto) {
		return adbmtmdao.modifyNoticeBoard(noticeDto);
	}

	//공지글 1개 삭제
	@Override
	public int deleteNoticeBoard(int no_num) {
		return adbmtmdao.deleteNoticeBoard(no_num);
	}

	//공지글 전체 리스트 불러오기
	@Override
	public List<AllDto> getAllEventBoards() {
		return adbmtmdao.getAllEventBoards();
	}

	//이벤트 새글 1개 등록
	@Override
	public int insertEventBoard(UtilDto utilDto) {
		return adbmtmdao.insertEventBoard(utilDto);
	}

	//이벤트 글 1개 가져오기
	@Override
	public AllDto getEventBoard(EventDto eventDto) {
		return adbmtmdao.getEventBoard(eventDto);
	}

	//특정 이벤트 댓글 가져오기
	@Override
	public List<AllDto> getEventComments(EventDto eventDto) {
		return adbmtmdao.getEventComments(eventDto);
	}

	//이벤트글 1개 수정
	@Override
	public int modifyEventBoard(UtilDto utilDto) {
		return adbmtmdao.modifyEventBoard(utilDto);
	}

	//이벤트글 1개 삭제
	@Override
	public int deleteEventBoard(int e_num) {
		return adbmtmdao.deleteEventBoard(e_num);
	}

	//이벤트 신청자 전체 리스트 불러오기(회원정보, 이벤트 정보 포함)
	@Override
	public List<AllDto> getApplicants() {
		return adbmtmdao.getApplicants();
	}

	//이벤트 신청자 당첨 처리
	@Override
	public int winApplicant(int ec_num) {
		return adbmtmdao.winApplicant(ec_num);
	}

	//이벤트 신청자 미당첨 처리
	@Override
	public int backApplicant(int ec_num) {
		return adbmtmdao.backApplicant(ec_num);
	}

	//당첨자 게시글 전체 리스트 불러오기
	public List<AllDto> getAllWinBoards() {
		return adbmtmdao.getAllWinBoards();
	}

	//당첨자 게시글 1개 불러오기
	public AllDto getWinBoard(WinBoardDto winBoardDto) {
		return adbmtmdao.getWinBoard(winBoardDto);
	}

	//당첨자 게시글 1개 수정
	public int modifyWinBoard(WinBoardDto winBoardDto) {
		return adbmtmdao.modifyWinBoard(winBoardDto);
	}

	//당첨자 게시글 1개 삭제
	public int deleteWinBoard(int wb_num) {
		return adbmtmdao.deleteWinBoard(wb_num);
	}

	//당첨자 게시글 1개 등록
	public int insertWinBoard(WinBoardDto winBoardDto) {
		return adbmtmdao.insertWinBoard(winBoardDto);
	}

	//선택한 1:1문의 일괄 삭제
	public int deleteSomeMtms(int[] chkArray) {
		return adbmtmdao.deleteSomeMtms(chkArray);
	}

	//선택한 공지글 일괄 삭제
	public int deleteSomeNotice(int[] chkArray) {
		return adbmtmdao.deleteSomeNotice(chkArray);
	}

	//선택한 이벤트글 일괄 삭제
	public int deleteSomeEvents(int[] chkArray) {
		return adbmtmdao.deleteSomeEvents(chkArray);
	}

	//선택한 신청자 일괄 삭제
	public int deleteSomeApplicants(int[] chkArray) {
		return adbmtmdao.deleteSomeApplicants(chkArray);
	}

	//선택 신청자 일괄 당첨/당첨 취소
	public int WinSomeApplicants(int[] chkArray) {
		return adbmtmdao.WinSomeApplicants(chkArray);
	}

	//댓글 1개 삭제
	public int deleteTheEcomment(int ec_num) {
		return adbmtmdao.deleteTheEcomment(ec_num);
	}
	
	
	

	

}
