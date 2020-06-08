package com.javalec.ex.dto;

public class UtilDto {
	//페이징, 검색 변수 담는 Dto
	
	int page;
	int listcount;
	int startrow;
	int endrow;
	int startpage;
	int endpage;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getListcount() {
		return listcount;
	}
	public void setListcount(int listcount) {
		this.listcount = listcount;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	
	
}
