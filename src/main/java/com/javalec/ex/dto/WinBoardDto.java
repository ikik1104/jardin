package com.javalec.ex.dto;

import java.sql.Timestamp;

public class WinBoardDto {//당첨자 게시글 DTO
	
	private int rownum;
	private int wb_num;//당첨자 게시글 고유번호
	private int ad_num;//관리자 고유번호(작성자)
	private int e_num;//해당 이벤트 게시글 고유번호
	private String wb_title;//제목
	private int wb_hit;//조회수
	private String wb_content;//내용
	private Timestamp wb_date;//등록일
	
	public int getWb_num() {
		return wb_num;
	}
	public void setWb_num(int wb_num) {
		this.wb_num = wb_num;
	}
	public int getAd_num() {
		return ad_num;
	}
	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public String getWb_title() {
		return wb_title;
	}
	public void setWb_title(String wb_title) {
		this.wb_title = wb_title;
	}
	public int getWb_hit() {
		return wb_hit;
	}
	public void setWb_hit(int wb_hit) {
		this.wb_hit = wb_hit;
	}
	public String getWb_content() {
		return wb_content;
	}
	public void setWb_content(String wb_content) {
		this.wb_content = wb_content;
	}
	public Timestamp getWb_date() {
		return wb_date;
	}
	public void setWb_date(Timestamp wb_date) {
		this.wb_date = wb_date;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	
	

}
