package com.javalec.ex.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.ex.service.AdminOrderService;

@Controller
public class AdminOrderController {

	@Autowired
	private AdminOrderService aoService;
	
	// 주문통합리스트 ----------------------------------------------------------------------------
	
	// 전체 리스트 (검색어 & 정렬 배제)
	@RequestMapping("order_list")
	public String order_list(HttpServletRequest request, Model model) {
		
		HashMap<String, String> map = optionValue(request, model);
		String option = map.get("option1");
		String opt = map.get("opt1");
		String listName = "";
		model.addAttribute("allOrderlist", aoService.getAllOrderlist(option));
		model.addAttribute("countOrder", aoService.countOrder(listName));
		model.addAttribute("selectedOpt", opt);
		
		return "admin/order/order_list";
	}
	
	
	// 주문통합리스트 - 검색 & 정렬
	@RequestMapping("getSearchOrder")
	public String getSearchOrder(@RequestParam HashMap<String, String> map, HttpServletRequest request, Model model) {
	
		HashMap<String, String> map3 = searchValue(map, request, model);

		String keywordOpt1 = map3.get("keywordOpt");
		String keyword1 = map3.get("keyword");
		String e_start_day1 = map3.get("e_start_day");
		String e_end_day1 = map3.get("e_end_day");
		String status1 = map3.get("status");
		String opt = map3.get("opt");
		String listName = "";
		
		model.addAttribute("allOrderlist", aoService.search_1(map3));
		model.addAttribute("keywordOpt", keywordOpt1);
		model.addAttribute("keyword", keyword1);
		model.addAttribute("e_start_day", e_start_day1);
		model.addAttribute("e_end_day", e_end_day1);
		model.addAttribute("status", status1);
		model.addAttribute("selectedOpt", opt);
		model.addAttribute("countOrder", aoService.countOrder(listName));
		model.addAttribute("countSearch", aoService.countSearch(map3));
		
		return "admin/order/order_list";
	}
	
	
	// 입금대기 리스트 ----------------------------------------------------------------------------
	
	// 입금대기 리스트 
	@RequestMapping("deposit_waiting_list")
	public String deposit_waiting_list(HttpServletRequest request, Model model) {
		HashMap<String, String> map = optionValue(request, model);
		String status = "입금대기";
		map.put("listName", "ol.ol_status='입금대기'");
		
		model.addAttribute("allOrderlist", aoService.deposit_waiting_list(map));
		model.addAttribute("countOrder", aoService.countOrder(status));
		return "admin/order/deposit_waiting_list";
	}
	
	// 입금대기 리스트- 검색 & 정렬
	@ResponseBody
	@RequestMapping("dw_search")
	public List<HashMap <String, Object>> dw_search(@RequestBody HashMap<String, String> map)throws Exception {
	
		String opt = map.get("option");
		String option1 ="";
		
		if(opt==null || opt.equals("ol.ol_order_num asc")) {
			option1 = "ol.ol_order_num asc";
		}else {
			option1 = opt+", ol.ol_order_num asc";
		}
		map.put("option1", option1);
		List<HashMap<String, Object>> resultMap = aoService.searchandsort(map);
			
		return resultMap;
	}
	
	// 결제완료 리스트
		@RequestMapping("complete_payment_list")
		public String complete_payment_list(HttpServletRequest request, Model model) {
			HashMap<String, String> map = optionValue(request, model);
			map.put("listName", "ol.ol_status='입금완료'");
			String status = "입금완료";
			
			model.addAttribute("allOrderlist", aoService.deposit_waiting_list(map));
			model.addAttribute("countOrder", aoService.countOrder(status));
			return "admin/order/complete_payment_list";
		}
		
		// 결제완료 리스트- 검색 & 정렬
		@ResponseBody
		@RequestMapping("cp_search")
		public List<HashMap <String, Object>> cp_search(@RequestBody HashMap<String, String> map)throws Exception {
			
			String opt = map.get("option");
			String option1 ="";
			
			if(opt==null || opt.equals("ol.ol_order_num asc")) {
				option1 = "ol.ol_order_num asc";
			}else {
				option1 = opt+", ol.ol_order_num asc";
			}
			map.put("option1", option1);
			List<HashMap<String, Object>> resultMap = aoService.searchandsort(map);
			
			return resultMap;
		}
	
	
	
	// 선택한 주문건 처리상태 변경
	@ResponseBody
	@RequestMapping("change_status")
	public int change_status(@RequestBody String arrData[]) {
		int success=aoService.change_status(arrData[0], arrData[1]);
		return success;
	}
	
	
	// 공통 메소드 ----------------------------------------------------------------------------
	// 기본 리스트 메소드
	public HashMap<String, String> optionValue(HttpServletRequest request, Model model) {
		String opt = request.getParameter("option");
		String option1 ="";
		if(opt==null || opt == "ol.ol_order_num asc") {
			option1 = "ol.ol_order_num asc";
		}else {
			option1 = opt+", ol.ol_order_num asc";
		}
		
		HashMap<String, String> map1 = new HashMap<String, String>();
		map1.put("option1", option1);
		map1.put("opt1", opt);
		
		return map1;
	}
	
	// 검색 & 정렬 메소드
	public HashMap<String, String> searchValue(@RequestParam HashMap<String, String> map, HttpServletRequest request, Model model) {
		
		HashMap<String, String> map2 = new HashMap<String, String>();
		
		String opt = request.getParameter("option");
				
		String option ="";
		
		if(opt==null || opt=="ol.ol_order_num asc") {
			option = "ol.ol_order_num asc";
		}else {
			option = opt+", ol.ol_order_num asc";
		}
		
		map2.put("option", option);
		map2.put("opt", opt);
		
		String keywordOpt1 = request.getParameter("keywordOpt");
		String keyword1 = request.getParameter("keyword");
		String e_start_day1 = request.getParameter("e_start_day");
		String e_end_day1 = request.getParameter("e_end_day");
		String status1 = request.getParameter("status");
		String search1="";
		String whereQuery = "";
				
		map2.put("keywordOpt", keywordOpt1);
		map2.put("keyword", keyword1);
		map2.put("e_start_day", e_start_day1);
		map2.put("e_end_day", e_end_day1);
		map2.put("status", status1);
		
		
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
		
		map2.put("whereQuery", whereQuery);
		
		return map2;
	}
	
	
}
