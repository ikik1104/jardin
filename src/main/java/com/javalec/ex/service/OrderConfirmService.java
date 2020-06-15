package com.javalec.ex.service;

import java.util.List;

import com.javalec.ex.dto.OrderListDto;
import com.javalec.ex.dto.OrderlistCouDto;
import com.javalec.ex.dto.ReceiverDto;

public interface OrderConfirmService {

	// 주문리스트 가져오기
	List<OrderListDto> getOderList(String ol_order_num);
	
	// 주문자,수취자 정보 가져오기
	ReceiverDto getOrReInfo(String ol_order_num);
	
	// 쿠폰 할인 금액, 포인트 사용 금액 가져오기 
	OrderlistCouDto getOrderlistCou(String ol_order_num);
}
