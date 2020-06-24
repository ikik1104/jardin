package com.javalec.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.javalec.ex.CommonUtils;
import com.javalec.ex.dto.MainBannerDto;
import com.javalec.ex.service.AdminMainService;

@Controller
public class AdminMainController {

	@Autowired
	AdminMainService amServ;
	@Autowired
	CommonUtils utils;
	
	@RequestMapping("admin_main")
	public String admin_main() {
		return "admin/main/main";
	}
	
//	@ResponseBody
//	@RequestMapping("admin_file")
//	public MainBannerDto admin_file(MainBannerDto mbdto, MultipartHttpServletRequest request) throws IOException  {
//		System.out.println("들어옴1");
//		
//		String config = request.getParameter("config");
//
//		MultipartFile banner1 = request.getFile("banner1");
//		MultipartFile banner2 = request.getFile("banner2");
//		MultipartFile banner3 = request.getFile("banner3");
//		MultipartFile banner4 = request.getFile("banner4");
//
//		
//		System.out.println(banner1.getOriginalFilename());
//		
//		utils.FileUploaderCDN(banner1, "main/");
//		System.out.println("들어옴2");
//		mbdto.setB_1(utils.FileUploaderCDN(banner1, "main/"));
//		if(banner2.isEmpty()==false) {
//			mbdto.setB_2(utils.FileUploaderCDN(banner2, "main/"));
//		}
//		if(banner3.isEmpty()==false) {
//			mbdto.setB_3(utils.FileUploaderCDN(banner3, "main/"));
//		}
//		if(banner4.isEmpty()==false) {
//			mbdto.setB_4(utils.FileUploaderCDN(banner4, "main/"));
//		}
//		System.out.println("들어옴3");
//		amServ.insertMainBanner(mbdto);
//		System.out.println("들어옴4");
//		return mbdto;
//	}
	@ResponseBody
	@RequestMapping("admin_file")
	public MainBannerDto admin_file(MainBannerDto mbdto, MultipartFile banner1, MultipartFile banner2, MultipartFile banner3, MultipartFile banner4, String config) throws IOException  {
		System.out.println("들어옴1");
		System.out.println(banner1.getOriginalFilename());
		utils.FileUploaderCDN(banner1, "main/");
		System.out.println("들어옴2");
		mbdto.setB_1(utils.FileUploaderCDN(banner1, "main/"));
		if(banner2.isEmpty()==false) {
			mbdto.setB_2(utils.FileUploaderCDN(banner2, "main/"));
		}
		if(banner3.isEmpty()==false) {
			mbdto.setB_3(utils.FileUploaderCDN(banner3, "main/"));
		}
		if(banner4.isEmpty()==false) {
			mbdto.setB_4(utils.FileUploaderCDN(banner4, "main/"));
		}
		System.out.println("들어옴3");
		amServ.insertMainBanner(mbdto);
		System.out.println("들어옴4");
		return mbdto;
	}
	
	
}
