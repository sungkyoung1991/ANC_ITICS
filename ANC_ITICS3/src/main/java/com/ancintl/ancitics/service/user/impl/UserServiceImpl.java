package com.ancintl.ancitics.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ancintl.ancitics.domain.User;
import com.ancintl.ancitics.service.user.UserDao;
import com.ancintl.ancitics.service.user.UserService;

@Service("userServiceImpl")//Qualifiler로 di될 이름 지정
public class UserServiceImpl implements UserService {
	
	@Autowired
	@Qualifier("userDaoImpl")//UserDAO userDAO=new UserDAOImpl();
	private UserDao userDao;
	
	public void setUserDAO(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public User login(User user) throws Exception {
		// TODO Auto-generated method stub
		
		return userDao.login(user);
	}

}
