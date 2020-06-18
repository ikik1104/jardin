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
import com.javalec.ex.dto.QnrAnswerDto;
import com.javalec.ex.dto.QnrUserDto;
import com.javalec.ex.dto.ReviewUserDto;

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
	List<ReviewUserDto> getPhotoReveiw();
	
	//일반후기 가져오기
	public List<ReviewUserDto> getAllReveiw(String ru_type);
	
	//후기 노출여부 변경
	int updateVisility(int ru_num);
	
	//상품후기 검색
	List<ReviewUserDto> getSearchReview(HashMap<String, Object> map);
	
	//후기 상세보기
	HashMap<String, Object> getReviewDetail(int ru_num);
	
	//QnA-------------------------------------------------------------
	//qna 전체 리스트
	List<QnrUserDto> getQnaList();
	
	//qna 하나의 정보
	QnrUserDto qnaInfo(int qu_num); 
	
	//답변 insert
	int qna_answer_insert(QnrAnswerDto qaDto);

	//답변 처리상태 변경
	void qna_status_update(int qu_num);
	
	//qna 답변 update
	int qna_answer_update(QnrAnswerDto qaDto);
	
	//답변가져오기 (수정시 사용)
	HashMap<String, Object> qna_answer_info(int qu_num);
	
	//답변 삭제하기
	int qna_answer_delete(int qu_num);
	
	//답변 검색
	List<Object> getSearchQna(HashMap<String, Object> map);
	
}
