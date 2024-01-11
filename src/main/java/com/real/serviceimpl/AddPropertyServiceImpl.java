package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.real.bean.AddProperty;
import com.real.bean.AddPropertyFeatures;
import com.real.utility.DBUtil;

public class AddPropertyServiceImpl {

	public static List<AddProperty> getFilteredProperties(String whereClause, int start, int limit) {
		List<AddProperty> filteredProperties = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();
			String query;
			if (whereClause != null && !whereClause.isEmpty()) {
				query = "SELECT property_id, pname, pmobile, status, type, age, dimensions, city, highlights, amenities, price, listed_date, is_highlighted, image ,sold_status"
						+ " FROM property WHERE sold_status != 'completed' or sold_status IS NULL " + whereClause
						+ " LIMIT ?, ?;";
			} else {
				query = "SELECT property_id, pname, pmobile, status, type, age, dimensions, city, highlights, amenities, price, listed_date, is_highlighted, image ,sold_status"
						+ " FROM property where sold_status != 'completed' or sold_status IS NULL LIMIT ?, ?;";
			}
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, start);
			preparedStatement.setInt(2, limit);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				AddProperty property = new AddProperty();
				property.setPropertyId(resultSet.getString("property_id"));
				property.setPname(resultSet.getString("pname"));
				property.setPmobile(resultSet.getString("pmobile"));
				property.setStatus(resultSet.getString("status"));
				property.setType(resultSet.getString("type"));
				property.setAge(resultSet.getString("age"));
				property.setDimensions(resultSet.getString("dimensions"));
				property.setCity(resultSet.getString("city"));
				property.setHighlights(resultSet.getString("highlights"));
				property.setAmenities(resultSet.getString("amenities"));
				property.setPrice(resultSet.getString("price"));
				property.setListedDate(resultSet.getString("listed_date"));
				property.setIsHighlighted(resultSet.getString("is_highlighted"));
				property.setImage(resultSet.getString("image"));
				property.setSold_status(resultSet.getString("sold_status"));
				filteredProperties.add(property);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return filteredProperties;
	}

	public List<AddProperty> adminGetFilteredProperties(String whereClause, int start, int limit) {
		List<AddProperty> filteredProperties = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();
			String query;
			if (whereClause != null && !whereClause.isEmpty()) {
				query = "SELECT property_id, pname, pmobile, status, type, age, dimensions, city, highlights, amenities, price, listed_date, is_highlighted, image ,sold_status"
						+ " FROM property  " + whereClause + " LIMIT ?, ?;";
			} else {
				query = "SELECT property_id, pname, pmobile, status, type, age, dimensions, city, highlights, amenities, price, listed_date, is_highlighted, image ,sold_status"
						+ " FROM property  LIMIT ?, ?;";
			}
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, start);
			preparedStatement.setInt(2, limit);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				AddProperty property = new AddProperty();
				property.setPropertyId(resultSet.getString("property_id"));
				property.setPname(resultSet.getString("pname"));
				property.setPmobile(resultSet.getString("pmobile"));
				property.setStatus(resultSet.getString("status"));
				property.setType(resultSet.getString("type"));
				property.setAge(resultSet.getString("age"));
				property.setDimensions(resultSet.getString("dimensions"));
				property.setCity(resultSet.getString("city"));
				property.setHighlights(resultSet.getString("highlights"));
				property.setAmenities(resultSet.getString("amenities"));
				property.setPrice(resultSet.getString("price"));
				property.setListedDate(resultSet.getString("listed_date"));
				property.setIsHighlighted(resultSet.getString("is_highlighted"));
				property.setImage(resultSet.getString("image"));
				property.setSold_status(resultSet.getString("sold_status"));
				filteredProperties.add(property);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return filteredProperties;
	}

	public static List<AddProperty> getMostViewProperties() {
		List<AddProperty> filteredProperties = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();
			String query;

			query = "select * from property order by view_count desc limit 4;";

			preparedStatement = connection.prepareStatement(query);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				AddProperty property = new AddProperty();
				property.setPropertyId(resultSet.getString("property_id"));
				property.setPname(resultSet.getString("pname"));
				property.setPmobile(resultSet.getString("pmobile"));
				property.setStatus(resultSet.getString("status"));
				property.setType(resultSet.getString("type"));
				property.setAge(resultSet.getString("age"));
				property.setDimensions(resultSet.getString("dimensions"));
				property.setCity(resultSet.getString("city"));
				property.setHighlights(resultSet.getString("highlights"));
				property.setAmenities(resultSet.getString("amenities"));
				property.setPrice(resultSet.getString("price"));
				property.setListedDate(resultSet.getString("listed_date"));
				property.setIsHighlighted(resultSet.getString("is_highlighted"));
				property.setImage(resultSet.getString("image"));
				property.setSold_status(resultSet.getString("sold_status"));
				filteredProperties.add(property);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return filteredProperties;
	}

	public String editProperty(String property_id, String pname, String pmobile, String status, String type, String age,
			String dimensions, String city, String highlights, String amenities, String price, String listed_date,
			String is_highlighted, String description, String user) {
		String statusMessage = "Updating Failed!";
		Connection connection = DBUtil.provideConnection();
		PreparedStatement preparedStatement = null;

		try {

			preparedStatement = connection.prepareStatement(
					"UPDATE property SET pname=?, pmobile=?,status=?, type=?, age=?, dimensions=?, city=?, highlights=?, amenities=?, price=?, listed_date=?, is_highlighted=?  WHERE property_id = ?");

			preparedStatement.setString(1, pname);
			preparedStatement.setString(2, pmobile);
			preparedStatement.setString(3, status);
			preparedStatement.setString(4, type);
			preparedStatement.setString(5, age);
			preparedStatement.setString(6, dimensions);
			preparedStatement.setString(7, city);
			preparedStatement.setString(8, highlights);
			preparedStatement.setString(9, amenities);
			preparedStatement.setString(10, price);
			preparedStatement.setString(11, listed_date);
			preparedStatement.setString(12, is_highlighted);
			preparedStatement.setString(13, property_id);

			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				statusMessage = "Updated Successfully!";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// Close the resources properly
			DBUtil.closeConnection(connection);
			DBUtil.closeConnection(preparedStatement);
		}
		Connection con1 = DBUtil.auditConnection();
		Connection con2 = DBUtil.auditConnection();
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;

		try {
			int id = 0;

			ps1 = con1.prepareStatement("SELECT property_id FROM property_audit  ORDER BY property_id DESC LIMIT 1");

			ResultSet rs = ps1.executeQuery();

			if (rs.next()) {
				id = rs.getInt("property_id");
			}

			ps2 = con2.prepareStatement(
					"UPDATE property_audit SET ModificationDescription=?, Lastmodifieduser=?, Lastmodifieddate=CURDATE() WHERE property_id=?");
			ps2.setString(1, description);
			ps2.setString(2, user);
			ps2.setInt(3, id);

			int auditRowCount = ps2.executeUpdate();

			if (auditRowCount > 0) {
				statusMessage = "Updated Successfully!";
			}

		} catch (SQLException e) {
			statusMessage = "Error: " + e.getMessage();
			e.printStackTrace();
		} finally {
			// Close the resources properly
			DBUtil.closeConnection(connection);
			DBUtil.closeConnection(preparedStatement);
		}

		return statusMessage;
	}

	public String deleteProperty(String property_id) {
		String status = "Property Removal Failed!";
		Connection con1 = DBUtil.provideConnection();
		Connection con = DBUtil.provideConnection();
		PreparedStatement ps1 = null;
		PreparedStatement ps = null;

		try {
			ps1 = con1.prepareStatement("DELETE FROM property_features WHERE property_id = ?");
			ps1.setString(1, property_id);
			ps = con.prepareStatement("DELETE FROM property WHERE property_id = ?");
			ps.setString(1, property_id);
			int l = ps1.executeUpdate();
			int k = ps.executeUpdate();

			if (k > 0 & l > 0) {
				status = "Property Removed Successfully!";
			}
		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(con);
			DBUtil.closeConnection(ps);
		}

		return status;
	}

	public static List<AddPropertyFeatures> getFeaturesByPropertyId(String propertyId) {
		List<AddPropertyFeatures> featuresByPropertyId = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();
			String query = "SELECT  property_id, feature_name, type_name FROM property_features WHERE property_id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, propertyId);

			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				AddPropertyFeatures feature = new AddPropertyFeatures();
				feature.setProperty_id(resultSet.getString("property_id"));
				feature.setFeature_name(resultSet.getString("feature_name"));
				feature.setType_name(resultSet.getString("type_name"));
				featuresByPropertyId.add(feature);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return featuresByPropertyId;
	}
}
