package com.javalec.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMainController {

	@RequestMapping("admin_main")
	public String admin_main() {
		return "admin/main/main";
	}
	
	
	
}
