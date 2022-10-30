package com.idev.boot.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatMessage {
	private int chatId ;
	private String fromId;
	private String toId;
	private String content;
	private String chatTime;

}
