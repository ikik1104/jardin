package com.javalec.ex.dto;

import java.sql.Timestamp;

public class FaqDto {

	private int rownum;		//DB에서 가져오는 rownum
	private int f_num; //FAQ 고유번호
	private String f_step; //카테고리
	private String f_title; //질문
	private String f_content; //답변
	private Timestamp f_sysdate; //작성일
	private String f_delflag; //삭제유무? 노출여부 (N이 노출하는건데.. 이건 더 컬럼의 정확한 명칭을 생각하고 다시 정해야할듯)

	public FaqDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FaqDto(int f_num, String f_step, String f_title, String f_content, Timestamp f_sysdate, String f_delflag) {
		super();
		this.f_num = f_num;
		this.f_step = f_step;
		this.f_title = f_title;
		this.f_content = f_content;
		this.f_sysdate = f_sysdate;
		this.f_delflag = f_delflag;
	}
	

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}			
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public String getF_step() {
		return f_step;
	}
	public void setF_step(String f_step) {
		this.f_step = f_step;
	}
	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public Timestamp getF_sysdate() {
		return f_sysdate;
	}
	public void setF_sysdate(Timestamp f_sysdate) {
		this.f_sysdate = f_sysdate;
	}
	public String getF_delflag() {
		return f_delflag;
	}
	public void setF_delflag(String f_delflag) {
		this.f_delflag = f_delflag;
	}
	
	
}
