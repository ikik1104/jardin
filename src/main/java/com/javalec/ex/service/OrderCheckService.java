package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.javalec.ex.dto.PageDto;
import com.javalec.ex.dto.ReviewUserDto;

public interface OrderCheckService {

	int countOrder(String m_id); //특정 회원의 전체 주문건 수
	List<Map<String, String>> getAllOrder(String m_id, PageDto pageDto); //특정 회원의 전체 주문목록
	int deleteOrder(int ol_order_num); //주문취소(입금대기중 - 취소)
	List<Map<String, String>> getOneSetOrder(int ol_order_num); // 특정 주문번호의 전체 상품목록
	int returnRq(String ol_num, String rt_amt, String rt_reason); //반품신청
	int deleteOrderOne(String ol_num); //수량 전체 반품 시 주문상품 삭제(주문 아니라 주문 건 안에서의 상품 하나)
	int updateOrderAmount(String ol_num, int ol_amt, int ol_price); //수량 일부 반품시 기존 주문리스트에서 수량 변경
	List<Map<String, String>> reviewReadyList(String ol_order_num); // 틀정주문번호의 리뷰 작성 가능 목록 불러오기
	int updateStatus(String ol_order_num, String order_status); //구매상태 변경
	String review_insert(MultipartFile ru_img_file, ReviewUserDto reviewUserDto) throws Exception;
	//	int requestRefund(int ol_order_num); //결제취소(입금완료 - 취소)
}
