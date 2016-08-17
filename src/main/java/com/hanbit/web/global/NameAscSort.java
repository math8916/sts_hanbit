package com.hanbit.web.global;

import java.util.Comparator;

import com.hanbit.web.bank.AccountMemberBean;



/**
 * @date  : 2016. 7. 8.
 * @author: 배근홍
 * @file  : NameAscSort.java
 * @story  :
 */
public class NameAscSort implements Comparator<AccountMemberBean>{

	@Override
	public int compare(AccountMemberBean first, AccountMemberBean second) {
		return first.getName().compareTo(second.getName());
		
	}

}
