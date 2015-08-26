package lky.dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lky.dao.UserDao;
import lky.entity.User;

import com.aixuexiao.dao.BaseDao;
@Component("userDao")

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public void createUser(User user) {
		this.writerSqlSession.insert("lky.dao.Impl.createUser",user);
	}

	@Override
	public void updateUser(User user) {
		this.writerSqlSession.insert("lky.dao.Impl.updateUser",user);
	}

	@Override
	public void deleteUser(Long userId) {
		this.writerSqlSession.insert("lky.dao.Impl.deleteUser",userId);
	}

	@Override
	public void correlationRoles(Long userId, Long... rolesIds) {
		for (Long roleId:rolesIds) {
			Map<String,Long> map= new HashMap<String, Long>();
			map.put("user_id", userId);
			map.put("role_id", roleId);
			this.writerSqlSession.insert("lky.web.Impl.singleUserCorrelation",map);
		}
		
	}

	@Override
	public void unCorrelationRoles(Long userId, Long... rolesIds) {
		for (Long roleId:rolesIds) {
			Map<String,Long> map= new HashMap<String, Long>();
			map.put("user_id", userId);
			map.put("role_id", roleId);
			this.writerSqlSession.delete("lky.web.Impl.singleUserUnCorrelation",map);
		}
		
	}

	@Override
	public User findOne(Long userId) {
		return this.readSqlSession.selectOne("lky.dao.Impl.findOne", userId);
	}

	@Override
	public User findByUsername(String username) {
		return this.readSqlSession.selectOne("lky.dao.Impl.findByUsername", username);
	}

	@Override
	public List<String> findRoles(String username) {
		return this.readSqlSession.selectList("lky.dao.Impl.findRoles",username);
	}

	@Override
	public List<String> findPermissions(String username) {
		return this.readSqlSession.selectList("lky.dao.Impl.findPermissions",username);
	}

}
