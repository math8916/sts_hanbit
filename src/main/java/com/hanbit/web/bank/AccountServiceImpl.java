/**
 * 
 */
package com.hanbit.web.bank;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @date  : 2016. 6. 20.
 * @author: 諛곌렐�솉
 * @file  : AccountServiceImpl.java
 * @story : 怨꾩쥖 �씤�꽣�럹�씠�뒪
 */
public class AccountServiceImpl implements AccountService {
	AccountDAO dao = AccountDAO.getDao();
	private Map<?,?> map;
	private static AccountServiceImpl instence = new AccountServiceImpl();
	public static AccountServiceImpl getInstence() {
		return instence;
	}
	private AccountServiceImpl() {
		new HashMap<String,AccountMemberBean>();
	}

	@Override
	public String openAccount(AccountBean acc) {
		String result = "";
		acc.setAccountNo((int) (Math.random()*999999)+100000);
		acc.setMoney(0);
		result = (dao.openAccount(acc) == 1)?"怨꾩쥖 媛쒖꽕�뿉 �꽦怨듯븯���뒿�땲�떎":"怨꾩쥖 媛쒖꽕�뿉 �떎�뙣�븯���뒿�땲�떎";
		return result;
	}
	@Override
	public String deposit(String accountNo, String money) {
		String result ="";
		if (dao.deposit(accountNo, money) == 1) {
			result = "�엯湲덊븯���뒿�땲�떎";
		}
		return result;
	}
	@Override
	public String withdraw(String account, String withdrawMoney) {
		String result = "";
		if (Integer.parseInt(withdrawMoney) > dao.findByAcc(Integer.parseInt(account)).getMoney()) {
			result = "�옍怨좉� 遺�議깊빀�땲�떎";
		}else {
			result = "異쒓툑�븯���뒿�땲�떎";
			String.valueOf(dao.withDraw(account, withdrawMoney));
		}
		return result;
	}
	@Override
	public String updateAccount(AccountMemberBean acc) {
		return String.valueOf(dao.updateAccount(acc));
	}
	@Override
	public String deleteAccount(String delete) {
		String result = "";
		if (dao.deleteAccount(delete) == 1) {
			result ="�궘�젣 �꽦怨�";
		}else{
			result ="�궘�젣 �떎�뙣";
		}
		return result;
	}
	@Override
	public List<?> list() {
		List<?> list = dao.findAccount();
		
		return list;
	}
	@Override
	public AccountMemberBean findByAccountNo(int account) {
		return dao.findByAcc(account);
	}
	@Override
	public List<?> findBy(String name) {
		return dao.findByName(name);
	}
	@Override
	public int count() {
		return dao.count();
	}
	@Override
	public Map<?, ?> map() {
		map = new HashMap<String,AccountMemberBean>();
		map = dao.selectMap();	
		return map;
	}
}
