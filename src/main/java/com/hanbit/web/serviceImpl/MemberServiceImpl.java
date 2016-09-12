package com.hanbit.web.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanbit.web.controllers.MemberController;
import com.hanbit.web.domains.MemberDTO;
import com.hanbit.web.domains.SubjectDTO;
import com.hanbit.web.mappers.MemberMapper;
import com.hanbit.web.mappers.SubjectMapper;
import com.hanbit.web.services.MemberService;


/**
 * @date  : 2016. 6. 20.
 * @author: 배근홍
 * @file  : StudentServiceImpl.java
 * @story :
 */
@Service
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired	private SqlSession sqlSession;
	@Autowired	private MemberDTO member;
	
	private MemberServiceImpl() {
	}

	public void logoutSession(MemberDTO member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		if (member.getId().equals(member.getId()) && member.getPw().equals(member.getPw())) {
			member = null;
		}
	}
	
	

	public List<?> findBy(String keyword) {
		return null;
	}
	@Override
	public Map<?, ?> map() {
		return null;
	}
	
	public String myAccount() {
		return member.toString();
	}
	@Override
	public MemberDTO getSession() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<?> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String regist(MemberDTO mem) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(MemberDTO mem) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(MemberDTO mem) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberDTO findById(String id) {
		// TODO Auto-generated method stub
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return findById(id);
	}



	@Override
	public MemberDTO login(MemberDTO member) {
		logger.info("MemberService login ID = {}",member.getId());
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		MemberDTO mem =mapper.findById(member.getId());
		if(member.getPw().equals(mem.getPw())) {
			logger.info("MemberService login {}"," SUCCESS ");
			return mem;
		}
		logger.info("MemberService login {}"," FAIL ");
		mem.setId("NONE");
		return mem;
	}
}