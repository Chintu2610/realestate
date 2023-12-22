package com.real.service;

public interface Addrolesservice {
	

	public String addrole(String RoleID,String RoleName,String Description);
 
	public String deleterole(String RoleID);
	
	public String editrole(String RoleID,String RoleName,String Description);

}
