package com.javalec.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.MainDao;

@Service
public class MainServiceImp implements MainService {

	@Autowired
	MainDao mdao;
	
}
