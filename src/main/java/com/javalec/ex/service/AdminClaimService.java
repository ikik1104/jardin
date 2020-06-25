package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;

import com.javalec.ex.dto.RefundDto;
import com.javalec.ex.dto.ReturnDto;

public interface AdminClaimService {

	List<RefundDto> getAllMemRefund(); //환불 리스트 전부 가져오기
	int refundProcess(String rf_receipt_num); //환불완료 처리하기
	List<RefundDto> getSearchArrRefund(HashMap<String, String> map); //환불리스트 검색,정렬
	List<ReturnDto> getAllMemReturn(); //반품 리스트 전부 가져오기
	int returnEnd(String rt_receipt_num); //반품 완료 상태로 변경시키고 환불테이블에 넣기
	List<ReturnDto> getSearchArrReturn(HashMap<String, String> map); //반품리스트 검색,정렬
}
