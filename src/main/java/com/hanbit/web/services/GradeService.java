package com.hanbit.web.services;

import com.hanbit.web.domains.GradeDTO;
import com.hanbit.web.util.CommonService;

public interface GradeService extends CommonService{
	// 총 7개의 기본 패턴이 존재
	// exeU
	
	public String insert(GradeDTO grade);
	public GradeDTO findBySeq(int seq);
	public String update(GradeDTO grade);
	public String delete(String delete); 
	public String GradeCal(GradeDTO grade);
	public int count(String findByCount);
}
