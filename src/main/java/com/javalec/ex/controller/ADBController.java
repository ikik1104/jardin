package com.javalec.ex.controller;

import java.sql.Timestamp;
import java.util.HashMap;
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
import com.javalec.ex.dto.E_CommentDto;
import com.javalec.ex.dto.EventDto;
import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.dto.WinBoardDto;
import com.javalec.ex.service.ADBService;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.BService;

@Controller
public class ADBController {
	
	/*
 	[관리자]
	1:1문의
	공지사항 
	이벤트(당첨자 게시글 포함)
	*/
	
	String response_path = "admin/board/";//보내는 경로

	@Autowired
	private ADBService adbservice;
	@Autowired
	private AdminCouponService admincouponservice;
	
	//테스트용 관리자 로그인
	@RequestMapping("tempForLogin")
	public String tempForLogin() {
		return response_path+"tempForLogin";
	}
	
	//1:1문의 전체 리스트 불러오기
	@RequestMapping("mtm_list")
	public String mtm_list(UtilDto utilDto, Model model) {
		int page=1;
		if(!(utilDto.getPage()==0)) {
			page=utilDto.getPage();
		}
		
		model.addAttribute("mtm_list", adbservice.getAllBoards());
		return response_path+"mtm_list";
	}	
	
	//1:1문의 글 1개 삭제
	@ResponseBody
	@RequestMapping("mtm_delete")
	public int mtm_delete(@RequestBody int iu_num, Model model) {
		int success = adbservice.deleteUserBoard(iu_num);
		return success;
	}	
	
	//선택한 1:1문의글 일괄 삭제
	@ResponseBody
	@RequestMapping("mtm_some_delete")
	public int mtm_some_delete(@RequestBody int[] chkArray) {
		int success = adbservice.deleteSomeMtms(chkArray);
		return success;
	}
	
	//1:1 답변 1개 불러오기
	@RequestMapping("mtm_view")
	public String mtm_answer_write(MtmUserDto mtmUserDto, Model model) {
		model.addAttribute("mtm_user_info", adbservice.getMtmUserBoard(mtmUserDto));
		model.addAttribute("mtm_answer_info", adbservice.getAnswerBoard(mtmUserDto.getIu_num()));	
		return response_path+"mtm_view";
	}
	
	//1:1 답변 1개 작성
	@ResponseBody
	@PostMapping("mtm_answer_write")
	public int mtm_answer_write(MtmAnswerDto mtmAnswerDto, Model model){
		int success = adbservice.insertAnswerBoard(mtmAnswerDto);
		return success;
	}
	
	//1:1문의 글 1개 삭제
	@ResponseBody
	@RequestMapping("mtm_answer_delete")
	public int mtm_answer_delete(@RequestBody int[] arrNum, Model model) {
		int success = adbservice.deleteAnswerBoard(arrNum[0], arrNum[1]);		
		return success;
	}	
	
	//1:1문의 답변 수정
	@ResponseBody	
	@RequestMapping("mtm_answer_modify")
	public int mtm_answer_modify(MtmAnswerDto mtmAnswerDto) {
		int success = adbservice.modifyAnswerBoard(mtmAnswerDto);
		return success;	
	}
	
	//선택한 공지글 일괄 삭제
	@ResponseBody
	@RequestMapping("notice_some_delete")
	public int notice_some_delete(@RequestBody int[] chkArray) {
		int success = adbservice.deleteSomeNotice(chkArray);
		return success;
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
		return response_path+"notice_list";
	}	
	
	//공지사항 글등록 페이지 열기
	@RequestMapping("notice_write")
	public String notice_write(Model model) {
		return response_path+"notice_write";
	}
	
	//공지사항 새글 1개 등록
	@ResponseBody
	@PostMapping("notice_insert")
	public int notice_insert(UtilDto utilDto){
		NoticeDto noticeDto = new NoticeDto();
		noticeDto.setAd_num(Integer.parseInt(utilDto.getStr1()));
		noticeDto.setNo_title(utilDto.getStr2());
		noticeDto.setNo_content(utilDto.getStr3());	
		
		int success = adbservice.insertNoticeBoard(noticeDto);
		return success;
	}
	
