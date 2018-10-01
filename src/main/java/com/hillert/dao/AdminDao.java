package com.hillert.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.hillert.model.FacultyBean;
import com.hillert.model.PermissionBean;
import com.hillert.model.UserBean;
import com.hillert.util.ConnectDB;

@Service
public class AdminDao {
	
	// นับจำนวนใบฟอร์ม ที่ขออนุญาตไปราชการทั้งหมด
	public PermissionBean countPer() throws SQLException {
		PermissionBean bean = new PermissionBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(permission_id) AS permission FROM permission");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setPermissionId(rs.getInt("permission"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	// นับจำนวนใบฟอร์ม คณะครุศาสตร์ ที่ขออนุญาตไปราชการทั้งหมด
	public FacultyBean countFac1() throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(faculty_id) AS faculty \r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"WHERE f.faculty_id = 1");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setFacultyId(rs.getInt("faculty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	// นับจำนวนใบฟอร์ม คณะวิทยาศาสตร์ ที่ขออนุญาตไปราชการทั้งหมด
	public FacultyBean countFac2() throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(faculty_id) AS faculty \r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"WHERE f.faculty_id = 2");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setFacultyId(rs.getInt("faculty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	// นับจำนวนใบฟอร์ม คณะมนุษยศาสตร์และสังคมศาสตร์ ที่ขออนุญาตไปราชการทั้งหมด
	public FacultyBean countFac3() throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(faculty_id) AS faculty \r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"WHERE f.faculty_id = 3");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setFacultyId(rs.getInt("faculty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	// นับจำนวนใบฟอร์มคณะวิทยาการจัดการ ที่ขออนุญาตไปราชการทั้งหมด
	public FacultyBean countFac4() throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(faculty_id) AS faculty \r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"WHERE f.faculty_id = 4");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setFacultyId(rs.getInt("faculty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	
	// นับจำนวนใบฟอร์ม คณะเทคโนโลยีอุตสาหกรรม ที่ขออนุญาตไปราชการทั้งหมด
	public FacultyBean countFac5() throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(faculty_id) AS faculty \r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"WHERE f.faculty_id = 5");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setFacultyId(rs.getInt("faculty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	
	// นับจำนวนใบฟอร์ม คณะเทคโนโลยีการเกษตร  ที่ขออนุญาตไปราชการทั้งหมด
	public FacultyBean countFac6() throws SQLException {
		FacultyBean bean = new FacultyBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("SELECT COUNT(faculty_id) AS faculty \r\n" + 
					"FROM Permission \r\n" + 
					"INNER JOIN personnel_list pl ON pl.personnel_id =  permission.personnel_id  \r\n" + 
					"INNER JOIN user u on u.user_id = pl.user_id\r\n" + 
					"INNER JOIN department d on d.department_code = pl.department_code\r\n" + 
					"INNER JOIN faculty f on f.faculty_code = d.faculty_code\r\n" + 
					"INNER JOIN sub_position sp on sp.sub_position_code = pl.sub_position_code\r\n" + 
					"INNER JOIN position p on p.position_code = sp.position_code\r\n" + 
					"\r\n" + 
					"WHERE f.faculty_id = 6");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setFacultyId(rs.getInt("faculty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}
	
	//นับจำนวน user ทั้งหมด ที่อยู่ใน SQL
	public UserBean countUser() throws SQLException {
		UserBean bean = new UserBean();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();

		try {
			sql.append(" SELECT COUNT(user_id) AS user FROM user ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();
			while (rs.next()) {
				bean.setUserId(rs.getInt("user"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return bean;
	}

}
