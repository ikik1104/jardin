package com.javalec.ex.dto;

import java.sql.Timestamp;

public class UtilDto {
	
	//페이징, 검색 변수
	private int page;
	private int listcount;
	private int startrow;
	private int endrow;
	private int startpage;
	private int endpage;
	
	//이벤트 수정할 때 사용(날짜를 String으로 받으려고..)
	private int rownum;		//DB에서 가져오는 rownum
	private String e_start_day;
	private String e_end_day;	
	private String e_win_day;		
	private String e_title;
	private String e_content;
	private int co_num;
	private int e_num;
	
	//임시 변수 담는 변수
	private int temp_int;
	private int temp_int2;	
	private String str1;
	private String str2;
	private String str3;
	private String str4;	
	private String str5;
	private String str6;
	private String str7;	
	private String str8;
	private Timestamp time1;
	private Timestamp time2;	
	private Timestamp time3;
	
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

	public int getTemp_int() {
		return temp_int;
	}
	public void setTemp_int(int temp_int) {
		this.temp_int = temp_int;
	}
	public String getStr1() {
		return str1;
	}
	public void setStr1(String str1) {
		this.str1 = str1;
	}
	public String getStr2() {
		return str2;
	}
	public void setStr2(String str2) {
		this.str2 = str2;
	}
	public String getStr3() {
		return str3;
	}
	public void setStr3(String str3) {
		this.str3 = str3;
	}
	public String getStr4() {
		return str4;
	}
	public void setStr4(String str4) {
		this.str4 = str4;
	}
	public String getStr5() {
		return str5;
	}
	public void setStr5(String str5) {
		this.str5 = str5;
	}
	public String getStr6() {
		return str6;
	}
	public void setStr6(String str6) {
		this.str6 = str6;
	}

	public int getTemp_int2() {
		return temp_int2;
	}
	public void setTemp_int2(int temp_int2) {
		this.temp_int2 = temp_int2;
	}
	public Timestamp getTime1() {
		return time1;
	}
	public void setTime1(Timestamp time1) {
		this.time1 = time1;
	}
	public Timestamp getTime2() {
		return time2;
	}
	public void setTime2(Timestamp time2) {
		this.time2 = time2;
	}
	public Timestamp getTime3() {
		return time3;
	}
	public void setTime3(Timestamp time3) {
		this.time3 = time3;
	}
	public String getStr7() {
		return str7;
	}
	public void setStr7(String str7) {
		this.str7 = str7;
	}
	public String getStr8() {
		return str8;
	}
	public void setStr8(String str8) {
		this.str8 = str8;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
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
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}

	
	
}
