package com.hanbit.web.mappers;

import java.util.List;

import com.hanbit.web.domains.GradeDTO;

public interface GradeMapper {
	public int insert(GradeDTO grade);
	public int update(GradeDTO grade);
	public int delete(String delete);
	public List<?> list();
	public GradeDTO findBySeq(int seq);
	public List<?> findByID(String id);
	public int count();
}