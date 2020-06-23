package com.javalec.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.RefundDto;

@Repository
public interface AdminClaimDao {

	List<RefundDto> getAllMemRefund(); //환불 리스트 전부 가져오기
	int refundProcess(String rf_receipt_num); //환불완료 처리하기
	List<RefundDto> getSearchArrRefund(HashMap<String, String> map); //환불리스트 검색,정렬
}
