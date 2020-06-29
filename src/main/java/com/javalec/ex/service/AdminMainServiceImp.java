package com.javalec.ex.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.AdminMainDao;
import com.javalec.ex.dto.MainBannerDto;
import com.javalec.ex.dto.MainJardinDto;
import com.javalec.ex.dto.MainSaleDto;
import com.javalec.ex.dto.MainBsDto;
import com.javalec.ex.dto.MainMDDto;
import com.javalec.ex.dto.MainNewProductDto;
import com.javalec.ex.dto.ProductDto;

@Service
public class AdminMainServiceImp implements AdminMainService {

	@Autowired
	AdminMainDao amdao;

	@Override
	public int insertMainBanner(MainBannerDto mbdto) {
		return amdao.insertMainBanner(mbdto);
	}

	@Override
	public MainBannerDto selectMainBanners() {
		return amdao.selectMainBanners();
	}

	@Override
	public void deleteMainBanner(String orders) {
		amdao.deleteMainBanner(orders);
	}

	@Override
	public int countMainBanners() {
		return amdao.countMainBanners();
	}

	@Override
	public void updateMainBanner(MainBannerDto mbdto) {
		amdao.updateMainBanner(mbdto);
	}

	@Override
	public String selectMl() {
		String selectml = amdao.selectMl();
		return selectml;
	}

	@Override
	public int insertMl(String file_name) {
		return amdao.insertMl(file_name);
	}

	@Override
	public int updateMl(String file_name) {
		return amdao.updateMl(file_name);
	}

	@Override
	public String selectMr() {
		return amdao.selectMr();
	}

	@Override
	public int insertMr(String file_name) {
		return amdao.insertMr(file_name);
	}

	@Override
	public int updateMr(String file_name) {
		return amdao.updateMr(file_name);
	}

	@Override
	public int insertJardinBrand(MainJardinDto mjdto) {
		return amdao.insertJardinBrand(mjdto);
	}

	@Override
	public MainJardinDto selectJd() {
		return amdao.selectJd();
	}

	@Override
	public int countJd() {
		return amdao.countJd();
	}

	@Override
	public int updateJardinBrand(MainJardinDto mjdto) {
		return amdao.updateJardinBrand(mjdto);
	}

	@Override
	public MainSaleDto selectSale() {
		return amdao.selectSale();
	}

	@Override
	public int countSale() {
		return amdao.countSale();
	}

	@Override
	public int insertSale(MainSaleDto sdto) {
		return amdao.insertSale(sdto);
	}

	@Override
	public int updateSale(MainSaleDto sdto) {
		return amdao.updateSale(sdto);}
	public List<ProductDto> getProductList() {
		return amdao.getProductList();
	}

	@Override
	public MainBsDto getBs() {
		return amdao.getBs();
	}
	
	@Override
	public ProductDto getPname(int p_num) {
		return amdao.getPname(p_num);
	}
	
	@Override
	public int insertBs(MainBsDto mainBsDto) {
		return amdao.insertBs(mainBsDto);
	}

	@Override
	public int updateBs(MainBsDto mainBsDto) {
		return amdao.updateBs(mainBsDto);
	}

	@Override
	public MainNewProductDto getNewPro() {
		return amdao.getNewPro();
	}

	@Override
	public int updateNewPro(MainNewProductDto mainNewProDto) {
		return amdao.updateNewPro(mainNewProDto);
	}

	@Override
	public List<MainMDDto> getMD() {
		return amdao.getMD();
	}

	@Override
	public int updateMD(int p_num,String explain,int pNum) {
		return amdao.updateMD(p_num, explain, pNum);
	}



}
