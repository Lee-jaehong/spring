package com.idev.boot.service;

import java.util.List;

import com.idev.boot.dto.TimelineBoardComments;



public interface CommentService {
	int insert(TimelineBoardComments dto); //댓글 입력
	List<TimelineBoardComments> commentList(int mref); //게시글 전체 댓글
	int delete(int idx); //댓글 삭제
	int deleteall(int idx);
	void commentUp(int idx);
	void commentDown(int idx);
}
