package com.javalec.ex.controller;

import java.util.ArrayList;
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

import com.javalec.ex.dao.MP1Dao;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.MainBannerDto;
import com.javalec.ex.dto.MainJardinDto;
import com.javalec.ex.dto.MainSaleDto;
import com.javalec.ex.dto.ProductDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.dto.WishListDto;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.AdminMainService;
import com.javalec.ex.service.MP1Service;
import com.javalec.ex.service.MainService;
import com.javalec.ex.service.ProductService;
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
	MP1Service mpServ;
	@Autowired
	ProductService pServ;
	
	
	//메인 페이지 접속
	@RequestMapping("main")
	public String main(Model model, HttpSession session) {
		//메인 슬라이드(롤)배너 가져오기
		MainBannerDto mbdto2 = amServ.selectMainBanners();
		model.addAttribute("mbdto", mbdto2);
		
		//플롯 메뉴 위시리스트  가져오기
		if(session.getAttribute("userNum")!=null) {
			int m_num = (Integer) session.getAttribute("userNum");
			List<WishListDto> wlist = mpServ.getAllWish(m_num);
			model.addAttribute("wlist", wlist);
		}

		//sale 상품 10개 가져오기
		ArrayList<ProductDto> mslist = new ArrayList<ProductDto>();
		MainSaleDto msdto = amServ.selectSale();
		mslist.add(pServ.getProductInfo(msdto.getP1()));
		mslist.add(pServ.getProductInfo(msdto.getP2()));
		mslist.add(pServ.getProductInfo(msdto.getP3()));
		mslist.add(pServ.getProductInfo(msdto.getP4()));
		mslist.add(pServ.getProductInfo(msdto.getP5()));
		mslist.add(pServ.getProductInfo(msdto.getP6()));
		mslist.add(pServ.getProductInfo(msdto.getP7()));
		mslist.add(pServ.getProductInfo(msdto.getP8()));
		mslist.add(pServ.getProductInfo(msdto.getP9()));
		mslist.add(pServ.getProductInfo(msdto.getP10()));
		model.addAttribute("mslist", mslist);
		
		//쟈뎅 브랜드 상품 5개 가져오기
		MainJardinDto mjdto = amServ.selectJd();
		model.addAttribute("jb1", pServ.getProductInfo(mjdto.getP1()));
		model.addAttribute("jb2", pServ.getProductInfo(mjdto.getP2()));
		model.addAttribute("jb3", pServ.getProductInfo(mjdto.getP3()));
		model.addAttribute("jb4", pServ.getProductInfo(mjdto.getP4()));
		model.addAttribute("jb5", pServ.getProductInfo(mjdto.getP5()));
		
		return response_path+"main";
	}
	
	

}
