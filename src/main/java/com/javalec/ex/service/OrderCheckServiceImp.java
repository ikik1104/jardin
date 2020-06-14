package com.javalec.ex.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javalec.ex.dao.OrderCheckDao;
import com.javalec.ex.dto.OrderListDto;
import com.javalec.ex.dto.PageDto;
import com.javalec.ex.dto.ReviewUserDto;

@Service
public class OrderCheckServiceImp implements OrderCheckService {

	@Autowired
	OrderCheckDao orderCheckDao;

	@Override
	public int countOrder(String m_id) {
		return orderCheckDao.countOrder(m_id);
	}

	@Override
	public List<Map<String, String>> getAllOrder(String m_id, PageDto pageDto) {
		return orderCheckDao.getAllOrder(m_id, pageDto);
	}

	@Override
	public int deleteOrder(int ol_order_num) {
		return orderCheckDao.deleteOrder(ol_order_num);
	}

	@Override
	public List<Map<String, String>> getOneSetOrder(int ol_order_num) {
		return orderCheckDao.getOneSetOrder(ol_order_num);
	}

	@Override
	public int returnRq(String ol_num, String rt_amt, String rt_reason) {
		return orderCheckDao.returnRq(ol_num, rt_amt, rt_reason);
	}

	@Override
	public int deleteOrderOne(String ol_num) {
		return orderCheckDao.deleteOrderOne(ol_num);
	}

	@Override
	public int updateOrderAmount(String ol_num, int ol_amt, int ol_price) {
		return orderCheckDao.updateOrderAmount(ol_num, ol_amt, ol_price);
	}

	@Override
	public List<Map<String, String>> reviewReadyList(String ol_order_num) {
		return orderCheckDao.reviewReadyList(ol_order_num);
	}

	@Override
	public int updateStatus(String ol_order_num, String order_status) {
		return orderCheckDao.updateStatus(ol_order_num, order_status);
	}

	@Override
	public String review_insert(MultipartFile ru_img_file, ReviewUserDto reviewUserDto) throws Exception {
		String path = "/Users/soojilee/upload/"; //저장경로 - 절대경로
		//학원에서 z:/upload로 바꾸기..근데 이미지 경로를 서버 하나로 통일시키려면 어케?
		String fileName = ru_img_file.getOriginalFilename();
		System.out.println(fileName);
		ru_img_file.transferTo(new File(path + fileName));
		reviewUserDto.setRu_img(fileName);
		orderCheckDao.review_insert(reviewUserDto);
		return "임시";
	}

	

//	@Override
//	public int requestRefund(int ol_order_num) {
//		return orderCheckDao.requestRefund(ol_order_num);
//	}


	
}
