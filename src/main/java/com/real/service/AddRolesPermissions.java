package com.real.service;

public interface AddRolesPermissions {
	
	public String addrope(String RoleID,String ModuleName, String FormName, String PermissionType);
	 
	public String deleterope(String RolePermissionID);
	
	public String editrope(String RolePermissionID,String RoleID,String ModuleName, String FormName, String PermissionType);


}
