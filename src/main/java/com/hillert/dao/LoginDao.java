package com.hillert.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.hillert.model.TestAjex;
import com.hillert.model.UserBean;
import com.hillert.util.ConnectDB;

@Repository
public class LoginDao {
	int userId; // เก็บ ID USER
	
	public List<UserBean> findAll() {
		List<UserBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT * FROM user ");
			prepared = con.openConnect().prepareStatement(sql.toString());

			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				UserBean bean = new UserBean();
				bean.setUserId(rs.getInt("user_id"));
				bean.setUserUsername(rs.getString("user_username"));
				bean.setUserPassword(rs.getString("user_password"));
				bean.setUserFname(rs.getString("user_fname"));
				bean.setUserLname(rs.getString("user_lname"));
				list.add(bean);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	
	//login Dao
	public UserBean login(String username, String password) throws SQLException {
		UserBean bean = new UserBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
		
		try {
			sql.append(" select * from user where user_username = ? and user_password = ? ");

			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, username);
			prepared.setString(2, password);

			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean.setUserId(rs.getInt("user_id"));
				bean.setUserUsername(rs.getString("user_username"));
				bean.setUserPassword(rs.getString("user_password"));
				bean.setUserFname(rs.getString("user_fname"));
				bean.setUserLname(rs.getString("user_lname"));
				bean.setSex(rs.getString("sex"));

				bean.setDate(rs.getDate("date"));
				bean.setRole(rs.getInt("role"));
				
				userId=bean.getUserId();
				//System.out.println(userId);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return bean;
	}
		
	// เก็บ ID USER และแปลงเพื่อใช้งาน เป็น String
	public TestAjex userId() {
		TestAjex bean = new TestAjex();
		bean.setUserID(userId);
		return bean;
	}
	
				
}
