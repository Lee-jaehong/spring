package com.idev.boot.dto;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TimelineBoardComments {
	private int tcomment_id;
	private int timeline_board_id;
	private String id;
	private String content;
	private Date wdate;
	private int heartcount;
}
