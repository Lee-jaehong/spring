package com.idev.boot.dto;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class TimelineBoard {
	private int timeline_board_id;
	private String id;
	private int heart_count;
	private int view_count;
	private String filename;
	private String title;
	private String content;
	private Date wdate;	
	private int comment_count;
	private String nickname;
	
	private List<MultipartFile> pics;
}

//@Data : getter,setter,toString
//Model객체는 반드시 getter/setter 가 있어야합니다.(주의)
