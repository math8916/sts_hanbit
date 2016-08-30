package com.hanbit.web.util;

import java.util.Comparator;

import com.hanbit.web.bank.AccountMemberVO;



/**
 *  * @date  : 2016. 7. 8.  * @author: 배근홍  * @file  : NameAscSort.java
 *  * @story  :  
 */
public class AccountNumberSort implements Comparator<AccountMemberVO> {

	@Override
	public int compare(AccountMemberVO first, AccountMemberVO second) {
	int a = 0;
		if (first.getAccountNo()>second.getAccountNo()) {
		a = 1;
	} else {
		if (first.getAccountNo()<second.getAccountNo()) {
			a = -1;
		} else {
			a = 0;
		}
	}
		
		return a;
		
	}

}
