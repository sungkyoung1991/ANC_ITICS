package com.ancintl.ancitics.service.user.impl;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ancintl.ancitics.domain.User;
import com.ancintl.ancitics.service.user.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {
	
	@Autowired
	@Resource(name="sqlSessionTemplate_ITICS")
	/*@Qualifier("sqlSessionTemplate")*/
	private SqlSession sqlSession_ITICS;
	public void setSqlSession_ITICS(SqlSession sqlSession_ITICS) {
		this.sqlSession_ITICS=sqlSession_ITICS;
	}
	
	@Autowired
	@Resource(name="sqlSessionTemplate_UFMS")
	/*@Qualifier("sqlSessionTemplate")*/
	private SqlSession sqlSession_UFMS;
	public void setSqlSession_UFMS(SqlSession sqlSession_UFMS) {
		this.sqlSession_UFMS=sqlSession_UFMS;
	}
	
	
	
	@Override
	public User login(User user) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession_ITICS.selectOne("ITICS_UserMapper.login", user);
	}

}
