package com.javalec.ex.dto;

public class MainBannerDto {
	private String b_1;
	private String b_2;
	private String b_3;
	private String b_4;
	public MainBannerDto() {}
	public MainBannerDto(String b_1, String b_2, String b_3, String b_4) {
		super();
		this.b_1 = b_1;
		this.b_2 = b_2;
		this.b_3 = b_3;
		this.b_4 = b_4;
	}
	public synchronized String getB_1() {
		return b_1;
	}
	public synchronized void setB_1(String b_1) {
		this.b_1 = b_1;
	}
	public synchronized String getB_2() {
		return b_2;
	}
	public synchronized void setB_2(String b_2) {
		this.b_2 = b_2;
	}
	public synchronized String getB_3() {
		return b_3;
	}
	public synchronized void setB_3(String b_3) {
		this.b_3 = b_3;
	}
	public synchronized String getB_4() {
		return b_4;
	}
	public synchronized void setB_4(String b_4) {
		this.b_4 = b_4;
	}
	
	
	
}
