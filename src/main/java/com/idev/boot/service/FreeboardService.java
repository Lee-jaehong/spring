package com.idev.boot.service;

import java.util.List;
import java.util.Map;

import com.idev.boot.dto.LikeDto;
import com.idev.boot.dto.PageDto;
import com.idev.boot.dto.TimelineBoard;



public interface FreeboardService {
	//서비스 인터페이스에서는 dao의 메소드들을 구현하고 session,request등을 제어하는 메소드 설계 작성
	
	List<TimelineBoard> getPagelist();	//한페이지 게시글
	int getCount();								//전체 게시글 카운트
	TimelineBoard getBoardOne(int idx);				//한개 검색
	int insert(TimelineBoard dto);					//insert
	void updateReadCnt(int idx);
	void delete(int idx);
	int findLike(Map<String, Object> map);
	int getLike(int idx);
	void likeUp(LikeDto dto);
	void likeDown(LikeDto dto);
	void likeUp2(int idx);
	void likeDown2(int idx);
	void update(TimelineBoard dto);
	String getNick(int idx);
	
	
	
}
