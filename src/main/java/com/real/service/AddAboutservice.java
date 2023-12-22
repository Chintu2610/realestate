package com.real.service;

public interface AddAboutservice {
	

	public String addabout(String id,String title,String content, String image);
 
	public String deleteabout(String id);
	
	public String editabout(String id,String title,String content, String image);

}
