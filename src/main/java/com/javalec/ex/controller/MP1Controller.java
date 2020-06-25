package com.javalec.ex.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.NonmemberCartDto;
import com.javalec.ex.dto.WishListDto;
import com.javalec.ex.service.MP1Service;
import com.javalec.ex.service.PayService;


@Controller
public class MP1Controller {

	@Autowired
	private MP1Service mp1Service;
	
	@Autowired
	private PayService payService;
	
	// 바로 주문하기
	@ResponseBody
	@RequestMapping("buynow")
	public int buynow(@RequestBody int[] info, HttpSession session) {
		int success=1;
		// 회원 주문 
		if(session.getAttribute("userNum") != null) {
			int m_num = (Integer)session.getAttribute("userNum");
			//  payment_cart_tb 비우기
			mp1Service.delPaymentCart(m_num);
			// 장바구니 업데이트  (장바구니 -> 주문하기 넘어가는 경우만)
			mp1Service.cartUpdate(m_num, info[0], info[1]);
			// 주문하기로 넘어가는 제품 payment_cart_tb에 삽입 
			success= mp1Service.paymentCart(m_num, info[0], info[1]);
		}else {  // 비회원 바로 주문 
			ArrayList<String> arr = new ArrayList<String>();
			String value = info[0]+"_"+info[1];
			arr.add(value);
			session.setAttribute("nonmem_buyNow", arr);
		}
		
		return success;
	}
	
	// 장바구니 페이지 
	@RequestMapping("cart")
	public String cart(HttpSession session, Model model) {
		int success=1;
		String page="";
		// 회원 장바구니 정보 가져오기
		if(session.getAttribute("userNum") != null) {
			int m_num = (Integer)session.getAttribute("userNum");
			mp1Service.delPaymentCart(m_num);
			mypageInfo(session, model);  // mypage 상단 회원 정보
			model.addAttribute("cartlist", mp1Service.getAllCart(m_num));
			page = "mypage/cart";
		}else {  // 비회원 장바구니 정보 가져오기
			session.removeAttribute("nonmem_cartbuy");
			session.removeAttribute("nonmem_buyNow");
			List<String> arr = (ArrayList<String>)session.getAttribute("nonmem_cart");
			System.out.println(arr.get(0));
			List<NonmemberCartDto> ncDtos = new ArrayList<NonmemberCartDto>();
			for(int i=0; i<arr.size(); i++) {
				String[] sp = arr.get(i).split("_");
				int p_num = Integer.parseInt(sp[0]);
				int p_amt = Integer.parseInt(sp[1]);
				NonmemberCartDto ncDto = new NonmemberCartDto();
				ncDto.setP_amt(p_amt);
				ncDto.setpDto(payService.getProductInfo(p_num));
				ncDtos.add(ncDto);
			}
			model.addAttribute("cartlist", ncDtos);
			model.addAttribute("cCount", ncDtos.size());
			page = "nonmember/cart";
		}
		
		if(session.getAttribute("userNum")==null && session.getAttribute("nonmem_cart")==null) {
			page="/ex/";
		}
		
		return page;
	}
	
	// 장바구니 제품 삭제처리 
	@ResponseBody
	@RequestMapping("cart_del")
	public int cart_del(@RequestBody String pNum, HttpSession session) {
		int success=0;
		if(session.getAttribute("userNum") != null) {
			int m_num = (Integer)session.getAttribute("userNum");
			int p_num = Integer.parseInt(pNum);
			success = mp1Service.cart_del(p_num,m_num);
		}else {
			System.out.println(pNum);
			ArrayList<String> arr = (ArrayList<String>)(session.getAttribute("nonmem_cart"));
			for(int i=0; i<arr.size(); i++) {
				if(arr.get(i).toString().contains(pNum+"")) {
					arr.remove(i);
				}
			}
			session.setAttribute("nonmem_cart", arr);
			success=1;
		}
		
		return success;
	}	

	// 장바구니에서 주문하기
	@ResponseBody
	@RequestMapping("cartUpdate")
	public int cartUpdate(@RequestBody int[] info, HttpSession session) {
		int success=1;
		// 회원 주문 
		if(session.getAttribute("userNum") != null) {
			int m_num = (Integer)session.getAttribute("userNum");
			//  payment_cart_tb 비우기
			mp1Service.delPaymentCart(m_num);
			// 장바구니 업데이트  (장바구니 -> 주문하기 넘어가는 경우만)
			mp1Service.cartUpdate(m_num, info[0], info[1]);
			// 주문하기로 넘어가는 제품 payment_cart_tb에 삽입 
			success= mp1Service.paymentCart(m_num, info[0], info[1]);
		}else {  
			ArrayList<String> arr = (ArrayList<String>)(session.getAttribute("nonmem_cartbuy"));
			String value = info[0]+"_"+info[1];
			int sessionChk=0;
			/* arr에 아무것도 없는 경우 새로 생성 */
			if(session.getAttribute("nonmem_cartbuy")==null) {
				arr = new ArrayList<String>();
			}
			arr.add(value);
			session.setAttribute("nonmem_cartbuy", arr);
		}
		
		return success;
	}
	
