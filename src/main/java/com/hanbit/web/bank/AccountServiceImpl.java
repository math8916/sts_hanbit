/**
 * 
 */
package com.hanbit.web.bank;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hanbit.web.member.MemberVO;

/**
 * @date  : 2016. 6. 20.
 * @author: 諛곌렐�솉
 * @file  : AccountServiceImpl.java
 * @story : 怨꾩쥖 �씤�꽣�럹�씠�뒪
 */
@Service
public class AccountServiceImpl implements AccountService {
	private AccountDAOImpl dao;
	private AccountVO session;
	private Map<?, ?> map;
	private static AccountServiceImpl instance;
	public static AccountServiceImpl getInstance(){
		return instance;
	}
	private AccountServiceImpl() {
		new HashMap<String,AccountMemberVO>() ;
	}



	@Override
	public String openAccount(AccountVO acc) {
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
	public String updateAccount(AccountMemberVO acc) {
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
	public AccountMemberVO findByAccountNo(int account) {
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
		map = new HashMap<String,AccountMemberVO>();
		map = dao.selectMap();	
		return map;
	}
}
