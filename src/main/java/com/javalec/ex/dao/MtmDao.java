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
	List<MtmUserDto> getPreTitle(int iu_rownum); //이전글제목
	List<MtmUserDto> getNextTitle(int iu_rownum); //다음글제목
	
	
}