	//공지글 1개 불러오기
	@RequestMapping("notice_view")
	public String notice_view(UtilDto utilDto, @RequestParam("no_num") int no_num, Model model) {
		AllDto allDto2 = adbservice.getNoticeBoard(no_num);
		model.addAttribute("UtilDto", utilDto);//페이징
		model.addAttribute("AllDto2", allDto2);//공지글		
		return response_path+"notice_view";
	}

	//공지글 1개 글수정
	@ResponseBody	
	@RequestMapping("notice_modify")
	public int notice_modify(NoticeDto noticeDto) {
		int success = adbservice.modifyNoticeBoard(noticeDto);
		return success;	
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
		return response_path+"event_list";
	}
	
	//선택 이벤트글 일괄 삭제
	@ResponseBody
	@RequestMapping("event_some_delete")
	public int event_some_delete(@RequestBody int[] chkArray) {
		int success = adbservice.deleteSomeEvents(chkArray);
		return success;
	}	
	//댓글 1개 삭제
	@ResponseBody
	@RequestMapping("event_comment_delete")
	public int event_comment_delete(@RequestBody int ec_num) {
		int success = adbservice.deleteTheEcomment(ec_num);
		return success;
	}			
	
	//선택 신청자 일괄 삭제
	@ResponseBody
	@RequestMapping("applicant_some_win")
	public int applicant_some_win(@RequestBody int[] chkArray) {
		int success = adbservice.deleteSomeApplicants(chkArray);
		return success;
	}		
	//선택 신청자 일괄 당첨/당첨 취소
	@ResponseBody
	@RequestMapping("applicant_some_delete")
	public int applicant_some_delete(@RequestBody int[] chkArray) {
		int success = adbservice.deleteSomeApplicants(chkArray);
		return success;
	}			
	
	//이벤트 작성 페이지 접속
	@RequestMapping("event_write")
	public String event_write(Model model) {
		model.addAttribute("AllDtos", admincouponservice.getAllCoupons());
		return response_path+"event_write";
	}
	
	//이벤트 새글 1개 등록
	@ResponseBody
	@PostMapping("event_insert")
	public int event_insert(UtilDto utilDto){
		if(utilDto.getStr8()==null || utilDto.getStr8().equals("")) {
			//쿠폰 등록 안 할 때
			utilDto.setStr8("null");
		}
		int success = adbservice.insertEventBoard(utilDto);
		return success;
	}	
	
	//이벤트&댓글 1개씩 불러오기
	@RequestMapping("event_view")
	public String event_view(EventDto eventDto, UtilDto utilDto, Model model) {
		model.addAttribute("CouponDtos", admincouponservice.getAllCoupons());//쿠폰 목록 가져오기
		model.addAttribute("AllDto", adbservice.getEventBoard(eventDto));//이벤트 정보 가져오기
		model.addAttribute("ECDtos",adbservice.getEventComments(eventDto));//댓글 전체 가져오기
		return response_path+"event_view";
	}
	
	//이벤트 글 1개 수정하기
	@PostMapping("event_modify")
	public String event_modify(
			UtilDto utilDto, Model model,
			@RequestParam("start") String start,
			@RequestParam("end") String end,
			@RequestParam("win") String win,
			@RequestParam("coupon") int coupon,
			@RequestParam("title") String title,			
			@RequestParam("content") String content	
			) {	
		
		String[] splits=null;
		//수정하지 않은 항목 있을 경우 기존값 넣어주기
		if(utilDto.getE_start_day()==null||utilDto.getE_start_day().equals("")) {
			System.out.println("여기여기");
			utilDto.setStr2(start);
		}else {
			splits = utilDto.getE_start_day().split(" ");
			utilDto.setStr2(splits[0]);			
		}
		if(utilDto.getE_end_day()==null||utilDto.getE_end_day().equals("")) {
			utilDto.setStr3(end);		
		} else {
			splits = utilDto.getE_end_day().split(" ");			
			utilDto.setStr3(splits[0]);
		}
		if(utilDto.getE_win_day()==null||utilDto.getE_win_day().equals("")) {
			utilDto.setStr4(win);		
		} else {
			splits = utilDto.getE_win_day().split(" ");						
			utilDto.setStr4(splits[0]);
		}
		if(utilDto.getCo_num()==0) {
			utilDto.setStr1("");
		} else {
			utilDto.setStr1(utilDto.getCo_num()+"");
		}
		if(utilDto.getE_title()==null||utilDto.getE_title().equals("")) {
			utilDto.setE_title(title);
		}		if(utilDto.getE_content()==null||utilDto.getE_content().equals("")) {
			utilDto.setE_content(content);
		}
		
		int success = adbservice.modifyEventBoard(utilDto);
		String alerttext="";
		switch(success) {
		case 0 : alerttext="alert('이벤트글을 수정하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);"; break;
		case 1 : alerttext="alert('이벤트글을 수정했습니다.'); location.href='event_view?e_num="+utilDto.getE_num()+"';"; break;
		}//switch
		model.addAttribute("alerttext", alerttext);			
		return response_path+"event_view";
	}
	
