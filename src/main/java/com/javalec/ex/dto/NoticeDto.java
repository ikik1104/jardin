package com.javalec.ex.dto;

import java.sql.Timestamp;

public class NoticeDto {

	private int no_num;     //공지글 번호
	private int ad_num;     //관리자 고유번호(작성자)
	private String no_title;     //제목
	private String no_content;     //내용
	private Timestamp no_date;     //등록일
	private int no_hit;     //조회수
	
	public NoticeDto() {}

	public NoticeDto(int no_num, int ad_num, String no_title, String no_content, Timestamp no_date, int no_hit) {
		super();
		this.no_num = no_num;
		this.ad_num = ad_num;
		this.no_title = no_title;
		this.no_content = no_content;
		this.no_date = no_date;
		this.no_hit = no_hit;
	}

	public int getNo_num() {
		return no_num;
	}

	public void setNo_num(int no_num) {
		this.no_num = no_num;
	}

	public int getAd_num() {
		return ad_num;
	}

	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}

	public String getNo_title() {
		return no_title;
	}

	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}

	public String getNo_content() {
		return no_content;
	}

	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}

	public Timestamp getNo_date() {
		return no_date;
	}

	public void setNo_date(Timestamp no_date) {
		this.no_date = no_date;
	}

	public int getNo_hit() {
		return no_hit;
	}

	public void setNo_hit(int no_hit) {
		this.no_hit = no_hit;
	}
	
	
	
	
}
