package com.hanbit.web.subject;

import org.springframework.stereotype.Service;

@Service
public class SubjectServiceImpl implements SubjectService {
	SubjectDAOImpl dao = SubjectDAOImpl.getInstance();
	private static SubjectServiceImpl instance = new SubjectServiceImpl();
	private SubjectServiceImpl() {
	
	// TODO Auto-generated constructor stub
}
	public static SubjectServiceImpl getInstance() {
		return instance;
	}
	
	@Override
	public void insert(SubjectBean s) {
		// TODO Auto-generated method stub
		dao.insert(s);
	}
	
}
