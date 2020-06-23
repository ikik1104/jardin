package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.AdminClaimDao;
import com.javalec.ex.dto.RefundDto;

@Service
public class AdminClaimServiceImp implements AdminClaimService {

	@Autowired
	AdminClaimDao acdao;

	@Override
	public List<RefundDto> getAllMemRefund() {
		return acdao.getAllMemRefund();
	}

	@Override
	public int refundProcess(String rf_receipt_num) {
		return acdao.refundProcess(rf_receipt_num);
	}

	@Override
	public List<RefundDto> getSearchArrRefund(HashMap<String, String> map) {
		return acdao.getSearchArrRefund(map);
	}
	
	
	
}
