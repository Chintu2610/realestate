package com.real.service;

public interface AddContactservice {
	
	public String addcontact(String name,String email, String phone, String subject, String message);
	 
	public String deletecontact(String id);
	
}
