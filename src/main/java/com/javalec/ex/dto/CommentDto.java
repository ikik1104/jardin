package com.javalec.ex.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class CommentDto {

	private int cId;
	private int bId;
	private String cContnet;
	private String cName;
	private Timestamp cDate;
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getcContnet() {
		return cContnet;
	}
	public void setcContnet(String cContnet) {
		this.cContnet = cContnet;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public Timestamp getcDate() {
		return cDate;
	}
	public void setcDate(Timestamp cDate) {
		this.cDate = cDate;
	}
	public CommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentDto(int cId, int bId, String cContnet, String cName, Timestamp cDate) {
		super();
		this.cId = cId;
		this.bId = bId;
		this.cContnet = cContnet;
		this.cName = cName;
		this.cDate = cDate;
	}
	
	
	
	
}
