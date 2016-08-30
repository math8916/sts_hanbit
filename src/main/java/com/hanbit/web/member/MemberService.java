/**
 * 
 */
package com.hanbit.web.member;

import java.util.List;

import com.hanbit.web.util.CommonService;

/**
 * @date  : 2016. 6. 17.
 * @author: 배근홍
 * @file  : StudentService.java
 * @story :
 */

public interface MemberService extends CommonService{
	public String regist(MemberVO mem);
	public void update(MemberVO mem);
	public void delete(MemberVO mem);
	public MemberVO findById(String id);
	public String login(MemberVO member);
	public MemberVO getSession();
	public void logoutSession(MemberVO member);
	
}
