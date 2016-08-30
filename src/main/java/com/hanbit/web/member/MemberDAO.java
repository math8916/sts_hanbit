package com.hanbit.web.member;

import java.util.List;

public interface MemberDAO {
	public int insert(MemberVO mem);
	public int update(MemberVO mem);
	public int delete(MemberVO mem);
	public List<?> list();
	public MemberVO findById(String pk);
	public List<?> findByName(String name);
	public int count();
	public boolean login(MemberVO param);
	public boolean existId(String id);

}
