package com.javalec.ex.dto;

import java.sql.Timestamp;

public class ReviewAnswerDto {

	private int ra_num;     //리뷰 답글 고유번호
	private int ru_num;     //리뷰 게시글 고유번호
	private int ad_num;     //관리자 고유번호(작성자)
	private String ra_content;     //내용
	private Timestamp ra_date;     //등록일
	
	public ReviewAnswerDto() {}

	public ReviewAnswerDto(int ra_num, int ru_num, int ad_num, String ra_content, Timestamp ra_date) {
		super();
		this.ra_num = ra_num;
		this.ru_num = ru_num;
		this.ad_num = ad_num;
		this.ra_content = ra_content;
		this.ra_date = ra_date;
	}

	public int getRa_num() {
		return ra_num;
	}

	public void setRa_num(int ra_num) {
		this.ra_num = ra_num;
	}

	public int getRu_num() {
		return ru_num;
	}

	public void setRu_num(int ru_num) {
		this.ru_num = ru_num;
	}

	public int getAd_num() {
		return ad_num;
	}

	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}

	public String getRa_content() {
		return ra_content;
	}

	public void setRa_content(String ra_content) {
		this.ra_content = ra_content;
	}

	public Timestamp getRa_date() {
		return ra_date;
	}

	public void setRa_date(Timestamp ra_date) {
		this.ra_date = ra_date;
	}
	
	
	
}
