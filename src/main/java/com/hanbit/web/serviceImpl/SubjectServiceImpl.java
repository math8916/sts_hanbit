package com.hanbit.web.serviceImpl;

import org.springframework.stereotype.Service;

import com.hanbit.web.domains.SubjectDTO;
import com.hanbit.web.services.SubjectService;

@Service
public class SubjectServiceImpl implements SubjectService {
	private static SubjectServiceImpl instance = new SubjectServiceImpl();
	private SubjectServiceImpl() {
	
	// TODO Auto-generated constructor stub
}
	public static SubjectServiceImpl getInstance() {
		return instance;
	}
	@Override
	public void insert(SubjectDTO s) {
		// TODO Auto-generated method stub
		
	}

}
