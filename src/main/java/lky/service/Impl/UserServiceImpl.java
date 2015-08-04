package lky.service.Impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lky.dao.UserDao;
import lky.entity.User;
import lky.service.UserService;
import lky.util.PasswordHelper;
@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserDao userDao;

	@Override
	public User createUser(User user) {
		PasswordHelper.encryptPassword(user);
		userDao.createUser(user);
		return userDao.findOne(user.getId());
	}

	@Override
	public void changePassword(Long userId, String newPassword) {
		User user = userDao.findOne(userId);
		user.setPassword(newPassword);
		PasswordHelper.encryptPassword(user);
		userDao.updateUser(user);
	}

	@Override
	public void corraltionRoles(Long userId, Long... rolesIds) {
		userDao.correlationRoles(userId, rolesIds);
	}

	@Override
	public void uncorrelationRoles(Long userId, Long... rolesIds) {
		userDao.correlationRoles(userId, rolesIds);
		
	}

	@Override
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

	@Override
	public List<String> findRoles(String username) {
		return userDao.findRoles(username);
	}

	@Override
	public List<String> findPermission(String username) {
		return userDao.findPermissions(username);
	}

}
