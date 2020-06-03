package com.javalec.ex.dto;

public class AdminDto {

	private int rownum;		//DB에서 가져오는 rownum
	private int ad_num; //������ ������ȣ
	private String ad_id; //���̵�
	private String ad_pw; //�н�����
	private String ad_name; //�̸�
	private String ad_grade; //�����ڵ��
	public AdminDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminDto(int ad_num, String ad_id, String ad_pw, String ad_name, String ad_grade) {
		super();
		this.ad_num = ad_num;
		this.ad_id = ad_id;
		this.ad_pw = ad_pw;
		this.ad_name = ad_name;
		this.ad_grade = ad_grade;
	}
	
	public int getRownum() {
		return rownum;
	}
	
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}	
	public int getAd_num() {
		return ad_num;
	}
	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}
	public String getAd_id() {
		return ad_id;
	}
	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}
	public String getAd_pw() {
		return ad_pw;
	}
	public void setAd_pw(String ad_pw) {
		this.ad_pw = ad_pw;
	}
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}
	public String getAd_grade() {
		return ad_grade;
	}
	public void setAd_grade(String ad_grade) {
		this.ad_grade = ad_grade;
	}
	
	
	
}
