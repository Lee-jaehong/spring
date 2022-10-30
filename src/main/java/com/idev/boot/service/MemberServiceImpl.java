package com.idev.boot.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.idev.boot.dao.MemberMapper;
import com.idev.boot.dto.Member;


@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper dao;
	
	@Override
	public int register(Member dto) {
		String path = "c:\\upload"; 	// 경훈
//		String path = "/Users/parksanghoon/Desktop/psh_std/upload/"; // \는 출력 또는 문자열로 지정할때는 두번씁니다.
		
		// view(jsp) 로 전달할 파일명 리스트
		List<String> list = new ArrayList<>();
		
		StringBuilder filenames = new StringBuilder();
		
		
			
				String temp = dto.getPics().getOriginalFilename();
				String ext = temp.substring(temp.lastIndexOf('.'), temp.length()); // 확장자만 추출
				StringBuilder newfile= new StringBuilder("gallery_")
						.append(UUID.randomUUID().toString().substring(0, 8)).append(ext);
				// 새로운 파일명 - 중복을 최소화하려면 랜덤문자열길이를 늘리세요.
			
				File sfile = new File(path + "\\" + newfile);
				try {
					dto.getPics().transferTo(sfile); 					// 서버에 저장할 파일객체로 전송합니다. (서버 업로드)
					filenames.append(newfile);
				} catch (IllegalStateException | IOException e) {
					// logger.info("파일 전송오류 : " + e.getMessage());
				}
			
		dto.setProfile_file(filenames.toString());
		return dao.register(dto);
}
}
