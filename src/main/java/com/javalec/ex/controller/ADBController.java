package com.javalec.ex.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.service.ADBService;
import com.javalec.ex.service.BService;

@Controller
public class ADBController {

	@Autowired
	private ADBService adbservice;
	
	//테스트용 관리자 로그인
	@RequestMapping("tempForLogin")
	public String tempForLogin() {
		return "admin/board/tempForLogin";
	}
	
	//1:1문의 전체 리스트 불러오기
	@RequestMapping("mtm_list")
	public String mtm_list(Model model) {
		model.addAttribute("mtm_list", adbservice.getAllBoards());
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
		System.out.println("넘어는..왔니?");
		int success = adbservice.insertAnswerBoard(mtmAnswerDto);
		String alerttext="";
		switch(success) {
		case 0 : alerttext="alert('답변을 등록하지 못했습니다. 다시 시도해 주세요.');"; break;
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

}
