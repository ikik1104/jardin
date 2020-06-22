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
import com.javalec.ex.dao.CommunityDao;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.EnjoyCoffeeDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.PageDto;
import com.javalec.ex.dto.ReviewAnswerDto;
import com.javalec.ex.dto.ReviewUserDto;

@Service
public class CommunityServiceImp implements CommunityService {
	@Autowired
	CommunityDao cmDao;

	//---------------------------------------  enjoy coffee   ---------------------------------

	//enjoy coffee 리스트
	@Override
	public List<EnjoyCoffeeDto> enjoy_List() {
		return cmDao.enjoy_List();
	}
	
	//enjoy coffee 조회수증가
	@Override
	public void enjoy_hitUp(int ej_num) {
		
		cmDao.enjoy_hitUp(ej_num);
		
	}

	//-----------------------------------------    상품평           ----------------------------------------
	//상품평 가져오기
	@Override
	public List<HashMap<String, Object>> review_list(String ru_type,PageDto pageDto) {
		return cmDao.review_list(ru_type,pageDto);
	}

	//리뷰 상세보기 
	@Override
	public Map<String, Object> review_detail(int ru_num) {
		return cmDao.review_detail(ru_num);
	}

	//리뷰 조회수 증가
	@Override
	public void review_hit(int ru_num) {
		cmDao.review_hit(ru_num);
		
	}

	//리뷰 타입별 개수 가져오기
	@Override
	public int countReview(String ru_type) {
		return cmDao.countReview(ru_type);
	}

	//이전글 제목 가져오기
	@Override
	public ReviewUserDto getPreTitle(String ru_type, int rownum) {
		System.out.println("서비스 임프 이전 글의 rownum = "+rownum);
		return cmDao.getPreTitle(ru_type,rownum);
	}

	//다음글 제목 가져오기
	@Override
	public ReviewUserDto getNextTitle(String ru_type, int rownum) {
		System.out.println("서비스 임프 다음 글의 rownum = "+rownum);
		return cmDao.getNextTitle(ru_type,rownum);
	}

	//리뷰 삭제하기
	@Override
	public int delReview(int ru_num) {
		return cmDao.delReview(ru_num);
	}
	
	
}
