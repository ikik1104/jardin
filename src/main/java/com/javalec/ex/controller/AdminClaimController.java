package com.javalec.ex.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.RefundDto;
import com.javalec.ex.service.AdminClaimService;

@Controller
public class AdminClaimController {

	@Autowired
	AdminClaimService acService;
	
	//환불 리스트게시판
	@RequestMapping("refund_list")
	public String refund_list(RefundDto refundDto, Model model) {
		List<RefundDto> refundlist = acService.getAllMemRefund();
		model.addAttribute("refundlist", refundlist);
		return "admin/order/refund_list";
	}
	
	//환불 처리해주는 버튼..실제 구현 시 결제모듈과 연계해야함
	@ResponseBody
	@RequestMapping("refund_process")
	public int refund_process(@RequestBody Map<String, String> refundInfo) {
		String rrn = refundInfo.get("rf_receipt_num");
		System.out.println(rrn);
		int success = acService.refundProcess(rrn);
		System.out.println("성공: "+success);
		return success;
	}
	
}
