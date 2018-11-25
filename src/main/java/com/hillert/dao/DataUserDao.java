package com.hillert.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.hillert.model.DepartmentBean;
import com.hillert.model.FacultyBean;
import com.hillert.model.PositionBean;
import com.hillert.model.SubPositionBean;
import com.hillert.util.ConnectDB;


@Repository
public class DataUserDao {
	
	//Faculty1
		public List<FacultyBean> faculty1() throws SQLException{
			FacultyBean bean = new FacultyBean();
			List<FacultyBean> list = new ArrayList<>();
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement prepared = null;
			StringBuilder sql = new StringBuilder();
					
		    try {
				sql.append("SELECT * from faculty WHERE faculty_code = ? ");
				prepared = conn.prepareStatement(sql.toString());
				ResultSet rs = prepared.executeQuery();

				while (rs.next()) {
					bean = new FacultyBean();
					bean.setFacultyName(rs.getString("faculty_name"));
					bean.setFacultyCode(rs.getString("faculty_code"));
					bean.setFacultyStatus(rs.getString("faculty_status"));
					list.add(bean);
					
				}
			} catch (Exception e) {
						// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				conn.close();
			}
			return list;
		}
	
	//Faculty
	public List<FacultyBean> faculty() throws SQLException{
		FacultyBean bean = new FacultyBean();
		List<FacultyBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
				
	    try {
			sql.append("SELECT * from faculty ");
			prepared = conn.prepareStatement(sql.toString());
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean = new FacultyBean();
				bean.setFacultyName(rs.getString("faculty_name"));
				bean.setFacultyCode(rs.getString("faculty_code"));;
				bean.setFacultyStatus(rs.getString("faculty_Status"));;
				list.add(bean);
				
			}
		} catch (Exception e) {
					// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return list;
	}
	
	//DepartmentBean
	public List<DepartmentBean> department(String faculty) throws SQLException{
		DepartmentBean bean = new DepartmentBean();
		List<DepartmentBean> list = new ArrayList<>();
		ConnectDB con = new ConnectDB();
		Connection conn = con.openConnect();
		PreparedStatement prepared = null;
		StringBuilder sql = new StringBuilder();
				
	    try {
			sql.append("SELECT * FROM department d WHERE d.faculty_code =?");
			prepared = conn.prepareStatement(sql.toString());
			prepared.setString(1, faculty);
	
			ResultSet rs = prepared.executeQuery();

			while (rs.next()) {
				bean = new DepartmentBean();
				bean.setDepartmentName(rs.getString("department_name"));
				bean.setDepartmentCode(rs.getString("department_code"));
				bean.setFacultyCode(rs.getString("faculty_code"));
				bean.setDepartmentStatus(rs.getInt("department_status"));
				list.add(bean);
				
			}
		} catch (Exception e) {
				e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return list;
	}
	
	//Position
		public List<PositionBean> position() throws SQLException{	
			PositionBean bean = new PositionBean();
			List<PositionBean> list = new ArrayList<>();
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement prepared = null;
			StringBuilder sql = new StringBuilder();
					
		    try {
				sql.append("SELECT * from position ");
				prepared = conn.prepareStatement(sql.toString());
				ResultSet rs = prepared.executeQuery();

				while (rs.next()) {
					bean = new PositionBean();
					bean.setPositionName(rs.getString("position_name"));
					bean.setPositionCode(rs.getString("position_code"));
					bean.setPositionStatus(rs.getInt("position_status"));
					list.add(bean);
					
				}
			} catch (Exception e) {
						// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				conn.close();
			}
			return list;
		}
		
		//SubPosition
		public List<SubPositionBean> subPosition(String position) throws SQLException{
			SubPositionBean bean = new SubPositionBean();
			List<SubPositionBean> list = new ArrayList<>();			
			ConnectDB con = new ConnectDB();
			Connection conn = con.openConnect();
			PreparedStatement prepared = null;
			StringBuilder sql = new StringBuilder();
					
		    try {
				sql.append("SELECT * FROM sub_position WHERE position_code = ?");
				prepared = conn.prepareStatement(sql.toString());
				prepared.setString(1, position);
		
				ResultSet rs = prepared.executeQuery();

				while (rs.next()) {
					bean = new SubPositionBean();
					bean.setSubPositionName(rs.getString("sub_position_name"));
					bean.setSupPositionCode(rs.getString("sub_position_code"));
					bean.setPositionCode(rs.getString("position_code"));
					bean.setSubPositionStatus(rs.getInt("sub_position_status"));
					list.add(bean);
					
				}
			} catch (Exception e) {
					e.printStackTrace();
			}
			finally {
				conn.close();
			}
			return list;
		}
		
}
