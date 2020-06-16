package com.javalec.ex.service;

import java.sql.JDBCType;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.AdminCouponDao;
import com.javalec.ex.dao.UserCustomerDao;
import com.javalec.ex.dao.UserMemberDao;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;

@Service
public class UserCustomerServiceImp implements UserCustomerService {

	/*
	 * [사용자]
	 * 고객센터
	 * */
	
	@Autowired
	UserCustomerDao cdao;

	//공지사항 전체 리스트 불러오기
	public List<AllDto> getAllNoticeBoards() {
		return cdao.getAllNoticeBoards();
	}

	//공지사항 1개 불러오기
	public AllDto getNoticeBoard(NoticeDto noticeDto) {
		AllDto returndto = cdao.getNoticeBoard(noticeDto);//공지글 내용 불러오기
		int success = cdao.addNoHit(noticeDto);//조회수 1 증가
		if(success==0) {
			//조회수 올리기 실패했을 경우
			returndto.getNoticedto().setNo_hit(-1);
		}
		return returndto;
	}

	//사용자 1:1문의 작성
	public int insertUserInquiry(MtmUserDto mtmUserDto) {
		return cdao.insertUserInquiry(mtmUserDto);
	}

	//faq전체 리스트 불러오기
	public List<FaqDto> getAllFaqs() {
		return cdao.getAllFaqs();
	}

	//ajax로 faq 전체 리스트 불러오기
	public List<FaqDto> getAllFaqsAjax() {
		return cdao.getAllFaqs();
	}

	


	
}
