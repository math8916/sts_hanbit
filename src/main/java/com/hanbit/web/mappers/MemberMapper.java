package com.hanbit.web.mappers;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanbit.web.domains.MemberDTO;
@Repository
public interface MemberMapper {
	public int insert(MemberDTO mem);
	public int update(MemberDTO mem);
	public int delete(MemberDTO mem);
	public List<?> list();
	public MemberDTO findById(String pk);
	public List<?> findByName(String name);
	public int count();
	public boolean login(MemberDTO param);
	public boolean existId(String id);

}
