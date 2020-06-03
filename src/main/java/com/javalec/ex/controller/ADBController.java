package com.javalec.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.ex.service.ADBService;
import com.javalec.ex.service.BService;

@Controller
public class ADBController {

	@Autowired
	private ADBService adbservice;
	
	@RequestMapping("mtm_list")
	public String mtm_list(Model model) {
		model.addAttribute("mtm_list", adbservice.getAllBoards());
		return "admin/board/mtm_list";
	}	
	
}
