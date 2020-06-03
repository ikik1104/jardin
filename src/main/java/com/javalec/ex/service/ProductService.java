package com.javalec.ex.service;

import java.util.List;

import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.ProductDto;

public interface ProductService {
	
	//제품 전체 리스트
	List<ProductDto> getAllPList();
	
	//제품 insert
	void insertProduct(ProductDto pdto);

	//제품 하나의 정보
	ProductDto getProductInfo(int p_num);

	//제품 수정
	void updateProduct(ProductDto pdto);
	
	
}
