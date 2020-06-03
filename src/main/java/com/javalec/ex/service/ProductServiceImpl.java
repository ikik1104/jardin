package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.BDao;
import com.javalec.ex.dao.ProductDao;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.ProductDto;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao pDao;

	//제품 전체 리스트
	@Override
	public List<ProductDto> getAllPList() {
		
		return pDao.getAllPList();
	}

	//제품 insert
	@Override
	public void insertProduct(ProductDto pdto) {
	
		pDao.insertProduct(pdto);
	}

	//제품 하나의 정보
	@Override
	public ProductDto getProductInfo(int p_num) {

		return pDao.getProductInfo(p_num);
	}

	//제품 수정
	@Override
	public void updateProduct(ProductDto pdto) {
		// TODO Auto-generated method stub
		
	}



}
