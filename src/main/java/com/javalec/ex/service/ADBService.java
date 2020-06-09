package com.javalec.ex.service;

import java.util.List;
import java.util.Map;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.E_CommentDto;
import com.javalec.ex.dto.EventDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.UtilDto;

public interface ADBService {
	
	/*
 	[관리자]
	1:1문의
	공지사항 
	이벤트
	*/
	
	//1:1문의 전체 리스트 불러오기
	List<AllDto> getAllBoards();
	
	//1:1문의 글 1개 삭제
	int deleteUserBoard(int iu_num);

	//1:1 답변 1개 불러오기
	AllDto getAnswerBoard(int iu_num);
	
	//1:1 답변 1개 작성(해당 문의글 답변상태 '답변완료'로 바꾸기 메소드 포함)
	int insertAnswerBoard(MtmAnswerDto mtmAnswerDto);
	
	//1:1 답변 1개 삭제(해당 문의글 답변상태 '답변대기'로 바꾸기 메소드 포함)
	int deleteAnswerBoard(int ia_num, int iu_num);	
	
	//1:1문의 답변 1개 수정
	int modifyAnswerBoard(MtmAnswerDto mtmAnswerDto);
	
	//공지사항 전체 리스트 불러오기
	List<AllDto> getAllNoticeBoards();

	//공지사항 새 글 1개 등록
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
	
	//특정 이벤트 댓글 가져오기
	List<AllDto> getEventComments(EventDto eventDto);
	
}
