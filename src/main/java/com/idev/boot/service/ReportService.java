package com.idev.boot.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.idev.boot.dto.PageDto;
import com.idev.boot.dto.Report;

@Service
public interface ReportService {
	List<Report> getPageList(PageDto dto);
	int insert(Report dto);
	int searchCount(PageDto dto);
	List<Report> searchList(PageDto dto);
}
