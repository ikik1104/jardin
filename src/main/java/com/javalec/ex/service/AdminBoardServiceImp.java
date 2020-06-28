package com.javalec.ex.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.ADBMtmDao;
import com.javalec.ex.dao.AdminBoardDao;
import com.javalec.ex.dao.BDao;
import com.javalec.ex.dao.ChangeInfoDao;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.CommentDto;
import com.javalec.ex.dto.EnjoyCoffeeDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.QnrAnswerDto;
import com.javalec.ex.dto.QnrUserDto;
import com.javalec.ex.dto.ReviewAnswerDto;
import com.javalec.ex.dto.ReviewUserDto;

@Service
public class AdminBoardServiceImp implements AdminBoardService {
	@Autowired
	AdminBoardDao abDao;
	
	//아작스 수업 (댓글달기)
	@Override
	public List<CommentDto> comment_List(){
		return abDao.comment_List();
	}
	@Override
	public int comment_delete(int cId) {
		return abDao.comment_delete(cId);
	}




	//관리자------------------------

	//faq작성
	@Override
	public int insertFaq(FaqDto fdto) {
		
		return abDao.insertFaq(fdto);
	}
	
	
	//faq수정
	@Override
	public void updateFaq(FaqDto fdto) {
		abDao.updateFaq(fdto);
	}
	
	//faq삭제
	@Override
	public int deleteFaq(int f_num) {
		return abDao.deleteFaq(f_num);
	}
		
	//faq 노출상태 변경
	@Override
	public int updateFaqDelflag(int f_num) {
		return abDao.updateFaqDelflag(f_num);
	}
		
		
	//faq전체 리스트
	@Override
	public List<FaqDto> getAllFaqList() {
		return abDao.getAllFaqList();
	}
	
	//fag하나의 정보
	@Override
	public FaqDto faqInfo(int f_num) {
		return abDao.faqInfo(f_num);
	}
	
	//검색
	@Override
	public List<FaqDto> getSearchFaq(HashMap<String, Object> map){
		return abDao.getSearchFaq(map);
	}
	
	
	//enjoy coffee----------------------------------------

	//enjoy coffee insert
	@Override
	public void enjoy_insert(EnjoyCoffeeDto ecDto) {
		abDao.enjoy_insert(ecDto);
	}

	//enjoy coffee 한개의 정보 (상세보기, 수정에 쓰임)
	@Override
	public EnjoyCoffeeDto enjoy_info(int ej_num) {
		return abDao.enjoy_info(ej_num);
	}

	//enjoy coffee update
	@Override
	public int enjoy_update(EnjoyCoffeeDto ecDto) {
		return abDao.enjoy_update(ecDto);
	}

	//enjoy coffee 완전 삭제
	@Override
	public int enjoy_delete(int ej_num) {
		return abDao.enjoy_delete(ej_num);
	}

	//enjoy coffee 전체 리스트(관리자)
	@Override
	public List<EnjoyCoffeeDto> enjoy_allList() {
		return abDao.enjoy_allList();
	}

	//검색
	@Override
	public List<EnjoyCoffeeDto> getSearchEnjoy(HashMap<String, Object> map) {
		
		return abDao.getSearchEnjoy(map);
	}


	//상품 후기----------------------------------------------------------
	
	//포토후기 가져오기
	@Override
	public List<ReviewUserDto> getPhotoReveiw() {
		return abDao.getPhotoReveiw();
	}
	
	//일반후기 가져오기
	@Override
	public List<ReviewUserDto> getAllReveiw(String ru_type) {
		return abDao.getAllReveiw(ru_type);
	}


	//노출 상태 변경하기
	@Override
	public int updateVisility(int ru_num) {
		return abDao.updateVisility(ru_num);
		
	}


	//상품후기 검색
	@Override
	public List<ReviewUserDto> getSearchReview(HashMap<String, Object> map){
		return abDao.getSearchReview(map);
	}

	
	//후기 상세보기
	@Override
	public HashMap<String, Object> getReviewDetail(int ru_num) {
		return abDao.getReviewDetail(ru_num);
	}
	
	
	//후기 답글달기
	@Override
	public int review_answer_insert(ReviewAnswerDto raDto) {
		
		int result = abDao.review_answer_insert(raDto);
		if(result == 1){
			result = abDao.review_status_update(raDto.getRu_num());
		}
		return result;
		
	}
	
	//후기 답글 수정
	@Override
	public int review_answer_update(ReviewAnswerDto raDto) {
		return abDao.review_answer_update(raDto);
	}
	
	//후기 답글 삭제
	@Override
	public int review_answer_delete(int ru_num) {
		int result = abDao.review_answer_delete(ru_num);
		if(result == 1){
			result = abDao.review_status_update(ru_num);
		}
		return result;
	}

	


	//QnA-------------------------------------------------------------
	//qna 전체 리스트
	@Override
	public List<QnrUserDto> getQnaList() {
		return abDao.getQnaList();
	}

	//qna 하나의 정보
	@Override
	public QnrUserDto qnaInfo(int qu_num) {
		return abDao.qnaInfo(qu_num);
	}

	//qna insert
	@Override
	public int qna_answer_insert(QnrAnswerDto qaDto) {
		
		//답변 등록
		int chk = abDao.qna_answer_insert(qaDto);
		if(chk==1) {
			//상태 답변완료로 수정
			abDao.qna_status_update(qaDto.getQu_num());
		}
		
		return chk;
		
	}

	//qna insert
	@Override
	public int qna_answer_update(QnrAnswerDto qaDto) {
			
		return abDao.qna_answer_update(qaDto);
			
	}

	//답변가져오기 (수정시 사용)
	@Override
	public HashMap<String, Object> qna_answer_info(int qu_num) {
		
		return abDao.qna_answer_info(qu_num);
	}

	//답변 수정
	@Override
	public int qna_answer_delete(int qu_num) {
		//답변 등록
		int chk = abDao.qna_answer_delete(qu_num);
		if(chk==1) {
			//상태 답변대기로 수정
			abDao.qna_status_update(qu_num);
		}
		
		return chk;
	}

	//답변 검색
	@Override
	public List<Object> getSearchQna(HashMap<String, Object> map) {
		return abDao.getSearchQna(map);
	}

	

	

}
