package com.idev.boot.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.idev.boot.dto.LikeDto;
import com.idev.boot.dto.PageDto;
import com.idev.boot.dto.TimelineBoard;

@Repository
@Mapper
public interface FreeboardMapper { 
	//mapper로 dao 동작을 하도록 설정 -> spring mybatis 에서 구현체를 생성하여 bean 등록
	//sql 실행에 필요한 메소드 시그니쳐 정의
	List<TimelineBoard> getPageList();	//한페이지 게시글
	int getCount();								//전체 게시글 카운트
	TimelineBoard detail(int idx);				//한개 검색
	int insert(TimelineBoard dto);					//insert
	int readcountUp(int idx);
	int delete(int idx);
	int findLike(Map<String, Object> map);
	int getLike(int idx);
	void likeUp(LikeDto dto);
	void likeDown(LikeDto dto);
	void likeUp2(int idx);
	void likeDown2(int idx);
	void update(TimelineBoard dto);
	String getNick(int idx);
}









