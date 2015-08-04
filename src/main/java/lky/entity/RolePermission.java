package lky.entity;

public class RolePermission {
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public Long getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(Long permissionId) {
		this.permissionId = permissionId;
	}
	private Long roleId;
	private Long permissionId;
	@Override
	public boolean equals(Object obj) {
		if (this==obj) {
			return true;
		}
		if (getClass()!=obj.getClass()) {
			return false;
		}
		UserRole ur = (UserRole)obj;
		if(permissionId!=null?!permissionId.equals(ur.getUserId()):permissionId!=null)return false;
		if(roleId!=null?!roleId.equals(ur.getRoleId()):roleId!=null)return false;
		return true;
	}
	@Override
	public int hashCode() {
		int result=(permissionId!=null?permissionId.hashCode():0);
		result=31*result+(roleId!=null?roleId.hashCode():0);
		return result;
		
	}
}
