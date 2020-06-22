package com.javalec.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.RefundDto;

@Repository
public interface AdminClaimDao {

	List<RefundDto> getAllMemRefund(); //환불 리스트 전부 가져오기
	
}
