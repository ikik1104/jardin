package com.javalec.ex.dto;

import java.sql.Timestamp;

public class QnrUserDto {
	private int rownum;		//DB에서 가져오는 rownum
	private int qu_num;     //질문/답변 고유번호
	private int m_num;     //회원 고유번호(작성자)
	private int p_num;     //질문 제품 고유번호
	private String qu_title;     // 제목
	private String qu_content;     //내용
	private Timestamp qu_date;     //등록일
	private String qu_status;     //답변 상태
	private String qu_pw;     // 비밀번호
	
	public QnrUserDto() {}

	public QnrUserDto(int qu_num, int m_num, int p_num, String qu_title, String qu_content, Timestamp qu_date,
			String qu_status, String qu_pw) {
		super();
		this.qu_num = qu_num;
		this.m_num = m_num;
		this.p_num = p_num;
		this.qu_title = qu_title;
		this.qu_content = qu_content;
		this.qu_date = qu_date;
		this.qu_status = qu_status;
		this.qu_pw = qu_pw;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}	
	public int getQu_num() {
		return qu_num;
	}

	public void setQu_num(int qu_num) {
		this.qu_num = qu_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getQu_title() {
		return qu_title;
	}

	public void setQu_title(String qu_title) {
		this.qu_title = qu_title;
	}

	public String getQu_content() {
		return qu_content;
	}

	public void setQu_content(String qu_content) {
		this.qu_content = qu_content;
	}

	public Timestamp getQu_date() {
		return qu_date;
	}

	public void setQu_date(Timestamp qu_date) {
		this.qu_date = qu_date;
	}

	public String getQu_status() {
		return qu_status;
	}

	public void setQu_status(String qu_status) {
		this.qu_status = qu_status;
	}

	public String getQu_pw() {
		return qu_pw;
	}

	public void setQu_pw(String qu_pw) {
		this.qu_pw = qu_pw;
	}
	
	
	
}
