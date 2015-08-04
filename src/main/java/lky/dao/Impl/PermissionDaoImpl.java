package lky.dao.Impl;

import org.springframework.stereotype.Component;

import com.aixuexiao.dao.BaseDao;

import lky.dao.PermissionDao;
import lky.entity.Permission;

@Component("permissionDao")
public class PermissionDaoImpl extends BaseDao implements PermissionDao {

	@Override
	public void createPermission(Permission permission) {
		this.writerSqlSession.insert("lky.dao.Impl.createPermission", permission);
	}

	@Override
	public void deletePermission(Long permissionId) {
		this.writerSqlSession.delete("lky.dao.Impl.deletePermission",permissionId);
	}

}
