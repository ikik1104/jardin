package com.javalec.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.EnjoyCoffeeDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.PageDto;
import com.javalec.ex.dto.ReviewAnswerDto;
import com.javalec.ex.dto.ReviewUserDto;

@Repository
public interface CommunityDao {
	
	//---------------------------------------  enjoy coffee   ---------------------------------
	
	
	
	//enjoy coffee 리스트
	List<EnjoyCoffeeDto> enjoy_List(@Param("pageDto") PageDto pageDto);
	
	//enjoy coffee 조회수 증가
	void enjoy_hitUp(int ej_num);
		
	//enjoy coffee 게시글 개수 가져오기
	int countEnjoy();
	
	//이전글 제목
	EnjoyCoffeeDto getEnjoyPreTitle(@Param("rownum") int rownum);

	//다음글 제목
	EnjoyCoffeeDto getEnjoyNextTitle(@Param("rownum") int rownum);
	
	
	
	
	//-----------------------------------------    상품평           ----------------------------------------
	
	//상품평 가져오기
	List<HashMap<String, Object>> review_list(@Param("ru_type")String ru_type,@Param("pageDto")PageDto pageDto);
		
	//리뷰 상세보기
	Map<String, Object> review_detail(int ru_num);
	
	//리뷰 조회수 증가
	void review_hit(int ru_num);
	
	//리뷰의 타입별 전체 개수
	int countReview(String ru_type);
	
	//이전글제목
	ReviewUserDto getPreTitle(@Param("ru_type")String ru_type, @Param("rownum")int rownum);
	
	//다음글제목
	ReviewUserDto getNextTitle(@Param("ru_type")String ru_type, @Param("rownum")int rownum); 
	
	//리뷰 삭제하기
	int delReview(int ru_num);



}
