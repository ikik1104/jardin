package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.ADBMtmDao;
import com.javalec.ex.dao.AdminBoardDao;
import com.javalec.ex.dao.BDao;
import com.javalec.ex.dao.ChangeInfoDao;
import com.javalec.ex.dto.BDto;
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
	
	//유저-------------------------
	
	//faq 리스트
	@Override
	public List<FaqDto> getFaqList() {
		return abDao.getFaqList();
		
	}




	
	

	

}
