package lky.service;

import lky.entity.Permission;

public interface PermissionService {
	public void createPermission(Permission permission);
	public void deletePermission(Long permissionId);
}
