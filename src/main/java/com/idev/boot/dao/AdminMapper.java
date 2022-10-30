package com.idev.boot.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.idev.boot.dto.Member;

@Mapper
public interface AdminMapper {
	List<Member> selectMember();
	int lockMember(String id);
	int sMember(String id);
}
