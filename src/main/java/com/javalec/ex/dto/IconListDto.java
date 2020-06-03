package com.javalec.ex.dto;

import java.sql.Timestamp;

public class IconListDto {
	private int rownum;		//DB에서 가져오는 rownum
	private int ic_num;     //아이콘고유번호
	private String ic_name;     //아이콘명
	private String ic_img;     //아이콘이미지
	private String ic_usage;     //사용상태
	private Timestamp ic_sysdate;     //등록일
	private Timestamp ic_update;     //수정일
	
	public IconListDto() {}

	public IconListDto(int ic_num, String ic_name, String ic_img, String ic_usage, Timestamp ic_sysdate,
			Timestamp ic_update) {
		super();
		this.ic_num = ic_num;
		this.ic_name = ic_name;
		this.ic_img = ic_img;
		this.ic_usage = ic_usage;
		this.ic_sysdate = ic_sysdate;
		this.ic_update = ic_update;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}	
	public int getIc_num() {
		return ic_num;
	}

	public void setIc_num(int ic_num) {
		this.ic_num = ic_num;
	}

	public String getIc_name() {
		return ic_name;
	}

	public void setIc_name(String ic_name) {
		this.ic_name = ic_name;
	}

	public String getIc_img() {
		return ic_img;
	}

	public void setIc_img(String ic_img) {
		this.ic_img = ic_img;
	}

	public String getIc_usage() {
		return ic_usage;
	}

	public void setIc_usage(String ic_usage) {
		this.ic_usage = ic_usage;
	}

	public Timestamp getIc_sysdate() {
		return ic_sysdate;
	}

	public void setIc_sysdate(Timestamp ic_sysdate) {
		this.ic_sysdate = ic_sysdate;
	}

	public Timestamp getIc_update() {
		return ic_update;
	}

	public void setIc_update(Timestamp ic_update) {
		this.ic_update = ic_update;
	}
	
	
}
