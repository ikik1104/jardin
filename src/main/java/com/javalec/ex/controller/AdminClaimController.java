package com.javalec.ex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@RequestMapping("/test_method")
	@ResponseBody
	public Map<String, Object> test_method(){
		Map<String,Object> map1 = new HashMap<String, Object>();
		map1.put("array1", "배열입니다.");
		return map1;
	}
	
	//환불 리스트게시판 - 정렬&검색
		@RequestMapping("refund_s_a")
		@ResponseBody
		public Map<String,Object> refund_s_a(){
			
			Map<String,Object> map1 = new HashMap<String, Object>();
			map1.put("array1", "배열입니다.");
			return map1;
		}
	
	
	//환불 리스트게시판 - 정렬&검색
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("refund_s_a") public List<RefundDto> refund_s_a(@RequestBody
	 * HashMap<String, String> map){
	 * 
	 * String arr = map.get("arr"); String array1 =""; if(arr==null ||
	 * arr.equals("rf_receipt_num asc")) { array1 = "rf_receipt_num asc"; }else {
	 * array1 = arr+", rf_receipt_num asc"; } map.put("array1", array1);
	 * List<RefundDto> result = acService.getSearchArrRefund(map); return result; }
	 */
	
	
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
