package com.javalec.ex.service;

import java.sql.JDBCType;
import java.util.List;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;

public interface UserCustomerService {


	/*
	 * [사용자]
	 * 고객센터
	 * */
	
	//공지사항 전체 리스트 불러오기
	List<AllDto> getAllNoticeBoards();

	//공지사항 1개 불러오기
	AllDto getNoticeBoard(NoticeDto noticeDto);

	//사용자 1:1문의 작성
	int insertUserInquiry(MtmUserDto mtmUserDto);

	//faq 전체 리스트 불러오기
	List<FaqDto> getAllFaqs();

	//ajax로 faq 전체 리스트 불러오기
	List<FaqDto> getAllFaqsAjax();

}
