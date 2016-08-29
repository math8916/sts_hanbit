package com.hanbit.web.member;

import java.util.List;

public interface MemberDAO {
	public int insert(MemberBean mem);
	public void update(MemberBean mem);
	public void delete(MemberBean mem);
	public List<?> list();
	public MemberBean findById(String pk);
	public List<?> findByName(String name);
	public int count();
	public boolean login(MemberBean param);
	public boolean existId(String id);

}
