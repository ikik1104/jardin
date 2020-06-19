package com.javalec.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.javalec.ex.service.NonMemService;

@Controller
public class NonMemController {

	@Autowired
	NonMemService nmService;
	
	
	
}
