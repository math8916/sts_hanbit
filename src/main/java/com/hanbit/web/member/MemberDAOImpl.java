package com.hanbit.web.member;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

/**
 *  * @date  : 2016. 7. 1.  * @author: 배근홍  * @file  : MemberDAO.java  * @story 
 * :  
 */
@Repository
public class MemberDAOImpl implements MemberDAO {
	   private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	private SqlSessionFactory sqlSessionFactory = null;
	private static MemberDAOImpl instance; 
	private static final String NAMESPACE = "mapper.member."; 
    public MemberDAOImpl(SqlSessionFactory sqlSessionFactory) {
	  this.sqlSessionFactory = sqlSessionFactory;
    }
    public static MemberDAOImpl getDao() {
		return dao;
	}
	private static MemberDAOImpl dao = new MemberDAOImpl(); 
	private MemberDAOImpl() {
		try{
	         InputStream is = Resources.getResourceAsStream("config/mybatis-config.xml");
	         sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
	      }catch(IOException e){
	         logger.info("session build fail");
	      }
	}
	public static MemberDAOImpl getInstance() {
		if (instance == null){
			logger.info("MemberDAOImpl instance is created !!");
			instance = new MemberDAOImpl();
		}
		return instance;
	}
@Override
	public int insert(MemberVO mem) {
	SqlSession session = sqlSessionFactory.openSession();
		return session.insert("",mem);
	}
@Override
	public int update(MemberVO mem) {
	SqlSession session = sqlSessionFactory.openSession();
	return session.update("",mem);
	}
@Override
	public int delete(MemberVO mem) {
	SqlSession session = sqlSessionFactory.openSession();
	return session.delete("",mem);
	}

@Override
	public List<?> list() {
	SqlSession session = sqlSessionFactory.openSession();
	return session.selectList("");
	}
@Override
	public MemberVO findById(String id) {
	SqlSession session = sqlSessionFactory.openSession();
	
	try {
		return session.selectOne(NAMESPACE +"findById",id);
	} finally {
		session.close();
	}
	}

@Override	
	public List<?> findByName(String name) {
	SqlSession session = sqlSessionFactory.openSession();
	return session.selectList("",name);
	}
@Override
	public int count() {
	SqlSession session = sqlSessionFactory.openSession();
	return session.selectOne("");
	}
@Override
	public boolean login(MemberVO param) {
		boolean loginOk= false;
		if(param.getId()!=null 
				&& param.getPw()!=null 
				&& this.existId(param.getId())){
			MemberVO member = this.findById(param.getId());
			if(member.getPw().equals(param.getPw())){
				loginOk = true;
			}
		
		}
		return loginOk;
	}
	@Override	
	public boolean existId(String id){
		boolean flag = false;
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.selectOne(NAMESPACE +"existId",id);
		if(result==1){
			return true;
		}
		return flag;
	}
}