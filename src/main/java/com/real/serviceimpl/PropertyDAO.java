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

public class PropertyDAO {

	public List<AddProperty> getAllProperties() {
		List<AddProperty> allProperties = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();
			String query = "SELECT property_id, pname, pmobile, status, type, age, dimensions, city, highlights, amenities, price, listed_date, is_highlighted, sold_status FROM property";
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
				property.setSold_status(resultSet.getString("sold_status"));
				// Check for null in sold_status before setting it in your AddProperty ob
				allProperties.add(property);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return allProperties;
	}

	public AddProperty getPropertyById(String propertyId) {
		AddProperty property = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBUtil.provideConnection();
			String query = "SELECT property_id, pname,pmobile,status, type, age, dimensions,"
					+ " city, highlights, amenities, price, listed_date, "
					+ "is_highlighted FROM property WHERE property_id = ?";
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setString(1, propertyId);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				property = mapResultSetToProperty(resultSet);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return property;
	}

	public boolean addProperty(AddProperty property) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = DBUtil.provideConnection();
			String query = "INSERT INTO property (pname,pmobile,status, type, age, dimensions, city, highlights, amenities, price, listed_date, is_highlighted) VALUES (?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);

			setPropertyPreparedStatementValues(preparedStatement, property);

			int rowsInserted = preparedStatement.executeUpdate();
			return rowsInserted > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean updateProperty(AddProperty property) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = DBUtil.provideConnection();
			String query = "UPDATE property SET status = ?, type = ?, age = ?, dimensions = ?, city = ?, highlights = ?, amenities = ?, price = ?, listed_date = ?, is_highlighted = ? WHERE property_id = ?";
			preparedStatement = connection.prepareStatement(query);

			setPropertyPreparedStatementValues(preparedStatement, property);
			preparedStatement.setString(11, property.getPropertyId());

