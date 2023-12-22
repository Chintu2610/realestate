package com.real.bean;

import javax.servlet.http.HttpServletRequest;

public class AddProperty {
    private String propertyId;
    private String pname;
	private String pmobile;
    private String status;
    private String type;
    private String age;
    private String dimensions;
    private String city;
    private String highlights;
    private String amenities;
    private String price;
    private String listedDate;
    private String isHighlighted;
    private String createdBy;
    private String image;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPmobile() {
		return pmobile;
	}

	public void setPmobile(String pmobile) {
		this.pmobile = pmobile;
	}

    public String getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(String propertyId) {
        this.propertyId = propertyId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getDimensions() {
        return dimensions;
    }

    public void setDimensions(String dimensions) {
        this.dimensions = dimensions;
    }

    public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getHighlights() {
        return highlights;
    }

    public void setHighlights(String highlights) {
        this.highlights = highlights;
    }

    public String getAmenities() {
        return amenities;
    }

    public void setAmenities(String amenities) {
        this.amenities = amenities;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getListedDate() {
        return listedDate;
    }

    public void setListedDate(String listedDate) {
        this.listedDate = listedDate;
    }

    public String getIsHighlighted() {
        return isHighlighted;
    }

    public void setIsHighlighted(String isHighlighted) {
        this.isHighlighted = isHighlighted;
    }

    public String getImageUrl(HttpServletRequest request) {
        // Provide the implementation for fetching the image URL based on the property ID and the request
        // Example: return request.getContextPath() + "/admin/property/" + propertyId + ".jpg";
        return request.getContextPath() + "/admin/property/" + propertyId + ".jpg";
    }

    public String getPropertyUrl() {
        // Provide the implementation for fetching the property URL based on the property ID
        // Example: return "admin/property/" + propertyId + ".jpg";
        return "admin/property/" + propertyId + ".jpg";
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

	public void setDescription(String description) {
		// TODO Auto-generated method stub
		
	}

	public void setUser(String user) {
		// TODO Auto-generated method stub
		
	}
}
