package com.javalec.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String admin_main(Model model) {
//		List<MainBannerDto> mbdtos = amServ.selectMainBanners();
//		model.addAttribute("mbdtos", mbdtos);
		MainBannerDto mbdto2 = amServ.selectMainBanners();
		model.addAttribute("mbdto", mbdto2);
		return "admin/main/main";
	}
	
	@ResponseBody
	@RequestMapping("admin_file")
	public int admin_file(MainBannerDto mbdto, MultipartFile banner1, MultipartFile banner2, MultipartFile banner3, MultipartFile banner4, String config, Model model) throws IOException  {
		int result = 0;
		if(amServ.countMainBanners()==0) {
			if(banner1 != null) {
				mbdto.setB_1(utils.FileUploaderCDN(banner1, "main/"));
			}
			if(banner2 != null) {
				mbdto.setB_2(utils.FileUploaderCDN(banner2, "main/"));
			}
			if(banner3 != null) {
				mbdto.setB_3(utils.FileUploaderCDN(banner3, "main/"));
			}
			if(banner4 != null) {
				mbdto.setB_4(utils.FileUploaderCDN(banner4, "main/"));
			}
			amServ.insertMainBanner(mbdto); //인서트
		} else {
			MainBannerDto mbdto_up = amServ.selectMainBanners();
			if(banner1 != null) {
				mbdto_up.setB_1(utils.FileUploaderCDN(banner1, "main/"));
			}
			if(banner2 != null) {
				mbdto_up.setB_2(utils.FileUploaderCDN(banner2, "main/"));
			}
			if(banner3 != null) {
				mbdto_up.setB_3(utils.FileUploaderCDN(banner3, "main/"));
			}
			if(banner4 != null) {
				mbdto_up.setB_4(utils.FileUploaderCDN(banner4, "main/"));
			}
			amServ.updateMainBanner(mbdto_up); //업데이트
		}
		
		MainBannerDto mbdto2 = amServ.selectMainBanners();
		model.addAttribute("mbdto", mbdto2);
		
//		if(banner1 != null) {
//			if(amServ.countMainBanners()==0) {
//				mbdto.setB_1(utils.FileUploaderCDN(banner2, "main/"));
//			} else {
//				mbdto.
//			}
//		}
//		
		return result;
		
	}
	
	
	
	
//	@ResponseBody
//	@RequestMapping("admin_file")
//	public List<MainBannerDto> admin_file(MultipartFile banner1, MultipartFile banner2, MultipartFile banner3, MultipartFile banner4, String config, Model model) throws IOException  {
//		//컬럼명을 banner1 banner2 banner3 banner4 로 하고
//		//디비에 값이 하나도 없으면 insert로 넣고,
//		//디비에 값이 있으면 무조건 where절 걸어서 update 시키는 간단한 방법을 두고..
//		//이렇게 삽질을 했네요 ^^
//		
//		ArrayList<MainBannerDto> mblist = new ArrayList<MainBannerDto>();
//		List<MainBannerDto> check = amServ.selectMainBanners(); //기존 이미지가 있는지 확인해야해서..
//
//		if(banner1 != null) {
//			MainBannerDto mbdto = new MainBannerDto(); 
//			if(check.size() != 0) {
//				for(int i=0; i<check.size(); i++) {
//					if(check.get(i).getOrders().equals("banner1")) {
//						amServ.deleteMainBanner("banner1");
//					}
//				}
//			}
//			mbdto.setOrders("banner1");
//			mbdto.setFiles(utils.FileUploaderCDN(banner1, "main/"));
//			mblist.add(mbdto);
//		}
//		
//		if(banner2 != null) {
//			MainBannerDto mbdto = new MainBannerDto(); 
//			if(check.size() != 0) {
//				for(int i=0; i<check.size(); i++) {
//					if(check.get(i).getOrders().equals("banner2")) {
//						amServ.deleteMainBanner("banner2");
//					}
//				}
//			}
//			mbdto.setOrders("banner2");
//			mbdto.setFiles(utils.FileUploaderCDN(banner2, "main/"));
//			mblist.add(mbdto);
//		}
//		if(banner3 != null) {
//			MainBannerDto mbdto = new MainBannerDto(); 
//			if(check.size() != 0) {
//				for(int i=0; i<check.size(); i++) {
//					if(check.get(i).getOrders().equals("banner3")) {
//						amServ.deleteMainBanner("banner3");
//					}
//				}
//			}
//			mbdto.setOrders("banner3");
//			mbdto.setFiles(utils.FileUploaderCDN(banner3, "main/"));
//			mblist.add(mbdto);
//		}
//		if(banner4 != null) {
//			MainBannerDto mbdto = new MainBannerDto(); 
//			if(check.size() != 0) {
//				for(int i=0; i<check.size(); i++) {
//					if(check.get(i).getOrders().equals("banner4")) {
//						amServ.deleteMainBanner("banner4");
//					}
//				}
//			}
//			mbdto.setOrders("banner4");
//			mbdto.setFiles(utils.FileUploaderCDN(banner4, "main/"));
//			mblist.add(mbdto);
//		}
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("mblist", mblist);//다중insert하려고 맵에 넣음
//		amServ.insertMainBanner(map);//메인배너db에 insert
//		List<MainBannerDto> mbdtos = amServ.selectMainBanners();
//		return mbdtos;
//	}
	
}
