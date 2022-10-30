package com.idev.boot.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.idev.boot.dao.ChatMapper;
import com.idev.boot.dto.ChatMessage;
import com.idev.boot.dto.ChatProfile;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes({"userid"}) 
public class chatController {
	
	private static final Logger logger = LoggerFactory.getLogger(chatController.class);
	
	private ChatMapper dao;
	
	public chatController(ChatMapper dao) {
		this.dao = dao;
	}
	
	//메시지함
	@RequestMapping("chat/messageBox")
	public String RoomList(@RequestParam String userid,Model model) {
		model.addAttribute("userid", userid);
		
		Map<String,Object> map = new HashMap<>();
		map.put("fromId", userid);
		map.put("toId", userid);
		
		//보낸사람 or 받는사람이 user인 채팅 다 불러오기
		List<ChatMessage> list = dao.getBox(map);
		
		//list의 모든 해당 채팅의 보낸사람과 받는사람 이름이 같을 때 가장 최신의 것만 남기고 지워줌
		for(int i=0 ; i<list.size(); i++) {
			ChatMessage x = list.get(i);
			for(int j=0 ; j<list.size(); j++) {
				ChatMessage y = list.get(j);
				if(x.getFromId().equals(y.getToId()) && x.getToId().equals(y.getFromId())) {
					if(x.getChatId() < y.getChatId()) {
						list.remove(x);
						i--;
					}else {
						list.remove(y);
						j--;
					}
				}
			}
		}
		model.addAttribute("list", list);
		
		//채팅창에 보여줄 프사들
		List<ChatProfile> pictures = dao.ChatPicture();
		model.addAttribute("pictures", pictures);
		
		return "chat/messageBox";
	}
	
	
	
	//idMessageCheck
	@RequestMapping(value = "chat/searchMessage", method = RequestMethod.GET)
	public String searchMessage(@RequestParam String userid, @RequestParam String toId,Model model) throws JsonProcessingException {
		Map<String,Object> map = new HashMap<>();
		map.put("fromId", userid);		//찾는사람 id
		map.put("toId", toId);		//나
		
		List<ChatMessage> list = dao.searchBox(map);
		for(int i=0 ; i<list.size(); i++) {
			ChatMessage x = list.get(i);
			for(int j=0 ; j<list.size(); j++) {
				ChatMessage y = list.get(j);
				if(x.getFromId().equals(y.getToId()) && x.getToId().equals(y.getFromId())) {
					if(x.getChatId() < y.getChatId()) {
						list.remove(x);
						i--;
					}else {
						list.remove(y);
						j--;
					}
				}
			}
		}

		//채팅창에 보여줄 프사들
		List<ChatProfile> pictures = dao.ChatPicture();
		model.addAttribute("pictures", pictures);

		model.addAttribute("list", list);
		return "chat/messageBox";
	}

	
	@RequestMapping("chat/room")
	public String showRoom(String fromId, String toId,String userid, Model model) {
		model.addAttribute("userid", userid);	//로그인한 사람
		model.addAttribute("fromId", userid);	
		model.addAttribute("toId", toId);	
		
		Map<String,String> map = new HashMap<>();
		map.put("fromId", userid);
		map.put("toId", toId);
		
		String picture = dao.ChatOnePicture(map);
		model.addAttribute("picture",picture);
		
		return "chat/room";
	}
	
	
	//댓글 저장
	@RequestMapping(value="chat/doAddMessage", method = RequestMethod.POST)
	@ResponseBody
	public String doAddMessage(@RequestBody String json) throws JsonMappingException, JsonProcessingException {
		ObjectMapper jmapper = new ObjectMapper();
		jmapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);	
		ChatMessage vo = jmapper.readValue(json, ChatMessage.class);
		int result = dao.Chatinsert(vo);
		
		logger.info("result:{}",vo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);		
		return jmapper.writeValueAsString(map);
	}
	
	
	//계속 새로운 메시지 불러오기
	@RequestMapping(value = "chat/getMessage", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getMessagesFrom(String fromId, String toId,Model model) throws JsonProcessingException {
		Map<String,Object> m = new HashMap<>();
		m.put("fromId", fromId);
		m.put("toId", toId);
//		m.put("userid",userid);
//		m.put("chatId", 100);	
		List<ChatMessage> result = dao.CharListRecentById(m);	
		model.addAttribute(result);
		
		Map<String, Object> rs = new HashMap<>();
		rs.put("result", result);
		return rs;
	}
	

	
//	
//	//메시지 삭제
//	@RequestMapping("/chat/doClearAllMessages")
//	@ResponseBody
//	public Map<Object, Object> doClearAllMessages(@SessionAttribute("fromId") String fromId,String toId) {
//		
//		chatService.ClearAllMessages(fromId,toId);
//		
//		Map<Object, Object> rs = new HashMap<>();
//		
//		//rs.put("resultCode", "S-1");
//		rs.put("msg", "모든 메시지를 삭제했습니다.");
//		
//		return rs;
//	}
//	
//	
	
	
}
