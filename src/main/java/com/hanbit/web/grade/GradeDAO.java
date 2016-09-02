package com.hanbit.web.grade;

import java.util.List;

public interface GradeDAO {
	public int insert(GradeVO grade);
	public int update(GradeVO grade);
	public int delete(String delete);
	public List<?> list();
	public GradeVO findBySeq(int seq);
	public List<?> findByID(String id);
	public int count();
}