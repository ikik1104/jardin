package com.javalec.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;

@Repository
public interface AdminBoardDao {

	//관리자------------------------
	//faq작성 
	int insertFaq(FaqDto fdto);
	
	//faq수정
	void updateFaq(FaqDto fdto);
	
	//faq삭제
	int deleteFaq(int f_num);
	
	//faq 노출상태 변경
	int updateFaqDelflag(int f_num);
	
	//faq전체 리스트
	List<FaqDto> getAllFaqList();
	
	// faq하나의 정보
	FaqDto faqInfo(int f_num);
	
	//유저-------------------------
	//faq 리스트
	List<FaqDto> getFaqList();
}
