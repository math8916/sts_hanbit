/**
 * 
 */
package com.hanbit.web.services;

import java.util.List;

import com.hanbit.web.domains.MemberDTO;
import com.hanbit.web.util.CommonService;

/**
 * @date  : 2016. 6. 17.
 * @author: 배근홍
 * @file  : StudentService.java
 * @story :
 */

public interface MemberService extends CommonService{
	public String regist(MemberDTO mem);
	public void update(MemberDTO mem);
	public void delete(MemberDTO mem);
	public MemberDTO findById(String id);
	/*public String login(MemberDTO member);*/
	public MemberDTO getSession();
	public MemberDTO login(MemberDTO member);
	public void logoutSession(MemberDTO member);
	
}
