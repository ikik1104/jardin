package com.javalec.ex.dto;

import java.sql.Timestamp;

public class LevelDto {

	private int rownum;
	private int lv_num;//등급번호
	private String lv_name;//등급명
	private int lv_sort_money;//등급 분류 기준 금액
	private Timestamp lv_date;//등록일
	private int lv_order;//등급순서
	private String lv_des;//등급 분류 기준 설명
	private String lv_benefit;//혜택
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getLv_num() {
		return lv_num;
	}
	public void setLv_num(int lv_num) {
		this.lv_num = lv_num;
	}
	public String getLv_name() {
		return lv_name;
	}
	public void setLv_name(String lv_name) {
		this.lv_name = lv_name;
	}
	public int getLv_sort_money() {
		return lv_sort_money;
	}
	public void setLv_sort_money(int lv_sort_money) {
		this.lv_sort_money = lv_sort_money;
	}
	public String getLv_des() {
		return lv_des;
	}
	public void setLv_des(String lv_des) {
		this.lv_des = lv_des;
	}
	public String getLv_benefit() {
		return lv_benefit;
	}
	public void setLv_benefit(String lv_benefit) {
		this.lv_benefit = lv_benefit;
	}
	public Timestamp getLv_date() {
		return lv_date;
	}
	public void setLv_date(Timestamp lv_date) {
		this.lv_date = lv_date;
	}
	public int getLv_order() {
		return lv_order;
	}
	public void setLv_order(int lv_order) {
		this.lv_order = lv_order;
	}
	
	
	
}
