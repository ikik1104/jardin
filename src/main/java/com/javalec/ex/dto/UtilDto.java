package com.javalec.ex.dto;

public class UtilDto {
	
	//페이징, 검색 변수
	private int page;
	private int listcount;
	private int startrow;
	private int endrow;
	private int startpage;
	private int endpage;
	
	//이벤트 새로 등록할 때 사용(날짜를 String으로 받으려고..)
	private int rownum;		//DB에서 가져오는 rownum
	private String e_num;//이벤트 고유번호
	private String e_title; //제목	
	private String e_thumb_img; //썸네일 이미지
	private String e_content_img; //내용 이미지
	private String e_content; //글내용	
	private int co_num; //이벤트 쿠폰
	private int ad_num;//관리자 고유번호(작성자)
	private String e_start_day;
	private String e_end_day;	
	private String e_win_day;		
	
	//임시 변수 담는 변수
	private int temp_int;
	
	//쿠폰 시작일, 종료일 받는 변수
	private String co_start_day_str;
	private String co_end_day_str;
	
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
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public String getE_thumb_img() {
		return e_thumb_img;
	}
	public void setE_thumb_img(String e_thumb_img) {
		this.e_thumb_img = e_thumb_img;
	}
	public String getE_content_img() {
		return e_content_img;
	}
	public void setE_content_img(String e_content_img) {
		this.e_content_img = e_content_img;
	}
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public int getCo_num() {
		return co_num;
	}
	public void setCo_num(int co_num) {
		this.co_num = co_num;
	}
	public int getAd_num() {
		return ad_num;
	}
	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}
	public String getE_start_day() {
		return e_start_day;
	}
	public void setE_start_day(String e_start_day) {
		this.e_start_day = e_start_day;
	}
	public String getE_end_day() {
		return e_end_day;
	}
	public void setE_end_day(String e_end_day) {
		this.e_end_day = e_end_day;
	}
	public String getE_win_day() {
		return e_win_day;
	}
	public void setE_win_day(String e_win_day) {
		this.e_win_day = e_win_day;
	}
	public String getE_num() {
		return e_num;
	}
	public void setE_num(String e_num) {
		this.e_num = e_num;
	}
	public int getTemp_int() {
		return temp_int;
	}
	public void setTemp_int(int temp_int) {
		this.temp_int = temp_int;
	}
	public String getCo_start_day_str() {
		return co_start_day_str;
	}
	public void setCo_start_day_str(String co_start_day_str) {
		this.co_start_day_str = co_start_day_str;
	}
	public String getCo_end_day_str() {
		return co_end_day_str;
	}
	public void setCo_end_day_str(String co_end_day_str) {
		this.co_end_day_str = co_end_day_str;
	}

	
	
}
