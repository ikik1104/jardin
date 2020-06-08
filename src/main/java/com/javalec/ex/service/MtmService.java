package com.javalec.ex.service;

import java.util.List;

import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.PageDto;

public interface MtmService {

	int countInquiry(int m_num);//특정 회원의 문의글수
	List<MtmUserDto> getAllInquiry(int m_num, PageDto pageDto);
	MtmUserDto getOneInquiry(int iu_num);
	MtmAnswerDto getOneAnswer(int iu_num);
	MtmUserDto getPreTitle(int m_num, int rownum);
	MtmUserDto getNextTitle(int m_num, int rownum);
	void insertInquiry(MtmUserDto mtmUserDto); //글쓰기 등록 
	MtmUserDto modifyView(int iu_num); //문의 수정 보기
	void modifyInquiry(MtmUserDto mtmUserDto); //문의 수정 보기
	int deleteInquiry(int iu_num); //문의 삭제
	
}
