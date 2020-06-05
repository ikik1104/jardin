package com.javalec.ex.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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

		pDao.updateProduct(pdto);
	}

	//제품 삭제처리
	@Override
	public int deleteProduct(int p_num) {
		
		return pDao.deleteProduct(p_num);
	}

	//삭제된 제품리스트
	@Override
	public List<ProductDto> getDelPList() {

		return pDao.getDelPList();
	}

	//상품 복구처리
	@Override
	public int backProduct(int p_num) {
		
		return  pDao.backProduct(p_num);
	}

	//검색한 상품 리스트
	@Override
	public List<ProductDto> getSearchList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		Iterator<String> mapIter = map.keySet().iterator();
				
		 while(mapIter.hasNext()){
			 
	            String key = mapIter.next();
	            String value = (String) map.get( key );
	 
	            System.out.println(key+":"+value);
	 
	        }
		return pDao.getSearchList(map);
	}

	@Override
	public List<ProductDto> getU_ProductList(String p_step2) {
		return pDao.getU_ProductList(p_step2);
	}

	
	


}
