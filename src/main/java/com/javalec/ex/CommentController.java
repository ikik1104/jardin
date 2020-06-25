package com.javalec.ex;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.CommentDto;
import com.javalec.ex.service.AdminBoardService;


@Controller
public class CommentController {
	@Autowired
	private AdminBoardService abService;
//	@Autowired
//	private SqlSession sqlSession;
	
	/*
	@RequestMapping("/comment") //댓글 달기 페이지
	public String comment() {
		
		return "comment";
	}
	@ResponseBody
	@RequestMapping("/comment_List")
	public List<CommentDto> comment_List(){
		return abService.comment_List();
		
	}

	@ResponseBody
	@RequestMapping("/comment_delete")
	public int comment_delete(@RequestBody int cId){
		return abService.comment_delete(cId);
		
	}
	
		*/
}
