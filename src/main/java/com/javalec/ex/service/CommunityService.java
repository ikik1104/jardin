package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.EnjoyCoffeeDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.PageDto;
import com.javalec.ex.dto.ReviewAnswerDto;
import com.javalec.ex.dto.ReviewUserDto;

public interface CommunityService {

	//---------------------------------------  enjoy coffee   ---------------------------------
	
	//enjoy coffee 리스트
	List<EnjoyCoffeeDto> enjoy_List();
		
	//enjoy coffee 조회수 증가
	void enjoy_hitUp(int ej_num);

	
	//-----------------------------------------    상품평           ----------------------------------------
	
	//상품평 가져오기
	List<HashMap<String, Object>> review_list(String ru_type, PageDto pageDto);
	
	//리뷰 상세보기
	Map<String, Object> review_detail(int ru_num);
	
	//리뷰 조회수 증가
	void review_hit(int ru_num);

	//리뷰의 타입별 전체 개수
	int countReview(String ru_type);

	//이전글 제목 가져오기
	ReviewUserDto getPreTitle(String ru_type, int rownum);

	//다음주 제목 가져오기
	ReviewUserDto getNextTitle(String ru_type, int rownum);

	//리뷰 삭제하기
	int delReview(int ru_num);

		

		
		
		

		
	
	
}
