package lky.service;

import java.util.List;

import lky.entity.User;

public interface UserService {
	public User createUser(User user);
	public void changePassword(Long userId,String newPassword);
	public void corraltionRoles(Long userId,Long... rolesIds);
	public void uncorrelationRoles(Long userId, Long... rolesIds);
	public User findByUsername(String username);
	public List<String> findRoles(String username);
	public List<String> findPermission(String username);
}
