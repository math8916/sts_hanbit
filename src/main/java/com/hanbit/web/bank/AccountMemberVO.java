package com.hanbit.web.bank;

/**
혻* @date혻 : 2016. 7. 7.
혻* @author: 諛곌렐�솉
혻* @file혻 : AccountMemberBean.java
혻* @story혻 :
혻*/
public class AccountMemberVO {
	private String id, pw, name, regDate, gender, ssn;
	private int birth, accountNo, money;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public int getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	@Override
	public String toString() {
		return "�넻�옣�젙蹂� [ID : " + id + ", �씠由� : " + name + ", �깮�뀈�썡�씪 : " + ssn + ", 怨꾩쥖踰덊샇 : " + accountNo + ", �옍怨� : " + money + "]\n";
	}
	
	
}
