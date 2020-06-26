package com.javalec.ex.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.javalec.ex.dto.MainBannerDto;

public interface AdminMainService {

	int countMainBanners(); //디비 등록 확인
	int insertMainBanner(MainBannerDto mbdto); //메인배너
	MainBannerDto selectMainBanners();//메인배너들가져오기
	void updateMainBanner(MainBannerDto mbdto); //메인배너 업데이트
	
	//***************중간배너 왼쪽************
	String selectMl();//중간배너 파일명 가져오기
	int insertMl(String file_name);//저장
	int updateMl(String file_name);
	//***************중간배너 오른쪽************
	String selectMr();//중간배너 파일명 가져오기
	int insertMr(String file_name);//저장
	int updateMr(String file_name);
	
	void deleteMainBanner(String orders); //메인배너 이미지 삭제
//	int insertMainBanner(Map<String, Object> map); //메인배너
//	List<MainBannerDto> selectMainBanners();//메인배너들가져오기
//	void deleteMainBanner(String orders); //메인배너 이미지 삭제
}
