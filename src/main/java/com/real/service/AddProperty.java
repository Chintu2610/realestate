package com.real.service;

public interface AddProperty {
	
	public String addproperty(String pname,String pmobile,String status,String type,String age, String dimensions,String city,String highlights,String amenities, String price,String listed_date, String is_highlighted, String image);
	 
	public String deleteproperty(String property_id);
	
	public String editproperty(String status,String type,String age, String dimensions,String city,String highlights,String amenities, String price,String listed_date, String is_highlighted, String image);

}
