package com.javalec.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
