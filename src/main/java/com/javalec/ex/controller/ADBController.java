package com.javalec.ex.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.javassist.expr.Instanceof;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.AdminDto;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.EventDto;
import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.service.ADBService;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.BService;

@Controller
public class ADBController {
	
	/*
 	[관리자]
	1:1문의
	공지사항 
	이벤트
	*/

	@Autowired
	private ADBService adbservice;
	@Autowired
	private AdminCouponService admincouponservice;
	
	//테스트용 관리자 로그인
	@RequestMapping("tempForLogin")
	public String tempForLogin() {
		return "admin/board/tempForLogin";
	}
	
	//1:1문의 전체 리스트 불러오기
	@RequestMapping("mtm_list")
	public String mtm_list(UtilDto utilDto, Model model) {
		int page=1;
		if(!(utilDto.getPage()==0)) {
			page=utilDto.getPage();
		}
		
		model.addAttribute("mtm_list", adbservice.getAllBoards());
		model.addAttribute("UtilDto", utilDto);
		
		System.out.println("mtm_list 작동");
		return "admin/board/mtm_list";
	}	
	
	//1:1문의 글 1개 삭제
	@ResponseBody
	@RequestMapping("mtm_delete")
	public int mtm_delete(@RequestBody int iu_num, Model model) {
		int success = adbservice.deleteUserBoard(iu_num);
		return success;
	}	
	
	//1:1 답변 1개 불러오기
	@RequestMapping("mtm_view")
	public String mtm_answer_write(@RequestParam("m_id") String m_id, MtmUserDto mtmUserDto, Model model) {
		AllDto alldto = adbservice.getAnswerBoard(mtmUserDto.getIu_num());
		model.addAttribute("MtmAnswerDto", alldto);
		model.addAttribute("MtmUserDto", mtmUserDto);
		model.addAttribute("m_id", m_id);
		return "admin/board/mtm_view";
	}
	
	//1:1 답변 1개 작성
	@PostMapping("mtm_answer_write")
	public String mtm_answer_write(MtmAnswerDto mtmAnswerDto, Model model){
		int success = adbservice.insertAnswerBoard(mtmAnswerDto);
		String alerttext="";
		switch(success) {
		case 0 : alerttext="alert('답변을 등록하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);"; break;
		case 1 : alerttext="alert('답변을 등록했습니다.'); location.href='mtm_list?rownum="+mtmAnswerDto.getRownum()+"';"; break;
		}//switch
		model.addAttribute("alerttext", alerttext);
		return "admin/board/mtm_view";
	}
	
	//1:1문의 글 1개 삭제
	@ResponseBody
	@RequestMapping("mtm_answer_delete")
	public int mtm_answer_delete(@RequestBody int[] arrNum, Model model) {
		int success = adbservice.deleteAnswerBoard(arrNum[0], arrNum[2]);		
		return success;
	}	
	
	//1:1문의 답변 수정
	@RequestMapping("mtm_answer_modify")
	public String mtm_answer_modify
	(MtmAnswerDto mtmAnswerDto, Model model) {
		int success = adbservice.modifyAnswerBoard(mtmAnswerDto);
		String alerttext="";
		switch(success) {
		case 0 : alerttext="alert('답변을 수정하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);"; break;
		case 1 : alerttext="alert('답변을 수정했습니다.'); location.href='mtm_list?rownum="+mtmAnswerDto.getRownum()+"';"; break;
		}//switch
		model.addAttribute("alerttext", alerttext);
		return "admin/board/mtm_view";		
	}
	
	//공지사항 전체 리스트 불러오기
	@RequestMapping("notice_list")
	public String notice_list(UtilDto utilDto, Model model) {
		int page=1;
		if(!(utilDto.getPage()==0)) {
			page=utilDto.getPage();
		} 
		model.addAttribute("UtilDto", utilDto);
		model.addAttribute("notice_list", adbservice.getAllNoticeBoards());
		return "admin/board/notice_list";
	}	
	
	//공지사항 글등록 페이지 열기
	@RequestMapping("notice_write")
	public String notice_write(Model model) {
		return "admin/board/notice_write";
	}
	
	//공지사항 새글 1개 등록
	@PostMapping("notice_insert")
	public String notice_insert(NoticeDto noticeDto, Model model) {
		int success = adbservice.insertNoticeBoard(noticeDto);
		String alerttext="";
		switch(success) {
		case 0 : alerttext="alert('공지글을 등록하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);"; break;
		case 1 : alerttext="alert('공지글을 등록했습니다.'); location.href='notice_list';"; break;
		}//switch
		model.addAttribute("alerttext", alerttext);
		return "admin/board/notice_write";		
	}
	
	//공지글 1개 불러오기
	@RequestMapping("notice_view")
	public String notice_view(UtilDto utilDto, @RequestParam("no_num") int no_num, Model model) {
		AllDto allDto2 = adbservice.getNoticeBoard(no_num);
		model.addAttribute("UtilDto", utilDto);//페이징
		model.addAttribute("AllDto2", allDto2);//공지글		
		return "admin/board/notice_view";
	}
	
	//공지글 1개 글수정
	@PostMapping("notice_modify")
	public String notice_modify(NoticeDto noticeDto, UtilDto utilDto, Model model) {
		
		int page=1;
		if(!(utilDto.getPage()==0)) {
			page=utilDto.getPage();
		} 	
		int success = adbservice.modifyNoticeBoard(noticeDto);
		
		String alerttext="";
		switch(success) {
		case 0 : alerttext="alert('공지글을 수정하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);"; break;
		case 1 : alerttext="alert('공지글을 수정했습니다.'); location.href='notice_list?rownum="+utilDto.getPage()+"';"; break;
		}//switch
		model.addAttribute("alerttext", alerttext);		
		return "admin/board/notice_view";
	}
	
	//공지글 1개 삭제
	@ResponseBody
	@RequestMapping("notice_delete")
	public int notice_delete(@RequestBody int no_num, Model model) {
		int success = adbservice.deleteNoticeBoard(no_num);
		return success;
	}		
	
	//이벤트 전체 리스트 불러오기
	@RequestMapping("event_list")
	public String event_list(UtilDto utilDto, Model model){
		model.addAttribute("AllDtos", adbservice.getAllEventBoards());
		return "admin/board/event_list";
	}
	
	//이벤트 작성 페이지 접속
	@RequestMapping("event_write")
	public String event_write(Model model) {
		model.addAttribute("AllDtos", admincouponservice.getAllCoupons());
		return "admin/board/event_write";
	}
	
	//이벤트 새글 1개 등록
	@PostMapping("event_insert")
	public String event_insert(UtilDto utilDto, Model model) {
		
		System.out.println(utilDto.getE_start_day());
		
		int success = adbservice.insertEventBoard(utilDto);
		
		String alerttext="";
		switch(success) {
		case 0 : alerttext="alert('이벤트글을 등록하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);"; break;
		case 1 : alerttext="alert('이벤트글을 등록했습니다.'); location.href='event_list?rownum="+utilDto.getPage()+"';"; break;
		}//switch
		model.addAttribute("alerttext", alerttext);				
		return "admin/board/event_write";
	}
	
	//이벤트&댓글 1개씩 불러오기
	@RequestMapping("event_view")
	public String event_view(EventDto eventDto, UtilDto utilDto, Model model) {
		model.addAttribute("AllDto", adbservice.getEventBoard(eventDto));//이벤트 정보 가져오기
		model.addAttribute("ECDtos",adbservice.getEventComments(eventDto));//댓글 전체 가져오기
	
		return "admin/board/event_view";
	}

}
