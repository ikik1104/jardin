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
	/*입금 대기중 취소*/
	int deleteOrder(String ol_order_num); //주문테이블 삭제(입금대기중 - 취소)
	int deleteOrderCou(String ol_order_num); //주문쿠폰테이블 삭제(입금대기중 - 취소)
	int deleteOrderRec(String ol_order_num); //주문수령지테이블 삭제(입금대기중 - 취소)
	
	List<Map<String, String>> getOneSetOrder(String ol_order_num); // 특정 주문번호의 전체 상품목록
	int returnRq(int ol_num, String rt_amt, String rt_reason, int rt_price, String rt_receipt_num, String ol_order_num, String p_name, String m_id); //반품신청
	int updateOrderStatus(int ol_num, int ol_amt); //수량 전체 반품 시 주문상품 상태 변경
	int updateOrderAmount(String ol_num, int ol_amt, int ol_price); //수량 일부 반품시 기존 주문리스트에서 수량 변경
	
	/*리뷰 관련*/
	List<Map<String, String>> reviewReadyList(String ol_order_num); // 틀정주문번호의 리뷰 작성 가능 목록 불러오기
	List<Map<String, String>> reviewEndList(String ol_order_num); // 특정주문번호의 리뷰 완료 목록 불러오기
	int review_insert(MultipartFile ru_img_file, ReviewUserDto reviewUserDto) throws Exception; //리뷰등록
	Map<String, Object> getOneReview(int ol_num); //작성한 리뷰글 보기
	
	int updateStatus(String ol_order_num, String order_status); //구매상태 변경
	int refundRequest(String rf_receipt_num, int ol_num, int rf_price, String ol_order_num, String p_name, String m_id); //환불테이블 insert
	int countReturnRefund(String m_id); //특정 회원의 전체 반품 수
	List<Map<String, String>> getAllRtrf(String m_id, PageDto pageDto); // 특정 회원의 전체 반품, 환불
	List<Map<String, String>> proInOneOrder(String ol_order_num); // 특정 주문건의 주문상품들
	Map<String, String> orderInfoDetail(String ol_order_num); // 결제 정보 및 배송지 정보
	List<Map<String, String>> cancelInfoDetail(String ol_order_num); // 결제 취소 상품 정보
	List<Map<String, String>> rtrfInfoDetail(String ol_order_num); // 결제 정보 및 배송지 정보
	Map<String, Object> getShortInfo(String m_id); // 요약정보
}
