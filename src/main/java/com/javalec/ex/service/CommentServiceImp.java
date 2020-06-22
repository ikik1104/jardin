package com.javalec.ex.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.CommentDao;
import com.javalec.ex.dto.CommentDto;

@Service
public class CommentServiceImp implements CommentService {
	@Autowired
	CommentDao cd;
	
	@Override
	public ArrayList<CommentDto> comment_list() {
		return cd.comment_list();
	}

}
