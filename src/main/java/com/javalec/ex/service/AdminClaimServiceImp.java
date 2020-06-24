package com.javalec.ex.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.controller.MyOrderController;
import com.javalec.ex.dao.AdminClaimDao;
import com.javalec.ex.dto.RefundDto;
import com.javalec.ex.dto.ReturnDto;

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

	@Override
	public List<ReturnDto> getAllMemReturn() {
		return acdao.getAllMemReturn();
	}

	@Override
	public int returnEnd(String rt_receipt_num) {
		//반품테이블 상태 update
		acdao.returnProcess(rt_receipt_num);
		
		//환불테이블에 insert
		//환불고유번호 생성
		int num = MyOrderController.i;
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentTime = new Date ();
		String time1 = mSimpleDateFormat.format(currentTime);
		String rf_receipt_num = "rf"+time1+"_"+num;
		//리턴넘버로 해당 반품건의 정보 불러오기
		List<ReturnDto> returnSet = acdao.getOneReturn(rt_receipt_num); 
		//n개 환불테이블에 insert
		int cnt = 0;
		for(int index=0; index<returnSet.size(); index++) {
			RefundDto rfdto = new RefundDto();
			System.out.println(returnSet.get(index).getOl_payment());
			rfdto.setRf_receipt_num(rf_receipt_num);
			rfdto.setOl_num(returnSet.get(index).getOl_num());
			rfdto.setRf_price(returnSet.get(index).getRt_price());
			rfdto.setRf_method(returnSet.get(index).getOl_payment());
			rfdto.setOl_order_num(returnSet.get(index).getOl_order_num());
			rfdto.setP_name(returnSet.get(index).getP_name());
			rfdto.setM_id(returnSet.get(index).getM_id());
			cnt += acdao.adminRefundRq(rfdto);
		}
		MyOrderController.i += 1;
		if(returnSet.size() == cnt) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public List<ReturnDto> getSearchArrReturn(HashMap<String, String> map) {
		return acdao.getSearchArrReturn(map);
	}
	
	
	
}
