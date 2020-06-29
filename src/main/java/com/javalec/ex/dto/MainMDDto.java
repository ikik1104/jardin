package com.javalec.ex.dto;

import org.springframework.stereotype.Controller;

@Controller
public class MainMDDto {

	private int p_num;
	private String explain;
	private ProductDto pDto;
	
	public MainMDDto() {}

	public MainMDDto(int p_num, String explain, ProductDto pDto) {
		super();
		this.p_num = p_num;
		this.explain = explain;
		this.pDto = pDto;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public ProductDto getpDto() {
		return pDto;
	}

	public void setpDto(ProductDto pDto) {
		this.pDto = pDto;
	}
	
}
