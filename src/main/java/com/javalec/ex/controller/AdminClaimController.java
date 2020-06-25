package com.javalec.ex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.RefundDto;
import com.javalec.ex.dto.ReturnDto;
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
	
	//환불 리스트게시판 - 정렬&검색
	@ResponseBody
	@PostMapping("refund_s_a") 
	public List<RefundDto> refund_s_a(@RequestBody HashMap<String, String> map){
		String arr = map.get("arr"); 
		String array1 =""; 
		if(arr==null || arr.equals("rf_receipt_num asc")) { 
			array1 = "rf_receipt_num asc"; 
		}else {
			array1 = arr+", rf_receipt_num asc"; 
		} 
		map.put("array1", array1);
		List<RefundDto> result = acService.getSearchArrRefund(map); 
		return result; 
	}
	
	//환불 처리해주는 버튼..실제 구현 시 결제모듈과 연계해야함
	@ResponseBody
	@RequestMapping("refund_process")
	public int refund_process(@RequestBody Map<String, String> refundInfo) {
		String rrn = refundInfo.get("rf_receipt_num");
		int success = acService.refundProcess(rrn);
		return success;
	}
	
	//반품 리스트 게시판
	@RequestMapping("return_list")
	public String return_list(ReturnDto returnDto, Model model) {
		List<ReturnDto> returnlist = acService.getAllMemReturn();
		model.addAttribute("returnlist", returnlist);
		return "admin/order/return_list";
	}
	
	//반품 완료 및 환불 접수
	@ResponseBody
	@RequestMapping("return_process")
	public int return_process(@RequestBody String return_num, HttpSession session) {
		//체크박스로 여러개 처리할때 : 
		//클릭 이벤트 > 아작스 > 벨류값들 배열 넘김 > 그리고 여기 return_num 인자를 배열로
		//바꾼다음에 ..잘하자..^^ 알아서
		int success = acService.returnEnd(return_num);
		return success;
	}
	
	//반품 리스트게시판 - 정렬&검색
	@ResponseBody
	@PostMapping("return_s_a") 
	public List<ReturnDto> return_s_a(@RequestBody HashMap<String, String> map){
		String arr = map.get("arr"); 
		String array1 =""; 
		if(arr==null || arr.equals("rt_receipt_num asc")) { 
			array1 = "rt_receipt_num asc"; 
		}else {
			array1 = arr+", rt_receipt_num asc"; 
		} 
		map.put("array1", array1);
		List<ReturnDto> result = acService.getSearchArrReturn(map); 
		return result; 
	}
	
}
