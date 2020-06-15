package com.javalec.ex.controller;

import java.util.List;

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
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.UserMemberService;

@Controller
public class UserLayoutController {
	
	/*
	 * [사용자]
	 * 메인
	 * */
	
	String response_path="layout/";
	
	@Autowired
	
	
	//메인 페이지 접속
	@RequestMapping("main")
	public String main() {
		return response_path+"main";
	}
	
	

}
