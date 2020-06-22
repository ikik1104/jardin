package com.javalec.ex.service;

import java.util.List;

import com.javalec.ex.dto.RefundDto;

public interface AdminClaimService {

	List<RefundDto> getAllMemRefund(); //환불 리스트 전부 가져오기
	
}
