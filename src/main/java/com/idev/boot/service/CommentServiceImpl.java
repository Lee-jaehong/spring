package com.idev.boot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.idev.boot.dao.CommentsMapper;
import com.idev.boot.dto.TimelineBoardComments;


@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentsMapper cdao;
	
	
	@Override
	public int insert(TimelineBoardComments dto) {
		// TODO Auto-generated method stub
		return cdao.insert(dto);
	}

	@Override
	public List<TimelineBoardComments> commentList(int mref) {
		// TODO Auto-generated method stub
		return cdao.getComments(mref);
	}



	@Override
	public int delete(int idx) {
		// TODO Auto-generated method stub
		return cdao.delete(idx);
	}
	@Override
	public int deleteall(int idx) {
		// TODO Auto-generated method stub
		return cdao.deleteall(idx);
	}
	@Override
	public void commentUp(int idx) {
		// TODO Auto-generated method stub
		cdao.commentUp(idx);
	}
	@Override
	public void commentDown(int idx) {
		// TODO Auto-generated method stub
		cdao.commentDown(idx);
	}


	
	
}
