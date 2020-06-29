package com.javalec.ex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.MainBannerDto;
import com.javalec.ex.dto.MainBsDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.AdminMainService;
import com.javalec.ex.service.MP1Service;
import com.javalec.ex.service.MainService;
import com.javalec.ex.service.UserMemberService;

@Controller
public class UserLayoutController {
	
	/*
	 * [사용자]
	 * 메인
	 * */
	
	String response_path="layout/";
	
	@Autowired
	MainService mServ;
	@Autowired
	AdminMainService amServ;
	@Autowired
	MP1Service mp1Service;
	
	
	//메인 페이지 접속
	@RequestMapping("main")
	public String main(Model model, HttpSession session) {
		//메인 슬라이드(롤)배너 가져오기
		MainBannerDto mbdto2 = amServ.selectMainBanners();
		model.addAttribute("mbdto", mbdto2);
		//플롯 메뉴 위시리스트  가져오기
		
		//베스트셀러 제품 가져오기
		MainBsDto mbDto = amServ.getBs();
		model.addAttribute("p1", amServ.getPname(mbDto.getProduct1()));
		model.addAttribute("p2", amServ.getPname(mbDto.getProduct2()));
		model.addAttribute("p3", amServ.getPname(mbDto.getProduct3()));
		model.addAttribute("p4", amServ.getPname(mbDto.getProduct4()));
		model.addAttribute("p5", amServ.getPname(mbDto.getProduct5()));
		
		//신상품 정보 가져오기
		model.addAttribute("savedNewPro", amServ.getNewPro());
		
		//md choice 가져오기
		model.addAttribute("mdList", amServ.getMD());
		
		//위시리스트 가져오기
		if(session.getAttribute("userNum")==null) {
			model.addAttribute("chkLogin", 0);
		}else {
			int m_num = (Integer)session.getAttribute("userNum");
			model.addAttribute("allWishlist", mp1Service.getAllWish(m_num));
			model.addAttribute("chkLogin", 1);
		}
		
		return response_path+"main";
	}
	
	

}
