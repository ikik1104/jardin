package com.javalec.ex.controller;

import java.sql.JDBCType;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.annotation.ModelMethodProcessor;

import com.javalec.ex.dao.UserEventDao;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.E_CommentDto;
import com.javalec.ex.dto.EventDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.UserCustomerService;
import com.javalec.ex.service.UserEventService;
import com.javalec.ex.service.UserMemberService;

@Controller
public class UserEventController {
	
	/*
	 * [사용자]
	 * 이벤트
	 * */
	
	String response_path="event/";
	
	@Autowired
	UserEventService eservice;
	
	
	//테스트용(삭제 예정)
	@RequestMapping("event_test")
	public String testform(HttpServletRequest request,Model model ) {
		return "test/test1";
	}
	
	
	//진행중 이벤트 전체 리스트 불러오기
	@RequestMapping("event")
	public String event(Model model) {
		List<AllDto> list= eservice.getAllEvents();
		model.addAttribute("list_size", list.size());		
		model.addAttribute("event_list", list);
		return response_path+"event";
	}
	
	//이벤트 1개 불러오기
	@RequestMapping("user_event_view")
	public String user_event_view(EventDto eventDto, Model model, HttpServletRequest request) {
		model.addAttribute("event_info", eservice.getEventBoard(eventDto));
		model.addAttribute("ecomment_list", eservice.getTheEComments(eventDto));	
		model.addAttribute("coupon_info", eservice.getTheCoupon(eventDto));
		
		return response_path+"user_event_view";
	}
	//댓글 비밀번호 확인하기
	@ResponseBody
	@PostMapping("ec_pw_check")
	public int ec_pw_check(E_CommentDto e_CommentDto, @RequestBody String mode, Model model) {
		String[] trims = mode.split("mode=");//m_num=2&mode=otherOriginal&e_num=24+&ec_pw=1234
		String[] trims2 = trims[1].split("&");//otherOriginal&e_num=24+&ec_pw=1234
		String return_mode = trims2[0];//otherOriginal
		
		int success = eservice.checkECommentPW(e_CommentDto);
		
		if(success==1) {
			switch(return_mode) {
			case "otherOriginal" : success=-1; break;
			case "myOriginal" : success=-2; break;
			case "myModify" : success=-3; break;		
			}
		} else {
			
		}
		System.out.println(success);
		return success;
	}
	
	
	//댓글 1개 새로 등록
	@ResponseBody
	@PostMapping("ecomment_insert")
	public int ecomment_insert(E_CommentDto e_CommentDto) {
		int success = eservice.insertEComment(e_CommentDto);
		System.out.println(success);
		return success;
	}
	
	//회원 로그인 사용자 댓글 1개 수정
	@PostMapping(value="modify_ecomment", produces = "application/text; charset=utf8")
	public @ResponseBody String modify_ecomment(E_CommentDto e_CommentDto) {
		String content = eservice.modifyEComment(e_CommentDto);
		return content;
	}
	
	//회원 로그인 사용자 댓글 1개 삭제
	@ResponseBody
	@RequestMapping("user_ecomment_delete")
	public int user_ecomment_delete(@RequestBody int ec_num, Model model) {
		System.out.println("넘어옴");
		int success = eservice.deleteUserEcomment(ec_num);
		return success;
	}
	//회원 사용자 쿠폰 다운로드
	@ResponseBody
	@PostMapping("coupon_download")
	public int coupon_download(@RequestBody HashMap<String, String> map) {
		int success=0;
		
		int m_num=Integer.parseInt(map.get("m_num"));
		int co_num=Integer.parseInt(map.get("co_num"));
		int co_expiry=Integer.parseInt(map.get("co_expiry"));
		String co_start_day=map.get("co_start_day");		
		String co_end_day=map.get("co_end_day");			
		
		String[] st1s = co_start_day.split("-");
		String[] st2s = st1s[2].split(" ");
		co_start_day=st1s[0]+"/"+st1s[1]+"/"+st2s[0];
		
		String[] ed1s = co_end_day.split("-");
		String[] ed2s = ed1s[2].split(" ");
		co_end_day=ed1s[0]+"/"+ed1s[1]+"/"+ed2s[0];		
		
		
		System.out.println(m_num);
		System.out.println(co_num);
		System.out.println(co_expiry);
		System.out.println(co_start_day);
		System.out.println(co_end_day);
		
		if(co_expiry!=-99) {//유효기간 쿠폰인 경우
			System.out.println("유효기간");
			success = eservice.downloadExCoupon(m_num, co_num, co_expiry);
		} else {//기간제 쿠폰일 경우
			System.out.println("기간제");
			success = eservice.downloadPeriodCoupon(m_num, co_num,co_start_day, co_end_day);
		}
		System.out.println(success);
		return success;
	}
	
	//종료된 이벤트 전체 리스트 출력
	@RequestMapping("fin_event")
	public String fin_event(Model model) {
		List<AllDto> list = eservice.getAllFinEvents();
		model.addAttribute("list_size", list.size());
		model.addAttribute("fin_event_list", list);
		System.out.println(list.size());
		return response_path+"fin_event";
	}
	
	@RequestMapping("comment")
	public String comment() {
		return "test/comment";
	}
	
	@Autowired
	UserEventDao edao;
	
	@RequestMapping("comment_List")
	@ResponseBody
	public List<E_CommentDto> comment_List(){
		System.out.println(edao.comment_List().size());
		return edao.comment_List();
		
	}
	@RequestMapping("comment_delete")
	@ResponseBody
	public void comment_delete(@ModelAttribute E_CommentDto e_CommentDto){
		/*
		 IDao dao = sqlSession.getMapper(IDao.class); 
		 dao.comment_delete(e_CommentDto.getEc_num());
		 */
		System.out.println("넘어옴?");
		 edao.comment_delete(e_CommentDto.getEc_num());
	}	

}
