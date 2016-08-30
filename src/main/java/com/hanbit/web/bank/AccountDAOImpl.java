package com.hanbit.web.bank;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;



@Repository
public class AccountDAOImpl implements AccountDAO {
	private static AccountDAOImpl instance;
	   private static final Logger logger = LoggerFactory.getLogger(AccountDAOImpl.class);
	   private static final String NAMESPACE = "mapper.account.";
	   private SqlSessionFactory sqlSessionFactory;
	   private AccountDAOImpl() {
	      try{
	         InputStream is = Resources.getResourceAsStream("config/mybatis-config.xml");
	         sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
	      }catch(IOException e){
	         logger.info("session build fail");
	      }
	   }
	   public static AccountDAOImpl getInstance() {
	      if (instance == null) 
	         logger.info("AccountDAOImpl instance is null");
	         instance = new AccountDAOImpl();
	      return instance;
	   }
	   public AccountDAOImpl (SqlSessionFactory sqlSessionFactory){
	      this.sqlSessionFactory = sqlSessionFactory;
	   }
	@Override
	public int openAccount(AccountVO bean){
		SqlSession session = sqlSessionFactory.openSession();
		return session.insert("",bean);
	}
	@Override
	public int deposit(String accountNo, String money){
		SqlSession session = sqlSessionFactory.openSession();
		return session.update("",accountNo);
		}
	@Override
	public int withDraw (String account, String withdrawMoney){
		SqlSession session = sqlSessionFactory.openSession();
		return session.update("",account);
		}
	@Override
	public int updateAccount(AccountMemberVO acc){
		SqlSession session = sqlSessionFactory.openSession();
		return session.update("",acc);
		}
	@Override
	public int deleteAccount(String delete){
		SqlSession session = sqlSessionFactory.openSession();
		return session.delete("",delete);
		}
	@Override
	public List<?> findAccount (){
		SqlSession session = sqlSessionFactory.openSession();
		return session.selectList("");
		}
	@Override
	public AccountMemberVO findByAcc (int account){
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			return session.selectOne(NAMESPACE +"findById",account);
		} finally {
			session.close();
		}
		}
	@Override
	public List<?> findByName(String name){
		SqlSession session = sqlSessionFactory.openSession();
		return session.selectList("",name);
		}
	@Override
	public int count(){
		SqlSession session = sqlSessionFactory.openSession();
		return session.selectOne("");
		}
	@Override
	public Map<?, ?> selectMap() {
		SqlSession session = sqlSessionFactory.openSession();
		return session.selectOne("");
		}

	}


