package com.real.service;

public interface AddUserlistservice {
	
	public String adduserlist(String id,String username,String email, String phone, String password,String image,String roleId);
	 
	public String deleteuserlist(String id);
	
	public String edituserlist(String id,String username,String email, String phone, String password,String image,String roleId);



}
