package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.OrderConfirmDao;
import com.javalec.ex.dto.OrderListDto;
import com.javalec.ex.dto.OrderlistCouDto;
import com.javalec.ex.dto.ReceiverDto;

@Service
public class OrderConfirmServiceImpl implements OrderConfirmService {

	@Autowired
	OrderConfirmDao orderConfirmDao;
	
	@Override
	public List<OrderListDto> getOderList(String ol_order_num) {
		return orderConfirmDao.getOderList(ol_order_num);
	}

	@Override
	public ReceiverDto getOrReInfo(String ol_order_num) {
		return orderConfirmDao.getOrReInfo(ol_order_num);
	}

	@Override
	public OrderlistCouDto getOrderlistCou(String ol_order_num) {
		return orderConfirmDao.getOrderlistCou(ol_order_num);
	}

}
