package com.javalec.ex.dto;

import java.sql.Timestamp;

public class MtmUserDto {

	private int iu_num;     //1:1 문의 고유번호
	private int m_num;     //회원 고유번호(작성자)
	private String iu_title;     //제목
	private String iu_content;     //내용
	private String iu_sort;     //분류
	private Timestamp iu_date;     //등록일
	private String iu_status;     //답변 상태
	private String iu_img;     //첨부 이미지
	
	public MtmUserDto() {}

	public MtmUserDto(int iu_num, int m_num, String iu_title, String iu_content, String iu_sort, Timestamp iu_date,
			String iu_status, String iu_img) {
		super();
		this.iu_num = iu_num;
		this.m_num = m_num;
		this.iu_title = iu_title;
		this.iu_content = iu_content;
		this.iu_sort = iu_sort;
		this.iu_date = iu_date;
		this.iu_status = iu_status;
		this.iu_img = iu_img;
	}

	public int getIu_num() {
		return iu_num;
	}

	public void setIu_num(int iu_num) {
		this.iu_num = iu_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getIu_title() {
		return iu_title;
	}

	public void setIu_title(String iu_title) {
		this.iu_title = iu_title;
	}

	public String getIu_content() {
		return iu_content;
	}

	public void setIu_content(String iu_content) {
		this.iu_content = iu_content;
	}

	public String getIu_sort() {
		return iu_sort;
	}

	public void setIu_sort(String iu_sort) {
		this.iu_sort = iu_sort;
	}

	public Timestamp getIu_date() {
		return iu_date;
	}

	public void setIu_date(Timestamp iu_date) {
		this.iu_date = iu_date;
	}

	public String getIu_status() {
		return iu_status;
	}

	public void setIu_status(String iu_status) {
		this.iu_status = iu_status;
	}

	public String getIu_img() {
		return iu_img;
	}

	public void setIu_img(String iu_img) {
		this.iu_img = iu_img;
	}
	
	
	
}
