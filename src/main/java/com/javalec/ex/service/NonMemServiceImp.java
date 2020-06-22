package com.javalec.ex.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.NonMemDao;
import com.javalec.ex.dto.OrderListDto;

@Service
public class NonMemServiceImp implements NonMemService {

	@Autowired
	NonMemDao nmdao;

	@Override
	public List<Map<String, String>> getAllNonOrder(String order_num) {
		return nmdao.getAllNonOrder(order_num);
	}

	@Override
	public int nonMemLog(OrderListDto orderListDto) {
		return nmdao.nonMemLog(orderListDto);
	}

	@Override
	public int nonMemLog2(OrderListDto orderListDto) {
		return nmdao.nonMemLog2(orderListDto);
	}

	@Override
	public List<Map<String, String>> getAllClaim(String order_num) {
		return nmdao.getAllClaim(order_num);
	}
	
	
}


