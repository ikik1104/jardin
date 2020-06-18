package com.javalec.ex.dto;

import java.sql.Timestamp;

public class ReviewUserDto {
	private int rownum;		//DB에서 가져오는 rownum
	private int ru_num;     //리뷰 고유번호
	private int  p_num;     //리뷰 제품 고유번호
	private int m_num;     //회원 고유번호(작성자)
	private String ru_title;     //제목
	private String ru_content;     //내용
	private int ru_score;     //평점
	private Timestamp ru_date;     //등록일
	private int ru_hit;     //조회수
	private String ru_status;     //답변 상태
	private String ru_visility;     //노출 여부
	private String ru_img;     //첨부 이미지
	private String ru_type; // 리뷰타입 - 포토, 일반
	private int ol_num; // 주문 고유번호
	
	public ReviewUserDto() {}

	public ReviewUserDto(int rownum, int ru_num, int p_num, int m_num, String ru_title, String ru_content, int ru_score,
			Timestamp ru_date, int ru_hit, String ru_status, String ru_visility, String ru_img, String ru_type) {
		super();
		this.rownum = rownum;
		this.ru_num = ru_num;
		this.p_num = p_num;
		this.m_num = m_num;
		this.ru_title = ru_title;
		this.ru_content = ru_content;
		this.ru_score = ru_score;
		this.ru_date = ru_date;
		this.ru_hit = ru_hit;
		this.ru_status = ru_status;
		this.ru_visility = ru_visility;
		this.ru_img = ru_img;
		this.ru_type = ru_type;
	}

	
	
	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getRu_num() {
		return ru_num;
	}

	public void setRu_num(int ru_num) {
		this.ru_num = ru_num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getRu_title() {
		return ru_title;
	}

	public void setRu_title(String ru_title) {
		this.ru_title = ru_title;
	}

	public String getRu_content() {
		return ru_content;
	}

	public void setRu_content(String ru_content) {
		this.ru_content = ru_content;
	}

	public int getRu_score() {
		return ru_score;
	}

	public void setRu_score(int ru_score) {
		this.ru_score = ru_score;
	}

	public Timestamp getRu_date() {
		return ru_date;
	}

	public void setRu_date(Timestamp ru_date) {
		this.ru_date = ru_date;
	}

	public int getRu_hit() {
		return ru_hit;
	}

	public void setRu_hit(int ru_hit) {
		this.ru_hit = ru_hit;
	}

	public String getRu_status() {
		return ru_status;
	}

	public void setRu_status(String ru_status) {
		this.ru_status = ru_status;
	}

	public String getRu_visility() {
		return ru_visility;
	}

	public void setRu_visility(String ru_visility) {
		this.ru_visility = ru_visility;
	}

	public String getRu_img() {
		return ru_img;
	}

	public void setRu_img(String ru_img) {
		this.ru_img = ru_img;
	}

	public String getRu_type() {
		return ru_type;
	}

	public void setRu_type(String ru_type) {
		this.ru_type = ru_type;
	}

	public int getOl_num() {
		return ol_num;
	}

	public void setOl_num(int ol_num) {
		this.ol_num = ol_num;
	}
	
	
}
