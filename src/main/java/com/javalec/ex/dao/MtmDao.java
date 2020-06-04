package com.javalec.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;

@Repository
public interface MtmDao {

	List<MtmUserDto> getAllInquiry(int m_num); //list페이지 전체 1:1문의 목록
	MtmUserDto getOneInquiry(int iu_num); //view페이지 질문
	MtmAnswerDto getOneAnswer(int iu_num); //view페이지 답변
	MtmUserDto getPreTitle(int m_num, int rownum); //이전글제목
	MtmUserDto getNextTitle(int m_num, int rownum); //다음글제목
	void insertInquiry(MtmUserDto mtmUserDto); //문의 등록 
	MtmUserDto modifyView(int iu_num); //문의 수정 보기
	void modifyInquiry(MtmUserDto mtmUserDto); //문의 수정 등록
	int deleteInquiry(int iu_num); //문의 삭제
	
	
}
