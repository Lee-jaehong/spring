package com.idev.boot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.idev.boot.dao.MemberMapper;
import com.idev.boot.dao.SnsMemberDao;
import com.idev.boot.dto.Member;
import com.idev.boot.service.MemberService;

@Controller
public class ProfileController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MemberMapper dao;
	public ProfileController(MemberMapper dao) {
		this.dao = dao;
	}
	SnsMemberDao enc = new SnsMemberDao();
	@Autowired
	private MemberService service;
	@RequestMapping(value = "member/register", method = RequestMethod.POST)
	public String register(@ModelAttribute Member dto) {
		enc.encode(dto);
		service.register(dto);
		return "redirect:/";
	}
	
	

}
