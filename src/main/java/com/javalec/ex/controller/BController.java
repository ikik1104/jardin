package com.javalec.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.ex.service.BService;

@Controller
public class BController {
	@Autowired
	private BService bService;

	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("list", bService.getAllBoards());
		return "list";
	}

}
