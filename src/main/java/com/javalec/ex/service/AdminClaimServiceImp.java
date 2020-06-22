package com.javalec.ex.service;

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
	
	
	
}
