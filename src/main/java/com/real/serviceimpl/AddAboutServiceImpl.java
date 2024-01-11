package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.real.service.AddAboutservice;
import com.real.utility.DBUtil;

public class AddAboutServiceImpl implements AddAboutservice {

	@Override
	public String addabout(String id, String title, String image, String content) {

		String status = "about Adding Failed!";

		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement("INSERT INTO about (id,title,content,image) VALUES (?,?,?,?)");
			ps.setString(1, id);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.setString(4, image);

			int k = ps.executeUpdate();

			if (k > 0) {
				status = "about Added Successfully!";
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

	@Override
	public String deleteabout(String id) {

		String status = "about Removal Failed!";

		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement("DELETE FROM about WHERE id = ?");
			ps.setString(1, id);

			int k = ps.executeUpdate();

			if (k > 0) {
				status = "about Removed Successfully!";
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

	@Override
	public String editabout(String id, String title, String content, String image) {
		String status = "about Failed!";

		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement("UPDATE about SET title =?, content =?, image =?  WHERE id=?");

			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, image);
			ps.setString(4, id);

			int k = ps.executeUpdate();

			if (k > 0) {
				status = "about Updated Successfully!";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(con);
			DBUtil.closeConnection(ps);
		}

		return status;

	}

}