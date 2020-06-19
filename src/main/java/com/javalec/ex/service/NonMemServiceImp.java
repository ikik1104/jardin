package com.javalec.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.NonMemDao;

@Service
public class NonMemServiceImp implements NonMemService {

	@Autowired
	NonMemDao nmdao;
	
}


