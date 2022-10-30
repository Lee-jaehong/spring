package com.idev.boot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.idev.boot.dto.TimelineBoardComments;

@Repository		//dao 역할 bean
@Mapper
public interface CommentsMapper {
	List<TimelineBoardComments> getComments(int mref);
	int insert(TimelineBoardComments dto);
	int delete(int idx);
	int deleteall(int idx);
	void commentUp(int idx);
	void commentDown(int idx);
}
