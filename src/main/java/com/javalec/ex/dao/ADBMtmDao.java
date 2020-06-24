package com.javalec.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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

@Repository
public interface ADBMtmDao {
	
	/*
	[관리자]
	1:1문의
	공지사항 
	이벤트(당첨자 게시글 포함)
	*/
	
	//1:1문의 전체 리스트 불러오기
	List<AllDto> getAllBoards();
	
	//1:1 문의 글 1개 삭제
	int deleteUserBoard(int iu_num);

	//1:1 문의글 1개 불러오기
	AllDto getMtmUserBoard(MtmUserDto mtmUserDto);	
	
	//1:1 답변 1개 불러오기
	AllDto getAnswerBoard(int iu_num);

	//1:1 답변 1개 작성
	int insertAnswerBoard(MtmAnswerDto mtmAnswerDto);
	
	//1:1 문의 답변상태 '답변완료'로 변경
	int updateStatusFinish(MtmAnswerDto mtmAnswerDto); 
	
	//1:1 답변 1개 삭제
	int deleteAnswerBoard(int ia_num);
	
	//1:1 문의 답변상태 '답변대기'로 변경
	int updateStatusWait(int iu_num);
	
	//1:1문의 답변 1개 수정
	int modifyAnswerBoard(MtmAnswerDto mtmAnswerDto);
	
	//공지사항 전체 리스트 불러오기
	List<AllDto> getAllNoticeBoards(); 
	
	//공지사항 새글 1개 등록
	int insertNoticeBoard(NoticeDto noticeDto);
	
	//공지글 1개 불러오기
	AllDto getNoticeBoard(int no_num);
	
	//공지글 1개 수정
	int modifyNoticeBoard(NoticeDto noticeDto);
	
	//공지글 1개 삭제
	int deleteNoticeBoard(int no_num);
	
	//이벤트 전체 리스트 불러오기
	List<AllDto> getAllEventBoards();
	
	//이벤트 새 글 1개 등록
	int insertEventBoard(UtilDto utilDto);
	
	//이벤트 글 1개 가져오기
	AllDto getEventBoard(EventDto eventDto);
	
	//특정 이벤트 댓글 모두 가져오기
	List<AllDto> getEventComments(EventDto eventDto);
	
	//이벤트글 1개 수정
	int modifyEventBoard(UtilDto utilDto);
	
	//이벤트글 1개 삭제
	int deleteEventBoard(int e_num);
	
	//이벤트 신청자 전체 리스트 불러오기(회원, 이벤트 정보도 포함)
	List<AllDto> getApplicants();
	
	//이벤트 신청자 당첨 처리
	int winApplicant(int ec_num);
	
	//이벤트 신청자 미당첨 처리
	int backApplicant(int ec_num);

	//당첨자 게시글 전체 리스트 불러오기
	List<AllDto> getAllWinBoards();

	//당첨자 게시글 1개 불러오기
	AllDto getWinBoard(WinBoardDto winBoardDto);

	//당첨자 게시글 1개 수정
	int modifyWinBoard(WinBoardDto winBoardDto);

	//당첨자 게시글 1개 삭제
	int deleteWinBoard(int wb_num);

	//당첨자 게시글 1개 등록
	int insertWinBoard(WinBoardDto winBoardDto);

	//선택한 1:1문의 일괄 삭제
	int deleteSomeMtms(@Param("chkArray") int[] chkArray);

	//선택한 1:1문의 일괄 삭제
	int deleteSomeNotice(@Param("chkArray") int[] chkArray);


	
}
