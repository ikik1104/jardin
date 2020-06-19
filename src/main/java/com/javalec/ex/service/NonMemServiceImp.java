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
		System.out.println("여기는 넌멤버 서비스 임프"+orderListDto.getOl_order_num());
		return nmdao.nonMemLog(orderListDto);
	}
	
	
}


