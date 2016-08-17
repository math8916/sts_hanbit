/**
 * 
 */
package com.hanbit.web.bank;

import java.util.List;
import java.util.Map;

import com.hanbit.web.global.CommonService;




/**
 * @date  : 2016. 6. 20.
 * @author: 諛곌렐�솉
 * @file  : AccountService.java
 * @story :
 */
public interface AccountService extends CommonService{
	//1.媛쒖꽕 2.�엯湲� 3.議고쉶 4.異쒓툑 5.�넻�옣�궡�뿭蹂닿린
	
	// 1媛쒖꽕
	public String openAccount(AccountBean acc);
	// 2�엯湲�
	public String deposit(String accountNo, String money);
	// 3異쒓툑
	public String withdraw(String account, String withdrawMoney);
	// 4�닔�젙.. �궗�슜�옄�쓽 �슂泥��뿉 �쓽�빐 鍮꾨�踰덊샇留� 蹂�寃쎄��뒫
	public String updateAccount(AccountMemberBean acc);
	// 5�빐吏�
	public String deleteAccount(String delete);
	// 7議고쉶 (怨꾩쥖踰덊샇)
	public AccountMemberBean findByAccountNo(int account);
}

