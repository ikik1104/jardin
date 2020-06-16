package com.javalec.ex.dao;

import java.sql.JDBCType;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;

@Repository
public interface UserCustomerDao {


	/*
	 * [사용자]
	 * 고객센터
	 * */
	
	//공지사항 게시판 전체 리스트 불러오기
	List<AllDto> getAllNoticeBoards();
	
	//공지사항 1개 불러오기
	AllDto getNoticeBoard(NoticeDto noticeDto);
	
	//공지사항 조회수 1 올리기
	int addNoHit(NoticeDto noticeDto);
	
	//사용자 1:1문의 작성
	int insertUserInquiry(MtmUserDto mtmUserDto);


	
}
