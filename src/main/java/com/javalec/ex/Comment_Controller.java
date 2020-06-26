package com.javalec.ex;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.CommentDto;
import com.javalec.ex.service.CommentService;

@Controller
public class Comment_Controller {
	

	@Autowired
	CommentService cs;
	@RequestMapping("comment")
	public String comment() {

		return "comment";
	}
	
	@ResponseBody
	@RequestMapping("comment_list")
	public List<CommentDto> comment_list(){
		return cs.comment_list();
	}
}
