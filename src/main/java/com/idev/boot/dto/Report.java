package com.idev.boot.dto;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report {
	private int admin_board_id;
	private String id;
	private String filename;
	private String title;
	private String content;
	private Timestamp wdate;
	
	private MultipartFile pics;
}
