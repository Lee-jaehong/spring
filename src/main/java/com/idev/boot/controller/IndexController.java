package com.idev.boot.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.idev.boot.dao.MemberMapper;
import com.idev.boot.dao.SnsMemberDao;
import com.idev.boot.dto.Member;
import com.idev.boot.service.MemberService;

@Controller
@SessionAttributes("member") 
//*애트리뷰트 데이터가 저장되는 Model 저장소에서 member,serverTime 은 
// 세션scope(세션객체에 저장) 으로 사용되는 값이라는 설정입니다.
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	private MemberMapper mapper;
	//MemberMapper bean 자동주입
	public IndexController(MemberMapper mapper) {
		this.mapper = mapper;
	}
	

	@RequestMapping(value="ajax")
	public String customer() {
		return "member/ajaxTest";
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, String success,Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		model.addAttribute("success", success);			//-> 어노테이션으로
		return "home";
	}
	
	

	@GetMapping("login")
//	public String login(@ModelAttribute("success") String success) {  //view 로 바로 전달
	public String login(String success,Model model) {
		model.addAttribute("success", success);    //url에 요청파라미터 남아있습니다.
		return "login";
	}
	
	
	@PostMapping("login")   
	public String loginProc(@RequestParam Map<String,String> map,RedirectAttributes rdattr,Model model,HttpSession session) {
		// 암호화에 필요
		SnsMemberDao enc = new SnsMemberDao();	
		map.replace("pw", enc.log_encode(map.get("pw")));
		
		logger.info("[My]"+map);
		String url = (String) session.getAttribute("url");
		if (url!=null) session.removeAttribute("url");
		Member member = mapper.login(map);  //로그인 성공하면 null 아닌값 반환
		if(member !=null) {
			//성공 : 메인 화면으로 , session 객체에 로그인 정보를 저장했습니다.(세션 애트리뷰트로 저장하기) 
			model.addAttribute("member", member);    //@SessionAttributes 로 설정하기. session scope
			rdattr.addFlashAttribute("alertm", "로그인 성공했습니다.!");		 //리다이렉트 애트리뷰트(파라미터로 사용됨)
			if(url==null) url = "community/list";    //로그인 성공메시지 alert 띄우기
								// 로그인하면 "/";로 가는게 나을듯?
		}else { //실패 : 다시 로그인 하러가기 . ((미션)) alert 메시지 띄우기 "로그인 정보가 올바르지 않습니다.!"
			rdattr.addFlashAttribute("alertm", "로그인 실패했습니다.!");	
			url = "login";
		}
		logger.info(url);
		return "redirect:"+url;
	}
	
	@GetMapping("logout")      //로그아웃
	public String logout(SessionStatus status,RedirectAttributes rdattr,HttpServletRequest request) {  //현재세션상태 객체
		status.setComplete();  //@SessionAttributes 로 설정된 애트리뷰트 값을 clear 한다.
		HttpSession session = request.getSession();
		session.invalidate();  
		rdattr.addFlashAttribute("alertm","로그아웃 되었습니다.");
		return "redirect:/";
	}

	// sns 회원가입으로 이동
	@RequestMapping(value = "register")
	public String register() {
		return "member/1snsJoinForm";
	}

	// sns 회원정보 수정으로 이동
	@RequestMapping(value = "memUpdate")
	public String memUpdate() {
		return "member/2memUpdate";
	}
	
	
	
//@SessionAttributes로 설정된것은 SessionStatus 로 지운다.	
//status.setComplete();   
//	- JSESSIONID 는 변하지 않고 @SessionAttributes 로 설정된 애트리뷰트 값을 clear 한다.
//	- HttpSession의 removeAttribute() 메소드 동작과 유사v
	
//jsp에서 로그아웃 : session.invalidate();   //JSESSIONID값을 새로운값으로 합니다.
//			     session.removeAttribute("member");   //- JSESSIONID 는 변하지 않고 값 삭제 	
	
	
	
}
