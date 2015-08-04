package lky.dao;

import java.util.List;

import lky.entity.User;

public interface UserDao {
	public void createUser(User user);
	public void updateUser(User user);
	public void deleteUser(Long userId);
	
	public void correlationRoles(Long userId, Long... rolesIds);
	public void unCorrelationRoles(Long userId, Long... rolesId);
	
	User findOne(Long userId);
	
	User findByUsername(String username);
	List<String> findRoles(String username);
	List<String> findPermissions(String username);
	
}
