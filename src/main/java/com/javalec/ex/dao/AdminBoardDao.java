package com.javalec.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.EnjoyCoffeeDto;
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
	
	//faq 검색
	List<FaqDto> getSearchFaq(HashMap<String, Object> map);

	//enjoy coffee----------------------------------------
	
	//enjoy coffee insert
	void enjoy_insert(EnjoyCoffeeDto ecDto);

	//enjoy coffee 한개의 정보 (상세보기, 수정에 쓰임)
	EnjoyCoffeeDto enjoy_info(int ej_num);

	//enjoy coffee update
	int enjoy_update(EnjoyCoffeeDto ecDto);

	//enjoy coffee 완전 삭제
	int enjoy_delete(int ej_num);

	//enjoy coffee 전체 리스트(관리자)
	List<EnjoyCoffeeDto> enjoy_allList();

	//검색
	List<EnjoyCoffeeDto> getSearchEnjoy(HashMap<String, Object> map);

	//상품 후기----------------------------------------------------------
	//포토후기 가져오기
	List<EnjoyCoffeeDto> getPhotoReveiw();
	
	//일반후기 가져오기
	public List<EnjoyCoffeeDto> getAllReveiw(String ru_type);
	
	//후기 노출여부 변경
	void updateStatus(int ru_num);
	
}
