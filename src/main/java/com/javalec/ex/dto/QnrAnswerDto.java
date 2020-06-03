package com.javalec.ex.dto;

import java.sql.Timestamp;

public class QnrAnswerDto {
	private int rownum;		//DB에서 가져오는 rownum
	private int qa_num;     //질문/답변 답변 고유번호
	private int qu_num;     //질문/답변 게시글 고유번호
	private int ad_num;     //관리자 고유번호(작성자)
	private String qa_content;     //내용
	private Timestamp qa_date;     //등록일
	
	public QnrAnswerDto() {}

	public QnrAnswerDto(int qa_num, int qu_num, int ad_num, String qa_content, Timestamp qa_date) {
		super();
		this.qa_num = qa_num;
		this.qu_num = qu_num;
		this.ad_num = ad_num;
		this.qa_content = qa_content;
		this.qa_date = qa_date;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}	
	public int getQa_num() {
		return qa_num;
	}

	public void setQa_num(int qa_num) {
		this.qa_num = qa_num;
	}

	public int getQu_num() {
		return qu_num;
	}

	public void setQu_num(int qu_num) {
		this.qu_num = qu_num;
	}

	public int getAd_num() {
		return ad_num;
	}

	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public Timestamp getQa_date() {
		return qa_date;
	}

	public void setQa_date(Timestamp qa_date) {
		this.qa_date = qa_date;
	}
	
	
}
