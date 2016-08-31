package com.hanbit.web.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanbit.web.bank.AccountServiceImpl;
import com.hanbit.web.subject.SubjectDAO;
import com.hanbit.web.subject.SubjectDAOImpl;
import com.hanbit.web.subject.SubjectMemberVO;


/**
 * @date  : 2016. 6. 20.
 * @author: 배근홍
 * @file  : StudentServiceImpl.java
 * @story :
 */
@Service
public class MemberServiceImpl implements MemberService {

	private MemberDAOImpl dao ;
	private SubjectDAOImpl subjDao ;
	@Autowired	private MemberVO member;
	private SubjectDAO sb;
	@Autowired	private SubjectMemberVO sm;
	@Autowired	private AccountServiceImpl accService;
	
	private MemberServiceImpl() {
		dao = MemberDAOImpl.getInstance() ;
		subjDao = SubjectDAOImpl.getInstance();
	}

	public void logoutSession(MemberVO member) {
		if (member.getId().equals(member.getId()) && member.getPw().equals(member.getPw())) {
			member = null;
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
		member = dao.findById(mem.getId());
	}

	@Override
	public void delete(MemberVO mem) {
		dao.delete(mem);
		member = dao.findById(mem.getId());
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
				member = dao.findById(member.getId());
				result = member.getName();
				//accService.map();
			}else{
				result = "";
			}
		
		return result;
	}
	public String myAccount() {
		return member.toString();
	}
	@Override
	public MemberVO getSession() {
		// TODO Auto-generated method stub
		return null;
	}
}