	// 나의 쿠폰 페이지
	@RequestMapping("mycoupon")
	public String mycoupon(HttpSession session, Model model) {
		if(session.getAttribute("userNum") == null) {return "/ex/";}//세션체크
		int m_num = (Integer)session.getAttribute("userNum");
		
		mypageInfo(session, model);
		
		// 사용 가능  쿠폰 list 불러오기
		model.addAttribute("couponlist", mp1Service.getAllCou(m_num));
		
		// 쿠폰 사용 내역 list 불러오기 
		model.addAttribute("usedlist", mp1Service.getUsedCou(m_num));
		
		return "mypage/coupon";
	}
	
	// 나의 포인트 페이지
	@RequestMapping("mypoint")
	public String mypoint(HttpSession session, Model model) {
		
		if(session.getAttribute("userNum") == null) {return "/ex/";}//세션체크
		int m_num = (Integer)session.getAttribute("userNum");
		
		mypageInfo(session, model);
		
		// 적립 포인트 총 합
		model.addAttribute("totalSavePoint", mp1Service.totalSavePoint(m_num));
		// 포인트 적립 내역 list 가져오기
		model.addAttribute("savePoint", mp1Service.getSavePoint(m_num));
		// 사용 포인트 총 합
		model.addAttribute("totalUsedPoint", mp1Service.totalUsedPoint(m_num));
		// 포인트 사용 내역 list 가져오기
		model.addAttribute("usedPoint", mp1Service.getUsedPoint(m_num));
		
		return "mypage/point";
	}
	
	// 위시리스트에 상품 추가
	@ResponseBody
	@RequestMapping("addWishlist")
	public int addWishlist(@RequestBody String pNum, HttpSession session) {
		int success=0;
		int p_num = Integer.parseInt(pNum);
		if(session.getAttribute("userNum")!= null) {
			int m_num = (Integer)session.getAttribute("userNum");
			List<WishListDto> wlDtos = mp1Service.getAllWish(m_num);
			int wishlistChk=0; 
			for(int i=0; i<wlDtos.size();i++) {
				if(wlDtos.get(i).getP_num()==p_num) {
					wishlistChk=1;
					break;
				}
			}
			if(wishlistChk==0) {
				success= mp1Service.add_wl(m_num, p_num);
			}else if(wishlistChk==1) {
				success=-1;
			}
		}else {
			success=0;
		}
		return success;
	}
	
	// 위시리스트 페이지
	@RequestMapping("wishlist")
	public String wishlist(HttpSession session, Model model) {
			
		if(session.getAttribute("userNum") == null) {return "/ex/";}//세션체크
		int m_num = (Integer)session.getAttribute("userNum");
		
		mypageInfo(session, model);
			
		model.addAttribute("allWishlist", mp1Service.getAllWish(m_num));
			
		return "mypage/wishlist";
	}	
		
	// 위시리스트 상품 삭제
	@ResponseBody
	@RequestMapping("del_wishlist")
	public int del_wishlist(@RequestBody int p_num, HttpSession session) {
		int success=0;
		if(session.getAttribute("userNum") != null) { //세션체크
			int m_num = (Integer)session.getAttribute("userNum");	
			success = mp1Service.del_wl(p_num, m_num);
		}
			
		return success;
	}
	
	// 위시리스트에서 선택한 상품을 장바구니로 이동
	@ResponseBody
	@RequestMapping("go_cart")
	public int go_cart(@RequestBody int pNum, HttpSession session) {
		
		int m_num = (Integer)session.getAttribute("userNum");
		
		// 장바구니 제품 list 불러오기
		List<CartDto> cDto = mp1Service.getAllCart(m_num);
		
		int success=0;
		int count=0;
		
		for(int i=0; i<cDto.size(); i++) {
			int p_num = cDto.get(i).getP_num();
			if(p_num==pNum) {
				count+=1; 
			}
		}
		
		if(count==0) {
			success = mp1Service.add_cart(m_num,pNum);
		}else {
			success= 1;
		}
		
		mp1Service.del_wl(pNum,m_num);

		return success;
	}
			
	
	// 마이페이지 상단 공통 정보
	public void mypageInfo(HttpSession session, Model model) {
		int m_num = (Integer)session.getAttribute("userNum");
		String m_id = (String)session.getAttribute("userID");
		
		// 회원 아이디
		model.addAttribute("m_id", m_id);
		// 회원 보유 쿠폰 수 카운트
		model.addAttribute("coupon", mp1Service.getCouponCount(m_num));
		// 회원 보유 포인트 불러오기
		model.addAttribute("memDto", mp1Service.getMemInfo(m_num));
		// 회원 주문건수 카운트
		model.addAttribute("order", mp1Service.getOrderCount(m_num));
	}
	
}
