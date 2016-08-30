package com.hanbit.web.member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hanbit.web.bank.AccountService;
import com.hanbit.web.bank.AccountServiceImpl;
import com.hanbit.web.subject.SubjectDAOImpl;


/**
 * @date  : 2016. 6. 20.
 * @author: 배근홍
 * @file  : StudentServiceImpl.java
 * @story :
 */
@Service
public class MemberServiceImpl implements MemberService {
	
	private MemberDAOImpl dao ;
	private SubjectDAOImpl subjDao = SubjectDAOImpl.getInstance();
	private AccountService accService = AccountServiceImpl.getInstance();
	private MemberVO session;
	private static MemberServiceImpl instance = new MemberServiceImpl();
	public static MemberServiceImpl getInstance() {
		return instance;
	}
	private MemberServiceImpl() {
		dao = MemberDAOImpl.getInstance() ;
	}



	
	public void logoutSession(MemberVO member) {
		if (member.getId().equals(session.getId()) && member.getPw().equals(session.getPw())) {
			session = null;
		}
	}
	
	
	
	@Override
	public String regist(MemberVO mem) {
		String msg = "";
		if (dao.insert(mem)==1) {
			msg = dao.findById(mem.getId()).getName();
		}
		return msg;
	}

	

	@Override
	public void update(MemberVO mem) {
		dao.update(mem);
		session = dao.findById(mem.getId());
	}

	@Override
	public void delete(MemberVO mem) {
		dao.delete(mem);
		session = dao.findById(mem.getId());
	}
	
	
	public int count() {
		return dao.count();
	}
	@Override
	public MemberVO findById(String id) {
	
		return dao.findById(id);
	}
	public List<?> list() {
		return dao.list();
	}
	public List<?> findByName(String findName) {
		return dao.findByName(findName);
	}
	@Override
	public List<?> findBy(String keyword) {
		return null;
	}
	@Override
	public Map<?, ?> map() {
		return null;
	}
	
	public String login(MemberVO member) {
		String result = "";
			if (dao.login(member)) {
				session = dao.findById(member.getId());
				result = session.getName();
				accService.map();
			}else{
				result = "";
			}
		
		return result;
	}
	public String myAccount() {
		return session.toString();
	}
	@Override
	public MemberVO getSession() {
		// TODO Auto-generated method stub
		return null;
	}
}