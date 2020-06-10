package com.javalec.ex.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.PageDto;

public interface MtmService {

	int countInquiry(int m_num);//특정 회원의 문의글수
	List<MtmUserDto> getAllInquiry(int m_num, PageDto pageDto);
	int countSearchInquiry(int m_num, String option, String search);//특정 회원 + 검색 문의글수
	List<MtmUserDto> getSearchInquiry(int m_num, PageDto pageDto, String option, String search); //list페이지 전체 1:1문의 목록
	MtmUserDto getOneInquiry(int iu_num);
	MtmAnswerDto getOneAnswer(int iu_num);
	MtmUserDto getPreTitle(int m_num, int rownum);
	MtmUserDto getNextTitle(int m_num, int rownum);
	void insertInquiry(MtmUserDto mtmUserDto); //글쓰기 등록 
	MtmUserDto modifyView(int iu_num); //문의 수정 보기
	void modifyInquiry(MtmUserDto mtmUserDto); //문의 수정 보기
	int deleteInquiry(int iu_num); //문의 삭제
	
}
