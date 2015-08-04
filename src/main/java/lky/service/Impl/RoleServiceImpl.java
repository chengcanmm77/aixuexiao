package lky.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lky.dao.RoleDao;
import lky.entity.Role;
import lky.service.RoleService;
@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Resource
	private RoleDao roleDao;
	@Override
	public void createRole(Role role) {
		roleDao.createRole(role);
		return;
	}

	@Override
	public void deleteRole(Long roleId) {
		roleDao.deleteRole(roleId);
	}

	@Override
	public void correlationPermissions(Long roleId, Long... permissionIds) {
		roleDao.correlationPermissions(roleId, permissionIds);

	}

	@Override
	public void uncorrelationPermissions(Long roleId, Long... permissionIds) {
		roleDao.uncorrelationPermissions(roleId, permissionIds);
	}

}
