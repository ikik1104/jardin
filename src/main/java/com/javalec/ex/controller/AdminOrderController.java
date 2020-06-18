package com.javalec.ex.controller;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.javalec.ex.service.AdminOrderService;

@Controller
public class AdminOrderController {

	@Autowired
	private AdminOrderService aoService;
	
	// 주문 전체 리스트
	@RequestMapping("order_list")
	public String order_list(HttpServletRequest request, Model model) {
		
		String opt = request.getParameter("option");
		String opt_text = request.getParameter("opt_text");
		String option ="";
		if(opt == "ol.ol_order_num asc") {
			option = "ol.ol_order_num asc";
		}else {
			option = opt+", ol.ol_order_num asc";
		}
		
		model.addAttribute("allOrderlist", aoService.getAllOrderlist(option));
		model.addAttribute("countOrder", aoService.countOrder());
		model.addAttribute("selectedOpt", opt);
		
		return "admin/order/order_list";
	}
	
	
	@RequestMapping("getSearchOrder")
	public String getSearchOrder(@RequestParam HashMap<String, String> map, HttpServletRequest request, Model model) {
	
		String opt = request.getParameter("option");
		String opt_text = request.getParameter("opt_text");
				
		String option ="";
		System.out.println(opt);
		System.out.println(opt_text);
		if(opt==null || opt=="ol.ol_order_num asc") {
			option = "ol.ol_order_num asc";
		}else {
			option = opt+", ol.ol_order_num asc";
		}
		System.out.println(option);
		map.put("option", option);
		
		
		String keywordOpt1 = request.getParameter("keywordOpt");
		String keyword1 = request.getParameter("keyword");
		String e_start_day1 = request.getParameter("e_start_day");
		String e_end_day1 = request.getParameter("e_end_day");
		String status1 = request.getParameter("status");
		String search1="";
		String whereQuery = "";
		System.out.println(keyword1);
		
		map.put("keyword", keyword1);
		map.put("e_start_day", e_start_day1);
		map.put("e_end_day", e_end_day1);
		map.put("status", status1);
		
		
			switch (keywordOpt1) {
			case "주문번호":
					search1 = "ol.ol_order_num";
				break;
				
			case "상품코드":
					search1 = "ol.p_num";
				break;
				
			case "상품명":
					search1 = "p.p_name";
			break;
			
			case "주문자":
					search1 = "ol.ol_orderer_id";
				break;
	
			default:
				break;
			}

		if(keyword1.equals("")&&e_start_day1.equals("") && status1.equals("전체")) {
			whereQuery="";
		}

		if(keyword1.equals("")) {
			if(e_start_day1.equals("") && status1.equals("전체")) {
				whereQuery = "";
			}else if(e_start_day1 !="" && status1.equals("전체")) {
				whereQuery = "and ol.ol_date between #{e_start_day} and #{e_end_day}";
			}else if(e_start_day1 !="" && status1 !="전체") {
				whereQuery = "and ol.ol_date between #{e_start_day} and #{e_end_day} and ol.ol_status=#{status} ";
			}else {
				whereQuery = "and ol.ol_status=#{status}";
			}
		}else {
			if(e_start_day1.equals("") && status1.equals("전체")) {
				whereQuery = "and "+search1+"=#{keyword}";
			}else if(e_start_day1.equals("") && status1 != "전체") {
				whereQuery = "and "+search1+"=#{keyword} and ol.ol_status=#{status}";
			}else if(e_start_day1 !="" && status1.equals("전체")) {
				whereQuery = "and "+search1+"=#{keyword} and ol.ol_date between #{e_start_day} and #{e_end_day}";
			}else {
				whereQuery = "and "+search1+"=#{keyword} and ol.ol_date between #{e_start_day} and #{e_end_day} and ol.ol_status=#{status}";
			}
		}
		
		System.out.println(whereQuery);
		map.put("whereQuery", whereQuery);
		
		model.addAttribute("allOrderlist", aoService.search_1(map));
		model.addAttribute("keywordOpt", keywordOpt1);
		model.addAttribute("keyword", keyword1);
		model.addAttribute("e_start_day", e_start_day1);
		model.addAttribute("e_end_day", e_end_day1);
		model.addAttribute("status", status1);
		model.addAttribute("selectedOpt", opt);
		model.addAttribute("countOrder", aoService.countOrder());
		model.addAttribute("countSearch", aoService.countSearch(map));
		
		return "admin/order/order_list";
	}
}
