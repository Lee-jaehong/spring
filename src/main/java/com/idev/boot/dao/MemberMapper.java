package com.idev.boot.dao;
 
import java.util.List; 
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.idev.boot.dto.Member;


@Mapper		
//매퍼 인터페이스 이다. : mapper xml 파일의 sql 실행 위한 구현체를 만들 인터페이스
public interface MemberMapper {
	int getCount();
	List<Member> selectAll();
	Member selectByMno(int mno);
	Member login(Map<String,String> map);
	int changePassw(Map<String,String> map);
	int checkEmail(String email);
	int addMember(Member member);
	int updateMember(Member member);
	int findid(Member member);
	int register(Member smember);		// 회원가입
	int idCheck(String id);			// 아이디 중복확인
	int nickCheck(String nickname);		// 닉네임 중복확인
	// 1004 작성
	int memUpdate(Member member);	// 회원정보 수정
	int pwChange(Map<String, String> map);	// 비밀번호 변경
	int memDelete(Map<String, String> map);		// 회원 탈퇴
}