package com.idev.boot.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.idev.boot.dao.FreeboardMapper;
import com.idev.boot.dto.LikeDto;
import com.idev.boot.dto.PageDto;
import com.idev.boot.dto.TimelineBoard;



@Service
public class FreeBoardServiceImpl implements FreeboardService{
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardServiceImpl.class);
	
	@Autowired
	private FreeboardMapper dao;
	
	@Override
	public int insert(TimelineBoard dto) {
String path = "c:\\upload"; // \는 출력 또는 문자열로 지정할때는 두번씁니다.
		
		// view(jsp) 로 전달할 파일명 리스트
		List<String> list = new ArrayList<>();
		
		StringBuilder filenames = new StringBuilder();
		
		for (MultipartFile f : dto.getPics()) {
			if (f.getSize() != 0) {
				String temp = f.getOriginalFilename();
				String ext = temp.substring(temp.lastIndexOf('.'), temp.length()); // 확장자만 추출
				StringBuilder newfile= new StringBuilder("gallery_")
						.append(UUID.randomUUID().toString().substring(0, 8)).append(ext);
				// 새로운 파일명 - 중복을 최소화하려면 랜덤문자열길이를 늘리세요.
			
				File sfile = new File(path + "\\" + newfile);
				try {
					f.transferTo(sfile); 					// 서버에 저장할 파일객체로 전송합니다. (서버 업로드)
					filenames.append(newfile).append(","); //업로드한 파일명을 , 구분해서 나열하고 저장
				} catch (IllegalStateException | IOException e) {
					// logger.info("파일 전송오류 : " + e.getMessage());
				}
			}
		}
		dto.setFilename(filenames.toString());   //업로드한 파일명을 , 구분해서 나열하고 저장
		return dao.insert(dto);
	}

	@Override
	public int getCount() {
		return dao.getCount();
	}

	@Override
	public List<TimelineBoard> getPagelist() {
		return dao.getPageList();
	}


	@Override
	public TimelineBoard getBoardOne(int idx) {
		return dao.detail(idx);
	}


	@Override
	public void updateReadCnt(int idx) {
		dao.readcountUp(idx);
	}
	@Override
	public void delete(int idx) {
		dao.delete(idx);
	}
	@Override
	public int findLike(Map<String, Object> map) {
		return dao.findLike(map);
	}
	@Override
	public int getLike(int idx) {
		return dao.getLike(idx);
	}
	@Override
	public void likeUp(LikeDto dto) {
		dao.likeUp(dto);
	}
	@Override
	public void likeDown(LikeDto dto) {
		dao.likeDown(dto);
	}
	@Override
	public void likeUp2(int idx) {
		dao.likeUp2(idx);
	}
	@Override
	public void likeDown2(int idx) {
		dao.likeDown2(idx);
	}
	@Override
	public void update(TimelineBoard dto) {
		dao.update(dto);
	}
	@Override
	public String getNick(int idx) {
		return dao.getNick(idx);
	}
	
	


	

}
