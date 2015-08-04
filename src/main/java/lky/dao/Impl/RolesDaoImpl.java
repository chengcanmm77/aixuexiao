package lky.dao.Impl;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.aixuexiao.dao.BaseDao;

import lky.dao.RoleDao;
import lky.entity.Role;
@Component("roleDao")
public class RolesDaoImpl extends BaseDao implements RoleDao {

	@Override
	public void createRole(Role role) {
		this.writerSqlSession.insert("lky.dao.Impl.createRole", role);
		
	}

	@Override
	public void deleteRole(Long roleId) {
		this.writerSqlSession.delete("lky.dao.Impl.deleteRole",roleId);
		
	}

	@Override
	public void correlationPermissions(Long roleId, Long... permissionIds) {
		for (Long permissionId:permissionIds) {
			Map<String,Long> map= new HashMap<String, Long>();
			map.put("role_id", roleId);
			map.put("permission_id", permissionId);
			this.writerSqlSession.insert("lky.web.Impl.singleRoleCorrelation",map);
		}
	}

	@Override
	public void uncorrelationPermissions(Long roleId, Long... permissionIds) {
		for(Long permissionId:permissionIds){
			Map<String,Long> map= new HashMap<String, Long>();
			map.put("role_id", roleId);
			map.put("permission_id", permissionId);
			this.writerSqlSession.insert("lky.web.Impl.singleRoleUnCorrelation",map);
		}
	}

}
