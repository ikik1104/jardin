package com.javalec.ex.service;

import java.io.File;
import java.util.Calendar;
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
	public int deleteOrder(String ol_order_num) {
		return orderCheckDao.deleteOrder(ol_order_num);
	}

	@Override
	public List<Map<String, String>> getOneSetOrder(String ol_order_num) {
		return orderCheckDao.getOneSetOrder(ol_order_num);
	}

	@Override
	public int returnRq(int ol_num, String rt_amt, String rt_reason, int rt_price) {
		return orderCheckDao.returnRq(ol_num, rt_amt, rt_reason, rt_price);
	}

	@Override
	public int deleteOrderOne(int ol_num) {
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
	public List<Map<String, String>> reviewEndList(String ol_order_num) {
		return orderCheckDao.reviewEndList(ol_order_num);
	}

	@Override
	public int updateStatus(String ol_order_num, String order_status) {
		return orderCheckDao.updateStatus(ol_order_num, order_status);
	}

	@Override
	public String review_insert(MultipartFile ru_img_file, ReviewUserDto reviewUserDto) throws Exception {
		String path = "z:/upload"; //저장경로 - 절대경로
//		String path = "/Users/soojilee/upload/"; //저장경로 - 절대경로
		//학원에서 z:/upload로 바꾸기..근데 이미지 경로를 서버 하나로 통일시키려면 어케?
		String fileName = ru_img_file.getOriginalFilename(); //오리지널 파일이름
		String extName = fileName.substring(fileName.lastIndexOf("."), fileName.length()); //확장자 분리
		String saveName = genSaveFileName(extName);//실제로 db에 저장할 파일명 생성(파일명 중복 방지)
		ru_img_file.transferTo(new File(path + saveName));//파일 전송
		reviewUserDto.setRu_img(saveName); //dto에 파일명 변수에 파일명 넣기
		orderCheckDao.review_insert(reviewUserDto); //db에 저장
		return path+saveName; //이미지 등록 후 이미지 바로 보여주려고 리턴해주기
	}
	
	//현재시간을 기준으로 파일 이름 재생성(파일명 중복 방지)
	private String genSaveFileName(String extName) {
		String fileName = "";
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
//		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;//'연월일시분초.확장자' 로 파일명 수정(밀리초는 에바쎄바같아서 뻄)
		return fileName;
	}

	@Override
	public int refundRequest(String rf_receipt_num, int ol_num, int rf_price) {
		System.out.println("서비스 임프");
		System.out.println("rf receipt" + rf_receipt_num);
		return orderCheckDao.refundRequest(rf_receipt_num, ol_num, rf_price);
	}

	@Override
	public int countReturnRefund(String m_id) {
		return orderCheckDao.countReturnRefund(m_id);
	}

	@Override
	public List<Map<String, String>> getAllRtrf(String m_id, PageDto pageDto) {
		return orderCheckDao.getAllRtrf(m_id, pageDto);
	}

	

//	@Override
//	public int requestRefund(int ol_order_num) {
//		return orderCheckDao.requestRefund(ol_order_num);
//	}


	
}
