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
import com.javalec.ex.dto.EnjoyCoffeeDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;

@Service
public class AdminBoardServiceImp implements AdminBoardService {
	@Autowired
	AdminBoardDao abDao;

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
	public List<EnjoyCoffeeDto> getPhotoReveiw() {
		return abDao.getPhotoReveiw();
	}
	
	//일반후기 가져오기
	@Override
	public List<EnjoyCoffeeDto> getAllReveiw(String ru_type) {
		return abDao.getAllReveiw(ru_type);
	}


	//노출 상태 변경하기
	@Override
	public void updateStatus(int ru_num) {
		abDao.updateStatus(ru_num);
		
	}


	





	
	

	

}
