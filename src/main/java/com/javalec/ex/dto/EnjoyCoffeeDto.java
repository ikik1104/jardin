package com.javalec.ex.dto;

import java.sql.Timestamp;

public class EnjoyCoffeeDto {
	private int rownum;		//DB에서 가져오는 rownum
	private int ej_num;     //인조이커피 고유번호
	private int ad_num;     //관리자 고유번호(작성자)
	private String ej_title;     //제목
	private String ej_content;     //내용
	private Timestamp ej_date;     //등록일
	private String ej_img;     //썸네일 이미지
	private int ej_hit;     //조회수

	public EnjoyCoffeeDto() {}

	public EnjoyCoffeeDto(int ej_num, int ad_num, String ej_title, String ej_content, Timestamp ej_date, String ej_img,
			int ej_hit) {
		super();
		this.ej_num = ej_num;
		this.ad_num = ad_num;
		this.ej_title = ej_title;
		this.ej_content = ej_content;
		this.ej_date = ej_date;
		this.ej_img = ej_img;
		this.ej_hit = ej_hit;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}		
	public int getEj_num() {
		return ej_num;
	}

	public void setEj_num(int ej_num) {
		this.ej_num = ej_num;
	}

	public int getAd_num() {
		return ad_num;
	}

	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}

	public String getEj_title() {
		return ej_title;
	}

	public void setEj_title(String ej_title) {
		this.ej_title = ej_title;
	}

	public String getEj_content() {
		return ej_content;
	}

	public void setEj_content(String ej_content) {
		this.ej_content = ej_content;
	}

	public Timestamp getEj_date() {
		return ej_date;
	}

	public void setEj_date(Timestamp ej_date) {
		this.ej_date = ej_date;
	}

	public String getEj_img() {
		return ej_img;
	}

	public void setEj_img(String ej_img) {
		this.ej_img = ej_img;
	}

	public int getEj_hit() {
		return ej_hit;
	}

	public void setEj_hit(int ej_hit) {
		this.ej_hit = ej_hit;
	}
	
	
	
}
