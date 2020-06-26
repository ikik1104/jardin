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
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.AdminMainService;
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
	
	
	//메인 페이지 접속
	@RequestMapping("main")
	public String main(Model model, HttpSession session) {
		//메인 슬라이드(롤)배너 가져오기
		MainBannerDto mbdto2 = amServ.selectMainBanners();
		model.addAttribute("mbdto", mbdto2);
		//플롯 메뉴 위시리스트  가져오기
		String m_num = (String) session.getAttribute("userNum");
		if(m_num != null) {
			//아직 구현중
		}
		return response_path+"main";
	}
	
	

}
