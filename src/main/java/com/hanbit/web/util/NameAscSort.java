package com.hanbit.web.util;

import java.util.Comparator;

import com.hanbit.web.bank.AccountMemberVO;



/**
 * @date  : 2016. 7. 8.
 * @author: 배근홍
 * @file  : NameAscSort.java
 * @story  :
 */
public class NameAscSort implements Comparator<AccountMemberVO>{

	@Override
	public int compare(AccountMemberVO first, AccountMemberVO second) {
		return first.getName().compareTo(second.getName());
		
	}

}
