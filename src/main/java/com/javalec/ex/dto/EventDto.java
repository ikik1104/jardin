package com.javalec.ex.dto;

import java.sql.Timestamp;

public class EventDto {

	private int e_num; //이벤트 고유번호
	private String e_title; //제목
	private Timestamp e_start_day; //시작일
	private Timestamp e_end_day; //종료일
	private String e_thumb_img; //썸네일 이미지
	private String e_content_img; //내용 이미지
	private String e_content; //글내용
	private Timestamp e_sysdate; //등록일
	private int co_num; //이벤트 쿠폰
	private Timestamp e_win_day; //당첨자 발표일
	
	public EventDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EventDto(int e_num, String e_title, Timestamp e_start_day, Timestamp e_end_day, String e_thumb_img,
			String e_content_img, String e_content, Timestamp e_sysdate, int co_num, Timestamp e_win_day) {
		super();
		this.e_num = e_num;
		this.e_title = e_title;
		this.e_start_day = e_start_day;
		this.e_end_day = e_end_day;
		this.e_thumb_img = e_thumb_img;
		this.e_content_img = e_content_img;
		this.e_content = e_content;
		this.e_sysdate = e_sysdate;
		this.co_num = co_num;
		this.e_win_day = e_win_day;
	}
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public Timestamp getE_start_day() {
		return e_start_day;
	}
	public void setE_start_day(Timestamp e_start_day) {
		this.e_start_day = e_start_day;
	}
	public Timestamp getE_end_day() {
		return e_end_day;
	}
	public void setE_end_day(Timestamp e_end_day) {
		this.e_end_day = e_end_day;
	}
	public String getE_thumb_img() {
		return e_thumb_img;
	}
	public void setE_thumb_img(String e_thumb_img) {
		this.e_thumb_img = e_thumb_img;
	}
	public String getE_content_img() {
		return e_content_img;
	}
	public void setE_content_img(String e_content_img) {
		this.e_content_img = e_content_img;
	}
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public Timestamp getE_sysdate() {
		return e_sysdate;
	}
	public void setE_sysdate(Timestamp e_sysdate) {
		this.e_sysdate = e_sysdate;
	}
	public int getCo_num() {
		return co_num;
	}
	public void setCo_num(int co_num) {
		this.co_num = co_num;
	}
	public Timestamp getE_win_day() {
		return e_win_day;
	}
	public void setE_win_day(Timestamp e_win_day) {
		this.e_win_day = e_win_day;
	}
	
	
}
