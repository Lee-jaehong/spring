package com.idev.boot.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.idev.boot.dao.MemberMapper;
import com.idev.boot.dao.SnsMemberDao;
import com.idev.boot.dto.Member;
import com.idev.boot.service.MemberService;

@Controller
@RequestMapping(value = "member/")	//sub path(컨텍스트 패스의 하위 경로)
@SessionAttributes({"member"})		//model.addAttribute 로 member 를 변경하면 동기화
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MemberMapper dao;
	public MemberController(MemberMapper dao) {
		this.dao = dao;
	}


	// 암호화에 필요
	SnsMemberDao enc = new SnsMemberDao();
	
 	// 1005 작성, 현재 비밀번호 확인 열기
	@GetMapping("pwCheck.do")
	public String pwCheckOpen() {
		return "member/passwordCheck";
	}
	
	// 1005 작성, 회원 비밀번호 변경 열기
	@GetMapping("pwChange.do")
	public String changePw() {
		return "member/passwordChange";
	}
	
	// 1005 작성, 회원 비밀번호 변경 실행
	@RequestMapping(value = "changing.do", method = RequestMethod.POST)
	public String changing(@RequestParam Map<String, String> map, RedirectAttributes rdattr) {
		String msg;
		map.replace("newpw", enc.log_encode(map.get("newpw")));
		logger.info("비번확인 {}", map);
		if(dao.pwChange(map) == 1) {
			msg = "비밀번호 변경 완료!";
		} else {
			msg = "비밀번호 변경 실패!";
		}
		logger.info(msg);
		rdattr.addFlashAttribute("msg", msg);
		
		return "redirect:pwChange.do";
	}
	
	// 1004 작성, 회원정보 수정 페이지로 이동
	@GetMapping("memUpdate.do")
	public String memUpdate() {
		return "member/2memUpdate";
	}
	
	// 1004 작성, 회원정보 수정
	@RequestMapping(value = "memSave.do", method = RequestMethod.POST)
	public String memUpdate(Member member, Model model, RedirectAttributes rdattr) {
		if(dao.memUpdate(member) == 1) {
			rdattr.addFlashAttribute("alerty", "회원정보 수정 완료!");
			model.addAttribute("member", member);
		} else {
			rdattr.addFlashAttribute("alerty", "회원정보 수정 실패!");			
		}
		return "redirect:memUpdate.do";		
	}
	
	@GetMapping("join")
	public String join() {
		return "member/form";
	}
	@PostMapping("join")
	public String join(Member member,RedirectAttributes rdattr) {
		logger.info("회원 가입 입력 정보 : {} ",member);
		//테이블 insert.
		if(dao.addMember(member)==1)
			rdattr.addFlashAttribute("alertm", "회원 가입이 완료되었습니다.!");
		return "redirect:/";
	}
	
	@GetMapping("list") 
	public String list(Model model){
		List<Member> list = dao.selectAll();
		model.addAttribute("list", list);
		return "member/list";
	}
	
	@GetMapping("update")
	public String update() {	
		//회원 수정할 정보는 세션에서 가져다가 view로 전달함. (로그인이 꼭 필요한 url)
		return "member/update";
	}
	@PostMapping("save")
	public String update(Member member,Model model,RedirectAttributes rdattr){		//member 는 사용자가 수정한 값(파라미터) 저장.
		
		if(dao.updateMember(member)==1)
			rdattr.addFlashAttribute("alertm", "회원 정보 수정이 완료되었습니다.!");
//		member = dao.selectByMno(member.getMno());
		model.addAttribute("member", member);
		return "redirect:update.do";
	}
	
	@GetMapping("idCheck.do")
	public String idCheck(String email,Model model) {  //ajax 변경해 봅시다.
		logger.info("중복 확인 이메일 : {}",email);
		String msg;
		if(dao.checkEmail(email)==0) {
			msg ="사용할 수 있는 이메일 입니다.";
		}else { //email은 유일한 값. else 는 카운트 1
			msg = "사용할 수 없는 중복된 이메일 입니다";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("email", email);
		return "member/idCheck";
	}
	
	
	
	@GetMapping("passw.do")
	public String passw() {
		return "member/passw";
	}
	
	@RequestMapping(value = "passw.do",method=RequestMethod.POST)
	public String passw(@RequestParam Map<String, String> map,RedirectAttributes rdattr) {		//현재비밀번호 검사, 새로운 변경 ajax 로 예정
		logger.info("비밀번호 변경 파라미터 : {}",map);
		//패스워드 변경 여부는 logger.info로 출력해보세요.
		String message;
		if(dao.changePassw(map)==1) {
			logger.info("패스워드 변경완료!");
			message ="패스워드 변경완료!";
		}	else {
			logger.info("현재비밀번호 불일치!!");
			message ="현재비밀번호 불일치!!";
		}
		rdattr.addFlashAttribute("alertm", message);
		return "redirect:update.do";
	}
	
	
	
	
	
	
	
	
	
	
	
}
