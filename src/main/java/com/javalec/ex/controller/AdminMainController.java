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
import com.javalec.ex.dto.MainJardinDto;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.AdminMainService;

@Controller
public class AdminMainController {

	@Autowired
	AdminMainService amServ;
	@Autowired
	CommonUtils utils;
	@Autowired
	AdminCouponService cpservice;
	
	@RequestMapping("admin_main")
	public String admin_main(Model model) {
//		List<MainBannerDto> mbdtos = amServ.selectMainBanners();
//		model.addAttribute("mbdtos", mbdtos);
		//롤배너
		MainBannerDto mbdto2 = amServ.selectMainBanners();
		model.addAttribute("mbdto", mbdto2);
		//중간왼쪽배너
		String file_name = amServ.selectMl();
		model.addAttribute("left", file_name);
		//중간오른쪽배너
		String file_name2 = amServ.selectMr();
		model.addAttribute("right", file_name2);
		return "admin/main/main";
	}
	
	//롤배너
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
		return result;
	}
	
	//중간배너 - left
	@ResponseBody
	@RequestMapping("middle_left")
	public int middle_left(MainBannerDto mbdto, MultipartFile mid_left, String config, Model model) throws IOException  {
		int result = 0;
		String file_name = amServ.selectMl();
		System.out.println(file_name);
		if(file_name==null) {
			//유효성으로 input에 아무것도 없이 등록 누르면 경고창 띄우기
			file_name = utils.FileUploaderCDN(mid_left, "main/");
			amServ.insertMl(file_name);
		} else {
			file_name = utils.FileUploaderCDN(mid_left, "main/");
			int update = amServ.updateMl(file_name);
		}
		return result;
	}
	
	//중간배너 - right
	@ResponseBody
	@RequestMapping("middle_right")
	public int middle_right(MainBannerDto mbdto, MultipartFile mid_right, String config, Model model) throws IOException  {
		int result = 0;
		String file_name = amServ.selectMr();
		System.out.println(file_name);
		if(file_name==null) {
			//유효성으로 input에 아무것도 없이 등록 누르면 경고창 띄우기
			file_name = utils.FileUploaderCDN(mid_right, "main/");
			amServ.insertMr(file_name);
		} else {
			file_name = utils.FileUploaderCDN(mid_right, "main/");
			int update = amServ.updateMr(file_name);
		}
		return result;
	}
	
	//sale
//	@RequestMapping("admin_sale")
//	public String ad_sale(Model model) {
//		model.addAttribute("jb", amServ.selectJd()); //선택되어있는애들 가져오기...
//		model.addAttribute("product_list", cpservice.getAllProducts());
//		return "admin/main/sale";
//	}
//	
	
	//jardin brand
	@RequestMapping("jardin_brand")
	public String ad_jardin_brand(Model model) {
		model.addAttribute("jb", amServ.selectJd()); //선택되어있는애들 가져오기...
		model.addAttribute("product_list", cpservice.getAllProducts());
		return "admin/main/jardin_brand";
	}
	
	@RequestMapping("jardin_brand_regi")
	public String jardin_brand_regi(MainJardinDto mainJardinDto) {
		//
		if(amServ.countJd()==0) {
			amServ.insertJardinBrand(mainJardinDto);
		} else {
			amServ.updateJardinBrand(mainJardinDto);
		}
		return "redirect:jardin_brand";
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
