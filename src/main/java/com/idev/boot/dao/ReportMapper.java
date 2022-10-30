package com.idev.boot.dao;

import java.util.List;   

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.idev.boot.dto.PageDto;
import com.idev.boot.dto.Report;


@Repository
@Mapper
public interface ReportMapper {
	int insert(Report admin);
	List<Report> selectReport(String id);
	List<Report> getPageList(PageDto dto);
	int searchCount(PageDto dto);
	Report getOne(int admin_board_id);
	int rDelete(int admin_board_id);
	List<Report> searchList(PageDto dto);
	List<Report> allReport();
}
