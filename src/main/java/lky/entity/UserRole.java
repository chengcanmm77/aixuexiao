package lky.entity;

public class UserRole {
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	private Long userId;
	private Long roleId;
	@Override
	public boolean equals(Object obj) {
		if (this==obj) {
			return true;
		}
		if (getClass()!=obj.getClass()) {
			return false;
		}
		UserRole ur = (UserRole)obj;
		if(userId!=null?!userId.equals(ur.getUserId()):userId!=null)return false;
		if(roleId!=null?!roleId.equals(ur.getRoleId()):roleId!=null)return false;
		return true;
	}
	@Override
	public int hashCode() {
		int result=(userId!=null?userId.hashCode():0);
		result=31*result+(roleId!=null?roleId.hashCode():0);
		return result;
		
	}
}