			int rowsUpdated = preparedStatement.executeUpdate();
			return rowsUpdated > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean deleteProperty(String propertyId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = DBUtil.provideConnection();
			String query = "DELETE FROM property WHERE property_id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, propertyId);

			int rowsDeleted = preparedStatement.executeUpdate();
			return rowsDeleted > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<AddPropertyFeatures> getFeaturesByPropertyId(String propertyId) {
		List<AddPropertyFeatures> propertyFeatures = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();
			String query = "SELECT feature_id, property_id, feature_name, type_name "
					+ " FROM property_features WHERE property_id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, propertyId);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				AddPropertyFeatures feature = new AddPropertyFeatures();
				feature.setFeature_id(resultSet.getString("feature_id"));
				feature.setProperty_id(resultSet.getString("property_id"));
				feature.setFeature_name(resultSet.getString("feature_name"));
				feature.setType_name(resultSet.getString("type_name"));

				propertyFeatures.add(feature);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return propertyFeatures;
	}

	public List<AddProperty> getPropertiesByIds(String[] propertyIds) {
		List<AddProperty> selectedProperties = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();
			// The IN clause is used to filter properties based on selected IDs
			String query = "SELECT property_id,pname,pmobile, status, type, age, dimensions, city, highlights, "
					+ "amenities, price, listed_date, is_highlighted FROM property " + "WHERE property_id IN (";
			for (int i = 0; i < propertyIds.length; i++) {
				query += "?";
				if (i < propertyIds.length - 1) {
					query += ",";
				}
			}
			query += ")";
			preparedStatement = connection.prepareStatement(query);

			// Set the property IDs to the prepared statement
			for (int i = 0; i < propertyIds.length; i++) {
				preparedStatement.setString(i + 1, propertyIds[i]);
			}

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				AddProperty property = mapResultSetToProperty(resultSet);
				selectedProperties.add(property);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return selectedProperties;
	}

	private AddProperty mapResultSetToProperty(ResultSet resultSet) throws SQLException {
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

		return property;
	}

	private void setPropertyPreparedStatementValues(PreparedStatement preparedStatement, AddProperty property)
			throws SQLException {
		preparedStatement.setString(1, property.getPname());
		preparedStatement.setString(2, property.getPmobile());
		preparedStatement.setString(3, property.getStatus());
		preparedStatement.setString(4, property.getType());
		preparedStatement.setString(5, property.getAge());
		preparedStatement.setString(6, property.getDimensions());
		preparedStatement.setString(7, property.getCity());
		preparedStatement.setString(8, property.getHighlights());
		preparedStatement.setString(9, property.getAmenities());
		preparedStatement.setString(10, property.getPrice());
		preparedStatement.setString(11, property.getListedDate());
		preparedStatement.setString(12, property.getIsHighlighted());
	}

	public static List<AddProperty> getFilteredProperties(String filter, int start, int limit) {
		List<AddProperty> filteredProperties = new ArrayList<>();

		try (Connection connection = DBUtil.provideConnection();
				PreparedStatement preparedStatement = prepareStatement(connection, filter, start, limit);
				ResultSet resultSet = preparedStatement.executeQuery()) {

			while (resultSet.next()) {
				AddProperty property = new AddProperty();

				property.setPropertyId(resultSet.getString("property_id"));
				property.setType(resultSet.getString("type"));
				property.setCity(resultSet.getString("city"));
				property.setStatus(resultSet.getString("status"));
				filteredProperties.add(property);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return filteredProperties;
	}

	private static PreparedStatement prepareStatement(Connection connection, String filter, int start, int limit)
			throws SQLException {
		String query;
		if (filter != null && !filter.isEmpty()) {
			query = "SELECT * FROM property WHERE " + filter + " LIMIT ?, ?;";
		} else {
			query = "SELECT * FROM property LIMIT ?, ?;";
		}

		PreparedStatement preparedStatement = connection.prepareStatement(query);
		preparedStatement.setInt(1, start);
		preparedStatement.setInt(2, limit);

		return preparedStatement;
	}

	public static List<AddProperty> searchProperties(String type, String status, String city) {
		List<AddProperty> searchResults = new ArrayList<>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();

			StringBuilder dynamicQuery = new StringBuilder();

			// Check and append conditions based on parameters
			if (type != null && !type.isEmpty()) {
				dynamicQuery.append(" AND type LIKE ?");
			}

			if (status != null && !status.isEmpty()) {
				dynamicQuery.append(" AND status LIKE ?");
			}

			if (city != null && !city.isEmpty()) {
				dynamicQuery.append(" AND city LIKE ?");
			}

			String query = "SELECT * FROM property WHERE 1=1 " + dynamicQuery.toString() + " LIMIT 0, 10;";

			preparedStatement = connection.prepareStatement(query);

			int parameterIndex = 1;

			// Set parameters based on conditions
			if (type != null && !type.isEmpty()) {
				preparedStatement.setString(parameterIndex++, "%" + type + "%");
			}

			if (status != null && !status.isEmpty()) {
				preparedStatement.setString(parameterIndex++, "%" + status + "%");
			}

			if (city != null && !city.isEmpty()) {
				preparedStatement.setString(parameterIndex++, "%" + city + "%");
			}

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				AddProperty property = new AddProperty();
				property.setPropertyId(resultSet.getString("property_id"));
				property.setType(resultSet.getString("type"));
				property.setStatus(resultSet.getString("status"));
				property.setCity(resultSet.getString("city"));
				searchResults.add(property);
			}
		} catch (SQLException e) {
			e.printStackTrace(); // Handle or log the exception appropriately
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return searchResults;
	}

	public static List<AddProperty> getPropertyBypId(String propertyId) {
		List<AddProperty> propertyList = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();
			String query = "SELECT property_id, pname, pmobile,status, type, age, dimensions, city, highlights, amenities, "
					+ "price, listed_date FROM property WHERE property_id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, propertyId);

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

				propertyList.add(property);
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
		return propertyList;
	}

	public static List<AddProperty> getPropertiesByType(String type) {
		List<AddProperty> properties = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();
			String query = "SELECT property_id, status, age, dimensions, city, highlights, amenities, price, listed_date, is_highlighted FROM property WHERE type = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, type);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				AddProperty property = mapResultSetToProperty1(resultSet);
				properties.add(property);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return properties;
	}

	public static List<Integer> getAllPropertyId() {
		List<Integer> properties = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();
			String query = "SELECT property_id FROM property";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				properties.add(resultSet.getInt(1));
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return properties;
	}

	private static AddProperty mapResultSetToProperty1(ResultSet resultSet) throws SQLException {
		AddProperty property = new AddProperty();
		property.setPropertyId(resultSet.getString("property_id"));
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

		return property;
	}

	public static List<AddProperty> searchPropertiesByType(String type, int start, int limit) {
		List<AddProperty> searchResults = new ArrayList<>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();

			String query = "SELECT * FROM property WHERE type like ? ";

			preparedStatement = connection.prepareStatement(query);

			// Set parameters based on the "type" parameter
			preparedStatement.setString(1, "%" + type + "%");

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				AddProperty property = new AddProperty();
				property.setPropertyId(resultSet.getString("property_id"));
				property.setPname(resultSet.getString("pname"));
				property.setPmobile(resultSet.getString("pmobile"));
				property.setType(resultSet.getString("type"));
				property.setPrice(resultSet.getString("price"));
				property.setCity(resultSet.getString("city"));
				property.setSold_status(resultSet.getString("sold_status"));
				searchResults.add(property);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return searchResults;
	}

}
