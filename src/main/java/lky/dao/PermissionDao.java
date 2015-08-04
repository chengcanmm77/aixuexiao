package lky.dao;

import lky.entity.Permission;

public interface PermissionDao {
	public void createPermission(Permission permission);
	public void deletePermission(Long permissionId);
}