	//이벤트글 1개 삭제
	@ResponseBody
	@RequestMapping("event_delete")
	public int event_delete(@RequestBody int e_num) {
		System.out.println("들어옴");
		int success = adbservice.deleteEventBoard(e_num);
		return success;
	}

	
	//이벤트 신청자 전체 리스트 불러오기(회원정보, 이벤트 정보 포함)
	@RequestMapping("event_applicants")
	public String event_applicants(Model model) {
		model.addAttribute("apply_list", adbservice.getApplicants());
		return response_path+"event_applicants";
	}
	
	//신청자 상태 '당첨'으로 변경
	@ResponseBody
	@RequestMapping("applicant_win")
	public int applicants_win(@RequestBody int ec_num) {
		int success = adbservice.winApplicant(ec_num);
		return success;
	}
	
	//신청자 상태 '미당첨'으로 되돌리기
	@ResponseBody
	@RequestMapping("applicant_back")
	public int applicants_back(@RequestBody int ec_num) {
		int success = adbservice.backApplicant(ec_num);
		return success;
	}	
	
	//당첨자 게시글 전체 리스트 불러오기
	@RequestMapping("win_list")
	public String win_list(Model model) {
		model.addAttribute("win_board_list", adbservice.getAllWinBoards());
		return response_path+"win_list";
	}
	
	//당첨자 게시글 1개 불러오기
	@RequestMapping("win_board_view")
	public String win_board_view(WinBoardDto winBoardDto, Model model) {
		System.out.println("들어오니?");
		model.addAttribute("win_board_list", adbservice.getWinBoard(winBoardDto));
		model.addAttribute("event_list", adbservice.getAllEventBoards());//조회 페이지에 이벤트 목록 불러오기
		return response_path+"win_board_view";
	}
	//당첨자 게시글 1개 수정
	@RequestMapping("win_board_modify")
	public String win_board_modify(WinBoardDto winBoardDto, @RequestParam("eNum") int eNum, Model model) {
		//수정 안 한 항목 체크
		if(winBoardDto.getE_num()==0) winBoardDto.setE_num(eNum);
		
		int success = adbservice.modifyWinBoard(winBoardDto);
		String alerttext="";
		switch(success) {
		case 0 : alerttext="alert('게시글을 수정하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);"; break;
		case 1 : alerttext="alert('게시글을 수정했습니다.'); location.href='win_board_view?wb_num="+winBoardDto.getWb_num()+"';"; break;
		}//switch
		model.addAttribute("alerttext", alerttext);
		return response_path+"win_board_view";		
	}	
	
	//당첨자 게시글 1개 삭제
	@ResponseBody
	@RequestMapping("win_board_delete")
	public int win_board_delete(@RequestBody int wb_num) {
		int success=adbservice.deleteWinBoard(wb_num);
		return success;
	}
	
	//당첨자 게시글 작성 페이지 접속
	@RequestMapping("win_board_write")
	public String win_board_write(Model model) {
		model.addAttribute("event_list", adbservice.getAllEventBoards());//조회 페이지에 이벤트 목록 불러오기		
		return response_path+"win_board_write";
	}
	
	@RequestMapping("win_board_insert")
	public String win_board_insert(WinBoardDto winBoardDto, Model model) {
		int success=adbservice.insertWinBoard(winBoardDto);
		String alerttext="";
		switch(success) {
		case 0 : alerttext="alert('게시글을 등록하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);"; break;
		case 1 : alerttext="alert('게시글을 등록했습니다.'); location.href='win_list';"; break;
		}//switch
		System.out.println("success : "+success);
		System.out.println("alerttext : "+alerttext);		
		model.addAttribute("alerttext", alerttext);		
		return response_path+"win_board_write";
	}
	

}
