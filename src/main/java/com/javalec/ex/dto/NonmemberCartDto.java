package com.javalec.ex.dto;

public class NonmemberCartDto {
	
	private int p_amt;
	private ProductDto pDto;
	
	public NonmemberCartDto() {}
	
	public NonmemberCartDto(int p_amt, ProductDto pDto) {
		super();
		this.p_amt = p_amt;
		this.pDto = pDto;
	}

	public int getP_amt() {
		return p_amt;
	}

	public void setP_amt(int p_amt) {
		this.p_amt = p_amt;
	}

	public ProductDto getpDto() {
		return pDto;
	}

	public void setpDto(ProductDto pDto) {
		this.pDto = pDto;
	}
	
	
}
