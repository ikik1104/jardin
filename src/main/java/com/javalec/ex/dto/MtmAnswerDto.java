package com.javalec.ex.dto;

import java.sql.Timestamp;

public class MtmAnswerDto {
	private int rownum;		//DB에서 가져오는 rownum
	private int ia_num;     //1:1 문의 답변 고유번호
	private int iu_num;     //1:1 문의 게시글 고유번호
	private int ad_num;     //관리자 고유번호(작성자)
	private String ia_content;     //내용
	private Timestamp ia_date;     //등록일

	public MtmAnswerDto() {	}

	public MtmAnswerDto(int ia_num, int iu_num, int ad_num, String ia_content, Timestamp ia_date) {
		super();
		this.ia_num = ia_num;
		this.iu_num = iu_num;
		this.ad_num = ad_num;
		this.ia_content = ia_content;
		this.ia_date = ia_date;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}	
	public int getIa_num() {
		return ia_num;
	}

	public void setIa_num(int ia_num) {
		this.ia_num = ia_num;
	}

	public int getIu_num() {
		return iu_num;
	}

	public void setIu_num(int iu_num) {
		this.iu_num = iu_num;
	}

	public int getAd_num() {
		return ad_num;
	}

	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}

	public String getIa_content() {
		return ia_content;
	}

	public void setIa_content(String ia_content) {
		this.ia_content = ia_content;
	}

	public Timestamp getIa_date() {
		return ia_date;
	}

	public void setIa_date(Timestamp ia_date) {
		this.ia_date = ia_date;
	}
	
	
	
}
