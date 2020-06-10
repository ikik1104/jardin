package com.javalec.ex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.PageDto;

@Repository
public interface MtmDao {

	int countInquiry(int m_num);//특정 회원의 문의글수
	List<MtmUserDto> getAllInquiry(@Param("m_num")int m_num, @Param("pageDto")PageDto pageDto); //list페이지 전체 1:1문의 목록
	int countSearchInquiry(@Param("m_num")int m_num, @Param("option")String option, @Param("search")String search);//특정 회원 + 검색 문의글수
	List<MtmUserDto> getSearchInquiry(@Param("m_num")int m_num, @Param("pageDto")PageDto pageDto, @Param("option")String option, @Param("search")String search); //list페이지 전체 1:1문의 목록
	MtmUserDto getOneInquiry(int iu_num); //view페이지 질문
	MtmAnswerDto getOneAnswer(int iu_num); //view페이지 답변
	MtmUserDto getPreTitle(int m_num, int rownum); //이전글제목
	MtmUserDto getNextTitle(int m_num, int rownum); //다음글제목
	void insertInquiry(MtmUserDto mtmUserDto); //문의 등록 
	MtmUserDto modifyView(int iu_num); //문의 수정 보기
	void modifyInquiry(MtmUserDto mtmUserDto); //문의 수정 등록
	int deleteInquiry(int iu_num); //문의 삭제
	
	
}
