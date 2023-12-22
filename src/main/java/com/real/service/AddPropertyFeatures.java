package com.real.service;

public interface AddPropertyFeatures {
	
	public String addproservice(String feature_id,String property_id,String feature_name, String type_name);
	 
	public String deleteproservice(String feature_id);
	
	public String editproservice(String feature_id,String property_id,String feature_name, String type_name);
	
}
