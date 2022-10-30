package com.idev.boot.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.idev.boot.dao.AdminMapper;
import com.idev.boot.dto.Member;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	private AdminMapper dao;
	public AdminController(AdminMapper dao) {
		this.dao = dao;
	}
	
	@GetMapping("mlist")
	public String list(Model model) {
		List<Member> list = dao.selectMember();
		model.addAttribute("list",list);
		return "admin/mlist";
	}

	@GetMapping("lock")
	public String lock(@RequestParam String id, Model model) {
		dao.lockMember(id);
		List<Member> list = dao.selectMember();
		model.addAttribute("list",list);

		return "admin/mlist";
	}
	
	@GetMapping("op")
	public String open(@RequestParam String id, Model model) {
		dao.sMember(id);
		List<Member> list = dao.selectMember();
		model.addAttribute("list",list);
		return "admin/mlist";
	}
	
	

}
	