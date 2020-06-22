package com.javalec.ex.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.CommentDto;

@Repository
public interface CommentDao {

	ArrayList<CommentDto> comment_list();
}
