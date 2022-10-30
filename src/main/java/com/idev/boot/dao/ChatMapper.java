package com.idev.boot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.idev.boot.dto.ChatMessage;
import com.idev.boot.dto.ChatProfile;

@Mapper
public interface ChatMapper {

	int Chatinsert(ChatMessage chat);
	List<ChatMessage> CharListById(Map<String, Object> map);
	List<ChatMessage> CharListRecentById(Map<String,Object> map);
	List<ChatProfile> ChatPicture();
	String ChatOnePicture(Map<String,String> map);
	List<ChatMessage> getBox(Map<String,Object> map);
	List<ChatMessage> searchBox(Map<String,Object> map);
	
	int deleteChat(Map<String,Object> map); 
}
