package com.javalec.ex.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.RefundDto;
import com.javalec.ex.dto.ReturnDto;

@Repository
public interface AdminClaimDao {

	List<RefundDto> getAllMemRefund(); //환불 리스트 전부 가져오기
	int refundProcess(String rf_receipt_num); //환불완료 처리하기
	List<RefundDto> getSearchArrRefund(HashMap<String, String> map); //환불리스트 검색,정렬
	List<ReturnDto> getAllMemReturn(); //반품 리스트 전부 가져오기
	List<ReturnDto> getOneReturn(String rt_receipt_num); //반품넘버의 반품정보 싹다 가져오기
	int returnProcess(String rt_receipt_num); //반품완료 처리하기
	int adminRefundRq(RefundDto refundDto); //반품 > 환불
	List<ReturnDto> getSearchArrReturn(HashMap<String, String> map); //반품리스트 검색,정렬
}
