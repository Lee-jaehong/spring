package com.idev.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.idev.boot.dto.TimelineBoardComments;
import com.idev.boot.service.CommentService;



@Controller
@RequestMapping("/community/comment")		//url은 여기서만 지정했습니다.
public class CommentController {
	
	@Autowired
	private CommentService service;
	
	//모든 핸들러 메소드의 url은 동일합니다. 핸들러 메소드 매핑은 params 로 합니다.
	@RequestMapping(params="action=insert",method=RequestMethod.POST)
	public String insert(@ModelAttribute TimelineBoardComments comt,RedirectAttributes redirectAttributes ) {

			//댓글 idx는 자동증가 컬럼
			service.insert(comt);
			service.commentUp(comt.getTimeline_board_id());


	//	model.addAttribute("idx", comt.getMref());
		redirectAttributes.addAttribute("timeline_board_id", comt.getTimeline_board_id());

		return "redirect:/community/detail";
	}
	
	//이 메소드는 ?action=delete 파라미터로만 매핑합니다. GET,POST 모두 매핑될수 있습니다.
	@RequestMapping(params="action=delete")
	public String delete(int idx,int mref,RedirectAttributes redirectAttributes) {
		service.delete(idx);    //댓글 번호
		service.commentDown(mref);
		//확인필요 : 댓글 갯수 업데이트
		//댓글 갯수 -1 계산하고 update 필요.
//		model.addAttribute("idx", mref);    //메인글번호
//		model.addAttribute("page", page);
		redirectAttributes.addAttribute("timeline_board_id", mref);
		return "redirect:/community/detail";
	}
	
}
