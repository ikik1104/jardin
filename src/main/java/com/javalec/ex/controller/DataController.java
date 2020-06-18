package com.javalec.ex.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DataController {

	@RequestMapping("jsonTest1")
	@ResponseBody
	public Map<String, Object> jsonTest1(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("dataList", "dataList");
		map.put("response", "response");
		map.put("body", "body");
		return map;
	}
	
	@RequestMapping("/datadata")
	@ResponseBody
	public Map<String, Object> datadata() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/TourStnInfoService/getTourStnVilageFcst"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=gRcB4DOn16HzaB4pzCdym2eDpGm8UCONcDi%2Bqu7PNm5DksTnvmaGPq0sMAb4Xxg7uPxxSHy2rtKNVtmuKK7QHg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON)*/
        urlBuilder.append("&" + URLEncoder.encode("CURRENT_DATE","UTF-8") + "=" + URLEncoder.encode("2020061810", "UTF-8")); /*2016-12-01 01시부터 조회*/
        urlBuilder.append("&" + URLEncoder.encode("HOUR","UTF-8") + "=" + URLEncoder.encode("24", "UTF-8")); /*CURRENT_DATE부터 24시간 후까지의 자료 호출*/
        urlBuilder.append("&" + URLEncoder.encode("COURSE_ID","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*관광 코스ID*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject) parser.parse(sb.toString());
        JSONObject json1 = (JSONObject) jsonObject.get("response");
        JSONObject json2 = (JSONObject) json1.get("body");
        JSONObject json3 = (JSONObject) json2.get("items");
        JSONArray array = (JSONArray) json3.get("item");
        
        for(int i=0; i<array.size(); i++) {
        	//배열에 담긴 item 1개의 데이터 값을 추출
        	JSONObject arr1 = (JSONObject) array.get(i);
        	String courseAreaId = (String)arr1.get("courseAreaId");
        	String courseAreaName = (String)arr1.get("courseAreaName");
        	String spotName = (String)arr1.get("spotName");
        	String thema = (String)arr1.get("thema");
        	
        	System.out.println("courseareaid "+courseAreaId);
        	System.out.println("courseareaname "+courseAreaName);
        	System.out.println("spotname "+spotName);
        	System.out.println("thema "+thema);
        	
        	map.put("courseAreaId", courseAreaId);
        	map.put("courseAreaName", courseAreaName);
        	map.put("spotName", spotName);
        	map.put("thema", thema);
        }
        
        map.put("datadata", sb.toString());
        return map;
	}
	
	//공공데이터를 받아오는 메소드 
	@RequestMapping("/dataList")
	@ResponseBody
	public Map<String, Object> dataList() throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//가져온 소스
		
			//파라미터로 값을 넘겨준다
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GreenTourService/areaCode"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=gRcB4DOn16HzaB4pzCdym2eDpGm8UCONcDi%2Bqu7PNm5DksTnvmaGPq0sMAb4Xxg7uPxxSHy2rtKNVtmuKK7QHg%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*지역코드,시군구코드*/
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("SERVICE_KEY", "UTF-8")); /*서비스 인증*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        //데이터를 받아온다
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        //데이터 받아오려고 스트링빌더 sb 생성
	        StringBuilder sb = new StringBuilder();
	        String line; //라인별로 결과물을 추가시키는것(여기서 데이터 sb에 넣기)
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());		
        
		//가져온 소스 끝
        
        //sb를 아까 내가 생성한 맵에 담는다
        map.put("dataList", sb.toString());
		//이제 넘겨준다 어디로?
		return map;
	}

	// 공공데이터 출력 jsp
	@RequestMapping("/dataPage")
	public String dataPage() {
		return null;
	}
	
	
	
	
	
}
