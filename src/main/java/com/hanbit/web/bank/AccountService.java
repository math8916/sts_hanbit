/**
 * 
 */
package com.hanbit.web.bank;

import java.util.List;
import java.util.Map;

import com.hanbit.web.util.CommonService;




/**
 * @date  : 2016. 6. 20.
 * @author: 諛곌렐�솉
 * @file  : AccountService.java
 * @story :
 */
public interface AccountService extends CommonService{

	public String openAccount(AccountVO acc);
	public String deposit(String accountNo, String money);
	public String withdraw(String account, String withdrawMoney);
	public String updateAccount(AccountMemberVO acc);
	public String deleteAccount(String delete);
	public AccountMemberVO findByAccountNo(int account);
}

